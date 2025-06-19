module Setup exposing (run)

import BackendTask
import Generated.EffectDecoders
import Generated.EffectEncoders
import Json.Decode
import Json.Encode
import Pages.Script exposing (Script)
import TestData


encoded : String -> Json.Decode.Decoder a -> (a -> Json.Encode.Value) -> Json.Encode.Value
encoded jsonString decoder encoder =
    jsonString
        |> Json.Decode.decodeString (Json.Decode.list decoder)
        |> Result.map (Json.Encode.list encoder)
        |> Result.withDefault (Json.Encode.string "BROK")


body =
    Json.Encode.object
        [ ( "myDictJson", encoded TestData.myDictJson Generated.EffectDecoders.myDictDecoder Generated.EffectEncoders.myDictEncoder )
        , ( "myBoolJson", encoded TestData.myBoolJson Generated.EffectDecoders.myBoolDecoder Generated.EffectEncoders.myBoolEncoder )
        , ( "myCharJson", encoded TestData.myCharJson Generated.EffectDecoders.myCharDecoder Generated.EffectEncoders.myCharEncoder )
        , ( "myFloatJson", encoded TestData.myFloatJson Generated.EffectDecoders.myFloatDecoder Generated.EffectEncoders.myFloatEncoder )
        , ( "myIntJson", encoded TestData.myIntJson Generated.EffectDecoders.myIntDecoder Generated.EffectEncoders.myIntEncoder )
        , ( "myStringJson", encoded TestData.myStringJson Generated.EffectDecoders.myStringDecoder Generated.EffectEncoders.myStringEncoder )
        , ( "myListJson", encoded TestData.myListJson Generated.EffectDecoders.myListDecoder Generated.EffectEncoders.myListEncoder )
        , ( "myMaybeJson", encoded TestData.myMaybeJson Generated.EffectDecoders.myMaybeDecoder Generated.EffectEncoders.myMaybeEncoder )
        , ( "myResultJson", encoded TestData.myResultJson Generated.EffectDecoders.myResultDecoder Generated.EffectEncoders.myResultEncoder )
        , ( "myResult_Json", encoded TestData.myResult_Json Generated.EffectDecoders.myResult_Decoder Generated.EffectEncoders.myResult_Encoder )
        , ( "myRecordJson", encoded TestData.myRecordJson Generated.EffectDecoders.myRecordDecoder Generated.EffectEncoders.myRecordEncoder )
        , ( "myRecordLongJson", encoded TestData.myRecordLongJson Generated.EffectDecoders.myRecordLongDecoder Generated.EffectEncoders.myRecordLongEncoder )
        , ( "myRecordComplexJson", encoded TestData.myRecordComplexJson Generated.EffectDecoders.myRecordComplexDecoder Generated.EffectEncoders.myRecordComplexEncoder )
        , ( "myCustomTypeJson", encoded TestData.myCustomTypeJson Generated.EffectDecoders.myNewTypeDecoder Generated.EffectEncoders.myNewTypeEncoder )
        , ( "myCustomTypeLongerJson", encoded TestData.myCustomTypeLongerJson Generated.EffectDecoders.myNewTypeTwoDecoder Generated.EffectEncoders.myNewTypeTwoEncoder )
        , ( "myRecordWithCustomTypeJson", encoded TestData.myRecordWithCustomTypeJson Generated.EffectDecoders.myRecordWithCustomTypeDecoder Generated.EffectEncoders.myRecordWithCustomTypeEncoder )
        , ( "myDictJson", encoded TestData.myDictJson Generated.EffectDecoders.myDictDecoder Generated.EffectEncoders.myDictEncoder )
        , ( "myComplexDictJson", encoded TestData.myComplexDictJson Generated.EffectDecoders.myComplexDictDecoder Generated.EffectEncoders.myComplexDictEncoder )
        , ( "myTupleJson", encoded TestData.myTupleJson Generated.EffectDecoders.myTupleDecoder Generated.EffectEncoders.myTupleEncoder )
        , ( "myKeyTupleDictJson", encoded TestData.myKeyTupleDictJson Generated.EffectDecoders.myKeyTupleDictDecoder Generated.EffectEncoders.myKeyTupleDictEncoder )
        , ( "myNestedTupleJson", encoded TestData.myNestedTupleJson Generated.EffectDecoders.myNestedTupleDecoder Generated.EffectEncoders.myNestedTupleEncoder )
        , ( "myNestedDictJson", encoded TestData.myNestedDictJson Generated.EffectDecoders.myNestedDictDecoder Generated.EffectEncoders.myNestedDictEncoder )
        , ( "myTripleJson", encoded TestData.myTripleJson Generated.EffectDecoders.myTripleDecoder Generated.EffectEncoders.myTripleEncoder )
        , ( "myNestedTripleJson", encoded TestData.myNestedTripleJson Generated.EffectDecoders.myNestedTripleDecoder Generated.EffectEncoders.myNestedTripleEncoder )
        , ( "mySetJson", encoded TestData.mySetJson Generated.EffectDecoders.mySetDecoder Generated.EffectEncoders.mySetEncoder )
        , ( "myArrayJson", encoded TestData.myArrayJson Generated.EffectDecoders.myArrayDecoder Generated.EffectEncoders.myArrayEncoder )
        , ( "myComplexArrayJson", encoded TestData.myComplexArrayJson Generated.EffectDecoders.myComplexArrayDecoder Generated.EffectEncoders.myComplexArrayEncoder )
        , ( "myNestedArrayJson", encoded TestData.myNestedArrayJson Generated.EffectDecoders.myNestedArrayDecoder Generated.EffectEncoders.myNestedArrayEncoder )
        ]
        |> Json.Encode.encode 2


run : Script
run =
    Pages.Script.withoutCliOptions
        (Pages.Script.writeFile
            { path = "./test/elmData.json"
            , body = body
            }
            |> BackendTask.allowFatal
            |> BackendTask.andThen (\_ -> Pages.Script.log "JSON file written successfully")
        )
