module Tests exposing (..)

import Expect
import Json.Decode
import Generated.EffectDecoders as EffectDecoders
import Test exposing (Test)
import TestData


suite : Test
suite =
    Test.describe "generated decoders vs Effect arbitraries"
        [ Test.test "Char decoder" <|
            \_ ->
                Json.Decode.decodeString (Json.Decode.list EffectDecoders.charDecoder) TestData.jsonChar
                    |> Expect.ok
        , Test.test "Float decoder" <|
            \_ ->
                Json.Decode.decodeString (Json.Decode.list EffectDecoders.floatDecoder) TestData.jsonFloat
                    |> Debug.log "FAIL"
                    |> Expect.ok
        , Test.test "String decoder" <|
            \_ ->
                Json.Decode.decodeString (Json.Decode.list EffectDecoders.stringDecoder) TestData.jsonString
                    |> Expect.ok
        , Test.test "Int decoder" <|
            \_ ->
                Json.Decode.decodeString (Json.Decode.list EffectDecoders.intDecoder) TestData.jsonInt
                    |> Expect.ok
        , Test.test "Bool decoder" <|
            \_ ->
                Json.Decode.decodeString (Json.Decode.list EffectDecoders.boolDecoder) TestData.jsonBool
                    |> Expect.ok
        , Test.test "List String decoder" <|
            \_ ->
                Json.Decode.decodeString (Json.Decode.list EffectDecoders.listStringDecoder) TestData.jsonListString
                    |> Expect.ok
        , Test.test "Maybe Int decoder" <|
            \_ ->
                Json.Decode.decodeString (Json.Decode.list EffectDecoders.maybeIntDecoder) TestData.jsonMaybeInt
                    |> Expect.ok
        , Test.test "Maybe Char decoder" <|
            \_ ->
                Json.Decode.decodeString (Json.Decode.list EffectDecoders.maybeCharDecoder) TestData.jsonMaybeChar
                    |> Expect.ok
        , Test.test "Result String Int decoder" <|
            \_ ->
                Json.Decode.decodeString (Json.Decode.list EffectDecoders.resultStringIntDecoder) TestData.jsonResultStringInt
                    |> Expect.ok
        , Test.test "Result String (Maybe (List String))" <|
            \_ ->
                Json.Decode.decodeString (Json.Decode.list EffectDecoders.resultStringMaybeListStringDecoder) TestData.jsonResultStringListString
                    |> Expect.ok
        , Test.test "Result String (Result String (Maybe (List String)))" <|
            \_ ->
                Json.Decode.decodeString (Json.Decode.list EffectDecoders.resultStringResultStringMaybeListStringDecoder) TestData.jsonResultStringListStringString
                    |> Expect.ok
        , Test.test "Record { one : Char, two : String }" <| 
            \_ -> 
                Json.Decode.decodeString (Json.Decode.list EffectDecoders.recordoneChartwoStringDecoder) TestData.jsonRecord
                    |> Expect.ok
        ]
