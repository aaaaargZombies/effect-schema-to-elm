module Tests exposing (..)

import Expect
import Generated.EffectDecoders as EffectDecoders
import Generated.EffectEncoders as EffectEncoders
import Json.Decode
import Json.Encode
import Test exposing (Test)
import TestData


decoderTestHelper : String -> String -> Json.Decode.Decoder a -> Test
decoderTestHelper description input decoder =
    Test.test description <|
        \_ ->
            Json.Decode.decodeString (Json.Decode.list decoder) input
                |> Expect.ok


encoderTestHelper : String -> String -> Json.Decode.Decoder a -> (a -> Json.Encode.Value) -> Test
encoderTestHelper description input decoder encoder =
    Test.test description <|
        \_ ->
            Json.Decode.decodeString (Json.Decode.list decoder) input
                |> Result.map (\decoded -> Json.Encode.list encoder decoded)
                |> Result.andThen (Json.Decode.decodeValue (Json.Decode.list decoder))
                |> Expect.ok


suite : Test
suite =
    Test.describe "suit"
        [ Test.describe "generated decoders vs Effect arbitraries"
            [ decoderTestHelper "Bool decoder" TestData.myBoolJson EffectDecoders.myBoolDecoder
            , decoderTestHelper "Char decoder" TestData.myCharJson EffectDecoders.myCharDecoder
            , decoderTestHelper "Float decoder" TestData.myFloatJson EffectDecoders.myFloatDecoder
            , decoderTestHelper "Int decoder" TestData.myIntJson EffectDecoders.myIntDecoder
            , decoderTestHelper "String decoder" TestData.myStringJson EffectDecoders.myStringDecoder
            , decoderTestHelper "List String decoder" TestData.myListJson EffectDecoders.myListDecoder
            , decoderTestHelper "Maybe Int decoder" TestData.myMaybeJson EffectDecoders.myMaybeDecoder
            , decoderTestHelper "Result String Int decoder" TestData.myResultJson EffectDecoders.myResultDecoder
            , decoderTestHelper "Result Complex decoder" TestData.myResult_Json EffectDecoders.myResult_Decoder
            , decoderTestHelper "Record { one : Char, two : String }" TestData.myRecordJson EffectDecoders.myRecordDecoder
            , decoderTestHelper "Record decoder 10 Char entries" TestData.myRecordLongJson EffectDecoders.myRecordLongDecoder
            , decoderTestHelper "Record Complex decoder" TestData.myRecordComplexJson EffectDecoders.myRecordComplexDecoder
            , decoderTestHelper "Custom Type decoder" TestData.myCustomTypeJson EffectDecoders.myNewTypeDecoder
            , decoderTestHelper "Record with a Custom Type decoder" TestData.myRecordWithCustomTypeJson EffectDecoders.myRecordWithCustomTypeDecoder
            ]
        , Test.describe "generated encoders vs Effect arbitraries"
            [ encoderTestHelper "Bool decoder" TestData.myBoolJson EffectDecoders.myBoolDecoder EffectEncoders.myBoolEncoder
            , encoderTestHelper "Char decoder" TestData.myCharJson EffectDecoders.myCharDecoder EffectEncoders.myCharEncoder
            , encoderTestHelper "Float decoder" TestData.myFloatJson EffectDecoders.myFloatDecoder EffectEncoders.myFloatEncoder
            , encoderTestHelper "Int decoder" TestData.myIntJson EffectDecoders.myIntDecoder EffectEncoders.myIntEncoder
            , encoderTestHelper "String decoder" TestData.myStringJson EffectDecoders.myStringDecoder EffectEncoders.myStringEncoder
            , encoderTestHelper "List String decoder" TestData.myListJson EffectDecoders.myListDecoder EffectEncoders.myListEncoder
            , encoderTestHelper "Maybe Int decoder" TestData.myMaybeJson EffectDecoders.myMaybeDecoder EffectEncoders.myMaybeEncoder
            , encoderTestHelper "Result String Int decoder" TestData.myResultJson EffectDecoders.myResultDecoder EffectEncoders.myResultEncoder
            , encoderTestHelper "Result Complex decoder" TestData.myResult_Json EffectDecoders.myResult_Decoder EffectEncoders.myResult_Encoder
            , encoderTestHelper "Record { one : Char, two : String }" TestData.myRecordJson EffectDecoders.myRecordDecoder EffectEncoders.myRecordEncoder
            , encoderTestHelper "Record decoder 10 Char entries" TestData.myRecordLongJson EffectDecoders.myRecordLongDecoder EffectEncoders.myRecordLongEncoder
            , encoderTestHelper "Record Complex decoder" TestData.myRecordComplexJson EffectDecoders.myRecordComplexDecoder EffectEncoders.myRecordComplexEncoder
            , encoderTestHelper "Custom Type decoder" TestData.myCustomTypeJson EffectDecoders.myNewTypeDecoder EffectEncoders.myNewTypeEncoder
            , encoderTestHelper "Record with a Custom Type decoder" TestData.myRecordWithCustomTypeJson EffectDecoders.myRecordWithCustomTypeDecoder EffectEncoders.myRecordWithCustomTypeEncoder
            ]
        ]
