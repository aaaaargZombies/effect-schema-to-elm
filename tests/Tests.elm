module Tests exposing (..)

import Expect
import Json.Decode
import MyFirstFile
import Test exposing (Test)
import TestData


suite : Test
suite =
    Test.describe "generated decoders vs Effect arbitraries"
        [ Test.test "Char decoder" <|
            \_ ->
                Json.Decode.decodeString (Json.Decode.list MyFirstFile.charDecoder) TestData.jsonChar
                    |> Expect.ok
        , Test.test "Float decoder" <|
            \_ ->
                Json.Decode.decodeString (Json.Decode.list MyFirstFile.floatDecoder) TestData.jsonFloat
                    |> Debug.log "FAIL"
                    |> Expect.ok
        , Test.test "String decoder" <|
            \_ ->
                Json.Decode.decodeString (Json.Decode.list MyFirstFile.stringDecoder) TestData.jsonString
                    |> Expect.ok
        , Test.test "Int decoder" <|
            \_ ->
                Json.Decode.decodeString (Json.Decode.list MyFirstFile.intDecoder) TestData.jsonInt
                    |> Expect.ok
        , Test.test "Bool decoder" <|
            \_ ->
                Json.Decode.decodeString (Json.Decode.list MyFirstFile.boolDecoder) TestData.jsonBool
                    |> Expect.ok
        , Test.test "List String decoder" <|
            \_ ->
                Json.Decode.decodeString (Json.Decode.list MyFirstFile.listStringDecoder) TestData.jsonListString
                    |> Expect.ok
        , Test.test "Maybe Int decoder" <|
            \_ ->
                Json.Decode.decodeString (Json.Decode.list MyFirstFile.maybeIntDecoder) TestData.jsonMaybeInt
                    |> Expect.ok
        , Test.test "Maybe Char decoder" <|
            \_ ->
                Json.Decode.decodeString (Json.Decode.list MyFirstFile.maybeCharDecoder) TestData.jsonMaybeChar
                    |> Expect.ok
        , Test.test "Result String Int decoder" <|
            \_ ->
                Json.Decode.decodeString (Json.Decode.list MyFirstFile.resultStringIntDecoder) TestData.jsonResultStringInt
                    |> Expect.ok
        ]
