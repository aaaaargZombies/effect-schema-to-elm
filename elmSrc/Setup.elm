module Setup exposing (run)

import BackendTask
import Generated.EffectDecoders
import Generated.EffectEncoders
import Helpers
import Json.Decode
import Json.Encode
import Pages.Script exposing (Script)
import TestData


encoded =
    TestData.myDictJson
        |> Json.Decode.decodeString (Json.Decode.list Generated.EffectDecoders.myDictDecoder)
        |> Result.map (Json.Encode.list Generated.EffectEncoders.myDictEncoder)
        |> Result.withDefault (Json.Encode.string "BROK")


body =
    Json.Encode.object [ ( "myDictJson", encoded ) ]
        |> Json.Encode.encode 0


run : Script
run =
    Pages.Script.withoutCliOptions
        (Pages.Script.writeFile
            { path = "./test/encodedData.json"
            , body = body
            }
            |> BackendTask.allowFatal
        )
