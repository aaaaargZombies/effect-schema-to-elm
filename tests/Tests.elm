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
            let
                input_ =
                    String.trim input
            in
            Json.Decode.decodeString (Json.Decode.list decoder) input_
                |> Result.map (\decoded -> Json.Encode.list encoder decoded)
                |> Result.map (Json.Decode.decodeValue (Json.Decode.list decoder))
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
            , decoderTestHelper "Dict decoder" TestData.myDictJson EffectDecoders.myDictDecoder
            , decoderTestHelper "Dict complex decoder" TestData.myComplexDictJson EffectDecoders.myComplexDictDecoder
            , decoderTestHelper "Tuple decoder" TestData.myTupleJson EffectDecoders.myTupleDecoder
            , decoderTestHelper "Dict with Tuple key decoder" TestData.myKeyTupleDictJson EffectDecoders.myKeyTupleDictDecoder
            , decoderTestHelper "nested Tuple decoder" TestData.myNestedTupleJson EffectDecoders.myNestedTupleDecoder
            , decoderTestHelper "nested Dict decoder" TestData.myNestedDictJson EffectDecoders.myNestedDictDecoder
            , decoderTestHelper "Triple decoder" TestData.myTripleJson EffectDecoders.myTripleDecoder
            , decoderTestHelper "NestedTriple decoder" TestData.myNestedTripleJson EffectDecoders.myNestedTripleDecoder
            , decoderTestHelper "Set decoder" TestData.mySetJson EffectDecoders.mySetDecoder
            , decoderTestHelper "Array decoder" TestData.myArrayJson EffectDecoders.myArrayDecoder
            , decoderTestHelper "ComplexArray decoder" TestData.myComplexArrayJson EffectDecoders.myComplexArrayDecoder
            , decoderTestHelper "NestedArray decoder" TestData.myNestedArrayJson EffectDecoders.myNestedArrayDecoder
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
            , encoderTestHelper "Record Complex encoder" TestData.myRecordComplexJson EffectDecoders.myRecordComplexDecoder EffectEncoders.myRecordComplexEncoder
            , encoderTestHelper "Custom Type decoder" TestData.myCustomTypeJson EffectDecoders.myNewTypeDecoder EffectEncoders.myNewTypeEncoder
            , encoderTestHelper "Record with a Custom Type encoder" TestData.myRecordWithCustomTypeJson EffectDecoders.myRecordWithCustomTypeDecoder EffectEncoders.myRecordWithCustomTypeEncoder
            , encoderTestHelper "Record with a Custom Type decoder" TestData.myDictJson EffectDecoders.myDictDecoder EffectEncoders.myDictEncoder
            , encoderTestHelper "Dict complex encoder" TestData.myComplexDictJson EffectDecoders.myComplexDictDecoder EffectEncoders.myComplexDictEncoder
            , encoderTestHelper "Tuple encoder" TestData.myTupleJson EffectDecoders.myTupleDecoder EffectEncoders.myTupleEncoder
            , encoderTestHelper "Dict with Tuple key decoder" TestData.myKeyTupleDictJson EffectDecoders.myKeyTupleDictDecoder EffectEncoders.myKeyTupleDictEncoder
            , encoderTestHelper "nested Tuple encoder" TestData.myNestedTupleJson EffectDecoders.myNestedTupleDecoder EffectEncoders.myNestedTupleEncoder
            , encoderTestHelper "nested Dict encoder" TestData.myNestedDictJson EffectDecoders.myNestedDictDecoder EffectEncoders.myNestedDictEncoder
            , encoderTestHelper "Triple encoder" TestData.myTripleJson EffectDecoders.myTripleDecoder EffectEncoders.myTripleEncoder
            , encoderTestHelper "NestedTriple encoder" TestData.myNestedTripleJson EffectDecoders.myNestedTripleDecoder EffectEncoders.myNestedTripleEncoder
            , encoderTestHelper "Set encoder" TestData.mySetJson EffectDecoders.mySetDecoder EffectEncoders.mySetEncoder
            , encoderTestHelper "Array encoder" TestData.myArrayJson EffectDecoders.myArrayDecoder EffectEncoders.myArrayEncoder
            , encoderTestHelper "ComplexArray encoder" TestData.myComplexArrayJson EffectDecoders.myComplexArrayDecoder EffectEncoders.myComplexArrayEncoder
            , encoderTestHelper "NestedArray encoder" TestData.myNestedArrayJson EffectDecoders.myNestedArrayDecoder EffectEncoders.myNestedArrayEncoder
            ]
        ]
