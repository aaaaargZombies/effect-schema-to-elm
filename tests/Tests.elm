module Tests exposing (..)

import Expect
import Generated.EffectDecoders as EffectDecoders
import Json.Decode
import Test exposing (Test)
import TestData


suite : Test
suite =
    Test.describe "generated decoders vs Effect arbitraries"
        [ Test.test "Bool decoder" <|
            \_ ->
                Json.Decode.decodeString (Json.Decode.list EffectDecoders.myBoolDecoder) TestData.myBoolJson
                    |> Expect.ok
        , Test.test "Char decoder" <|
            \_ ->
                Json.Decode.decodeString (Json.Decode.list EffectDecoders.myCharDecoder) TestData.myCharJson
                    |> Debug.log "FAIL"
                    |> Expect.ok
        , Test.test "Float decoder" <|
            \_ ->
                Json.Decode.decodeString (Json.Decode.list EffectDecoders.myFloatDecoder) TestData.myFloatJson
                    |> Expect.ok
        , Test.test "Int decoder" <|
            \_ ->
                Json.Decode.decodeString (Json.Decode.list EffectDecoders.myIntDecoder) TestData.myIntJson
                    |> Expect.ok
        , Test.test "String decoder" <|
            \_ ->
                Json.Decode.decodeString (Json.Decode.list EffectDecoders.myStringDecoder) TestData.myStringJson
                    |> Expect.ok
        , Test.test "List String decoder" <|
            \_ ->
                Json.Decode.decodeString (Json.Decode.list EffectDecoders.myListDecoder) TestData.myListJson
                    |> Expect.ok
        , Test.test "Maybe Int decoder" <|
            \_ ->
                Json.Decode.decodeString (Json.Decode.list EffectDecoders.myMaybeDecoder) TestData.myMaybeJson
                    |> Expect.ok
        , Test.test "Result String Int decoder" <|
            \_ ->
                Json.Decode.decodeString (Json.Decode.list EffectDecoders.myResultDecoder) TestData.myResultJson
                    |> Expect.ok
        , Test.test "Result Complex decoder" <|
            \_ ->
                Json.Decode.decodeString (Json.Decode.list EffectDecoders.myResult_Decoder) TestData.myResult_Json
                    |> Expect.ok
        , Test.test "Record { one : Char, two : String }" <|
            \_ ->
                Json.Decode.decodeString (Json.Decode.list EffectDecoders.myRecordDecoder) TestData.myRecordJson
                    |> Expect.ok
        , Test.test "Record decoder 10 Char entries" <|
            \_ ->
                Json.Decode.decodeString (Json.Decode.list EffectDecoders.myRecordLongDecoder) TestData.myRecordLongJson
                    |> Expect.ok
        , Test.test "Record Complex decoder" <|
            \_ ->
                Json.Decode.decodeString (Json.Decode.list EffectDecoders.myRecordComplexDecoder) TestData.myRecordComplexJson
                    |> Expect.ok
        ]
