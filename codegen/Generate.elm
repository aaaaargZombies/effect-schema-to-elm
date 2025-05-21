module Generate exposing (main)

{-| -}

import Elm
import Elm.Annotation as Type
import Elm.Arg
import Elm.Case
import Elm.Op
import Gen.CodeGen.Generate as Generate
import Gen.Json.Decode
import Gen.String
import Json.Decode



{-
     ▄▄▄  ▄▄▄▄▄▄ ▄▄   ▄ ▄▄▄▄▄▄ ▄▄▄▄▄    ▄▄  ▄▄▄▄▄▄▄ ▄▄▄▄▄▄
   ▄▀   ▀ █      █▀▄  █ █      █   ▀█   ██     █    █
   █   ▄▄ █▄▄▄▄▄ █ █▄ █ █▄▄▄▄▄ █▄▄▄▄▀  █  █    █    █▄▄▄▄▄
   █    █ █      █  █ █ █      █   ▀▄  █▄▄█    █    █
    ▀▄▄▄▀ █▄▄▄▄▄ █   ██ █▄▄▄▄▄ █    ▀ █    █   █    █▄▄▄▄▄
-}


main : Program Json.Decode.Value () ()
main =
    Generate.fromJson
        (Json.Decode.list decodeEffectData)
        generate


generate : List AST -> List Elm.File
generate asts =
    [ Elm.file [ "MyFirstFile" ]
        (List.indexedMap
            astToDeclaration
            asts
        )
    ]


astToDeclaration : Int -> AST -> Elm.Declaration
astToDeclaration n ast =
    Elm.declaration ("EffectDataDecoder" ++ String.fromInt n)
        (astToDecoder ast)



{-
   ▄▄▄▄    ▄▄▄▄  ▄    ▄   ▄▄   ▄▄▄▄▄  ▄▄   ▄
   █   ▀▄ ▄▀  ▀▄ ██  ██   ██     █    █▀▄  █
   █    █ █    █ █ ██ █  █  █    █    █ █▄ █
   █    █ █    █ █ ▀▀ █  █▄▄█    █    █  █ █
   █▄▄▄▀   █▄▄█  █    █ █    █ ▄▄█▄▄  █   ██
-}


type AST
    = Float_
    | Char_
    | String_
    | Int_



{-
   ▄▄▄▄▄  ▄▄   ▄   ▄▄▄  ▄▄▄▄▄▄  ▄▄▄▄ ▄▄▄▄▄▄▄
     █    █▀▄  █ ▄▀   ▀ █      █▀   ▀   █
     █    █ █▄ █ █   ▄▄ █▄▄▄▄▄ ▀█▄▄▄    █
     █    █  █ █ █    █ █          ▀█   █
   ▄▄█▄▄  █   ██  ▀▄▄▄▀ █▄▄▄▄▄ ▀▄▄▄█▀   █
-}


decodeEffectData : Json.Decode.Decoder AST
decodeEffectData =
    Json.Decode.oneOf
        [ decodeFloat
        , decodeChar
        , decodeString
        ]


decodeChar : Json.Decode.Decoder AST
decodeChar =
    Json.Decode.andThen
        (\id ->
            if id == "Char" then
                Json.Decode.succeed Char_

            else
                Json.Decode.fail "Not a Char"
        )
        (Json.Decode.at
            [ "annotations", "Symbol(ElmType)" ]
            -- [ "Refinement", "annotations", "Symbol(ElmType)" ]
            Json.Decode.string
        )


decodeFloat : Json.Decode.Decoder AST
decodeFloat =
    Json.Decode.andThen
        (\id ->
            if id == "Float" then
                Json.Decode.succeed Float_

            else
                Json.Decode.fail "Not a float"
        )
        (Json.Decode.at
            -- [ "NumberKeyword", "annotations", "Symbol(ElmType)" ]
            [ "annotations", "Symbol(ElmType)" ]
            Json.Decode.string
        )


decodeString : Json.Decode.Decoder AST
decodeString =
    Json.Decode.andThen
        (\id ->
            if id == "String" then
                Json.Decode.succeed String_

            else
                Json.Decode.fail "Not a String"
        )
        (Json.Decode.at
            [ "annotations", "Symbol(ElmType)" ]
            Json.Decode.string
        )


