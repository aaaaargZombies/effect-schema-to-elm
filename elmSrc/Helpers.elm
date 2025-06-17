module Helpers exposing (..)

import Generated.EffectDecoders as EffectDecoders
import Generated.EffectEncoders as EffectEncoders
import Json.Decode
import Json.Encode
import TestData


decodeEncodeString : Json.Decode.Decoder a -> (a -> Json.Encode.Value) -> String -> String
decodeEncodeString decoder encoder input =
    let
        input_ =
            String.trim input
    in
    Json.Decode.decodeString (Json.Decode.list decoder) input_
        |> Result.map (\decoded -> Json.Encode.list encoder decoded)
        |> Result.map (Json.Encode.encode 0)
        |> Result.withDefault ""
