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
                Json.Decode.decodeString (Json.Decode.list MyFirstFile.effectDataDecoder1) TestData.charJson
                    |> Debug.log "CHARS"
                    |> Expect.ok
        , Test.test "Float decoder" <|
            \_ ->
                Json.Decode.decodeString (Json.Decode.list MyFirstFile.effectDataDecoder0) TestData.floatJson
                    |> Debug.log "CHARS"
                    |> Expect.ok
        ]