decodeInt : Json.Decode.Decoder AST
decodeInt =
    Json.Decode.andThen
        (\id ->
            if id == "Int" then
                Json.Decode.succeed Int_

            else
                Json.Decode.fail "Not a Int"
        )
        (Json.Decode.at
            [ "annotations", "Symbol(ElmType)" ]
            Json.Decode.string
        )



{-
   ▄▄▄▄   ▄▄▄▄▄▄   ▄▄▄   ▄▄▄▄  ▄▄▄▄   ▄▄▄▄▄▄ ▄▄▄▄▄   ▄▄▄▄
   █   ▀▄ █      ▄▀   ▀ ▄▀  ▀▄ █   ▀▄ █      █   ▀█ █▀   ▀
   █    █ █▄▄▄▄▄ █      █    █ █    █ █▄▄▄▄▄ █▄▄▄▄▀ ▀█▄▄▄
   █    █ █      █      █    █ █    █ █      █   ▀▄     ▀█
   █▄▄▄▀  █▄▄▄▄▄  ▀▄▄▄▀  █▄▄█  █▄▄▄▀  █▄▄▄▄▄ █    ▀ ▀▄▄▄█▀
-}


astToDecoder : AST -> Elm.Expression
astToDecoder ast =
    case ast of
        Float_ ->
            Gen.Json.Decode.float

        Char_ ->
            Gen.Json.Decode.string
                |> Gen.Json.Decode.andThen
                    (\string ->
                        Elm.Case.custom
                            (Gen.String.call_.uncons string)
                            (Type.maybe (Type.tuple Type.char Type.string))
                            [ Elm.Case.branch
                                (Elm.Arg.customType "Nothing" ())
                                (\_ ->
                                    Gen.Json.Decode.fail "Not a Char"
                                )
                            , Elm.Case.branch
                                (Elm.Arg.item
                                    (Elm.Arg.tuple (Elm.Arg.varWith "char" Type.char) (Elm.Arg.string ""))
                                    (Elm.Arg.customType "Just" (\( c, s ) -> c))
                                )
                                Gen.Json.Decode.succeed
                            , Elm.Case.branch
                                Elm.Arg.ignore
                                (\_ ->
                                    Gen.Json.Decode.fail "Not a Char"
                                )
                            ]
                    )

        String_ ->
            Gen.Json.Decode.string

        Int_ ->
            Gen.Json.Decode.int



{-
   ▄▄▄▄▄▄ ▄▄   ▄   ▄▄▄   ▄▄▄▄  ▄▄▄▄   ▄▄▄▄▄▄ ▄▄▄▄▄   ▄▄▄▄
   █      █▀▄  █ ▄▀   ▀ ▄▀  ▀▄ █   ▀▄ █      █   ▀█ █▀   ▀
   █▄▄▄▄▄ █ █▄ █ █      █    █ █    █ █▄▄▄▄▄ █▄▄▄▄▀ ▀█▄▄▄
   █      █  █ █ █      █    █ █    █ █      █   ▀▄     ▀█
   █▄▄▄▄▄ █   ██  ▀▄▄▄▀  █▄▄█  █▄▄▄▀  █▄▄▄▄▄ █    ▀ ▀▄▄▄█▀
-}
{-
     ▄▄   ▄▄   ▄ ▄▄   ▄  ▄▄▄▄ ▄▄▄▄▄▄▄   ▄▄  ▄▄▄▄▄▄▄ ▄▄▄▄▄   ▄▄▄▄  ▄▄   ▄  ▄▄▄▄
     ██   █▀▄  █ █▀▄  █ ▄▀  ▀▄   █      ██     █      █    ▄▀  ▀▄ █▀▄  █ █▀   ▀
    █  █  █ █▄ █ █ █▄ █ █    █   █     █  █    █      █    █    █ █ █▄ █ ▀█▄▄▄
    █▄▄█  █  █ █ █  █ █ █    █   █     █▄▄█    █      █    █    █ █  █ █     ▀█
   █    █ █   ██ █   ██  █▄▄█    █    █    █   █    ▄▄█▄▄   █▄▄█  █   ██ ▀▄▄▄█▀
-}
