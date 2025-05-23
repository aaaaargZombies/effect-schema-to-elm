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
import Gen.Tuple
import Json.Decode



{-
   ▄▄▄▄    ▄▄▄▄  ▄    ▄   ▄▄   ▄▄▄▄▄  ▄▄   ▄
   █   ▀▄ ▄▀  ▀▄ ██  ██   ██     █    █▀▄  █
   █    █ █    █ █ ██ █  █  █    █    █ █▄ █
   █    █ █    █ █ ▀▀ █  █▄▄█    █    █  █ █
   █▄▄▄▀   █▄▄█  █    █ █    █ ▄▄█▄▄  █   ██
-}


type AST
    = Bool_
    | Char_
    | Float_
    | Int_
    | String_
    | List_ AST
    | Maybe_ AST
    | Result_ AST AST



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
        (Json.Decode.list decodeAST)
        generate


generate : List AST -> List Elm.File
generate data =
    [ Elm.file [ "MyFirstFile" ]
        (List.map
            astToDeclaration
            data
        )
    ]


astToDeclaration : AST -> Elm.Declaration
astToDeclaration ast =
    Elm.declaration (astToName ast ++ "Decoder")
        (Elm.withType (Gen.Json.Decode.annotation_.decoder (astToAnnotation ast)) (astToDecoder ast))


astToName : AST -> String
astToName ast =
    case ast of
        Bool_ ->
            "Bool"

        Char_ ->
            "Char"

        Float_ ->
            "Float"

        Int_ ->
            "Int"

        String_ ->
            "String"

        List_ a ->
            "List" ++ astToName a

        Maybe_ a ->
            "Maybe" ++ astToName a

        Result_ err ok ->
            "Result" ++ astToName err ++ astToName ok



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
        Bool_ ->
            Gen.Json.Decode.bool

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
                                    (Elm.Arg.customType "Just" Tuple.first)
                                )
                                Gen.Json.Decode.succeed
                            , Elm.Case.branch
                                Elm.Arg.ignore
                                (\_ ->
                                    Gen.Json.Decode.fail "Not a Char"
                                )
                            ]
                    )

        Float_ ->
            Gen.Json.Decode.float

        Int_ ->
            Gen.Json.Decode.int

        List_ ast_ ->
            Gen.Json.Decode.list (astToDecoder ast_)

        Maybe_ ast_ ->
            Gen.Json.Decode.oneOf
                [ Gen.Json.Decode.map2 Elm.tuple
                    (Gen.Json.Decode.field "_tag" Gen.Json.Decode.string)
                    (Gen.Json.Decode.field "value" (astToDecoder ast_))
                    |> Gen.Json.Decode.andThen
                        (\tuple ->
                            Elm.ifThen
                                (Elm.Op.equal (Gen.Tuple.first tuple) (Elm.string "Some"))
                                (Gen.Json.Decode.succeed (Elm.just (Gen.Tuple.second tuple)))
                                (Gen.Json.Decode.fail "Not a Just")
                        )
                , Gen.Json.Decode.andThen
                    (\tag ->
                        Elm.ifThen
                            (Elm.Op.equal tag (Elm.string "None"))
                            (Gen.Json.Decode.succeed Elm.nothing)
                            (Gen.Json.Decode.fail "Not a Nothing")
                    )
                    (Gen.Json.Decode.field "_tag" Gen.Json.Decode.string)
                ]

        -- {"_id":"Either","_tag":"Right","right":15}
        -- {"_id":"Either","_tag":"Left","left":"E7Oz~WOYEM"}
        Result_ err ok ->
            Gen.Json.Decode.oneOf
                [ Gen.Json.Decode.map2 Elm.tuple
                    (Gen.Json.Decode.field "_tag" Gen.Json.Decode.string)
                    (Gen.Json.Decode.field "right" (astToDecoder ok))
                    |> Gen.Json.Decode.andThen
                        (\tuple ->
                            Elm.ifThen
                                (Elm.Op.equal (Gen.Tuple.first tuple) (Elm.string "Right"))
                                (Gen.Json.Decode.succeed
                                    (Elm.apply
                                        (Elm.value
                                            { importFrom = [ "Result" ]
                                            , name = "Ok"
                                            , annotation =
                                                Just
                                                    (Type.namedWith
                                                        []
                                                        "Result"
                                                        [ Type.var "error", Type.var "value" ]
                                                    )
                                            }
                                        )
                                        [ Gen.Tuple.second tuple ]
                                    )
                                )
                                (Gen.Json.Decode.fail "Not a Ok")
                        )
                , Gen.Json.Decode.map2 Elm.tuple
                    (Gen.Json.Decode.field "_tag" Gen.Json.Decode.string)
                    (Gen.Json.Decode.field "left" (astToDecoder err))
                    |> Gen.Json.Decode.andThen
                        (\tuple ->
                            Elm.ifThen
                                (Elm.Op.equal (Gen.Tuple.first tuple) (Elm.string "Left"))
                                (Gen.Json.Decode.succeed
                                    (Elm.apply
                                        (Elm.value
                                            { importFrom = [ "Result" ]
                                            , name = "Err"
                                            , annotation =
                                                Just
                                                    (Type.namedWith
                                                        []
                                                        "Result"
                                                        [ Type.var "error", Type.var "value" ]
                                                    )
                                            }
                                        )
                                        [ Gen.Tuple.second tuple ]
                                    )
                                )
                                (Gen.Json.Decode.fail "Not a Err")
                        )
                ]

        String_ ->
            Gen.Json.Decode.string



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


astToAnnotation : AST -> Type.Annotation
astToAnnotation ast =
    case ast of
        Bool_ ->
            Type.bool

        Char_ ->
            Type.char

        Float_ ->
            Type.float

        Int_ ->
            Type.int

        String_ ->
            Type.string

        List_ a ->
            Type.list <| astToAnnotation a

        Maybe_ a ->
            Type.maybe <| astToAnnotation a

        Result_ err ok ->
            Type.result (astToAnnotation err) (astToAnnotation ok)



{-
   ▄▄▄▄▄  ▄▄   ▄   ▄▄▄  ▄▄▄▄▄▄  ▄▄▄▄ ▄▄▄▄▄▄▄
     █    █▀▄  █ ▄▀   ▀ █      █▀   ▀   █
     █    █ █▄ █ █   ▄▄ █▄▄▄▄▄ ▀█▄▄▄    █
     █    █  █ █ █    █ █          ▀█   █
   ▄▄█▄▄  █   ██  ▀▄▄▄▀ █▄▄▄▄▄ ▀▄▄▄█▀   █
-}
{- Basics -}


decodeAST : Json.Decode.Decoder AST
decodeAST =
    Json.Decode.oneOf
        [ -- Basics
          decodeBool
        , decodeChar
        , decodeFloat
        , decodeInt
        , decodeString

        -- Containers
        , decodeMaybe
        , decodeList
        , decodeResult
        ]


decodeBool : Json.Decode.Decoder AST
decodeBool =
    Json.Decode.andThen
        (\id ->
            if id == "Bool" then
                Json.Decode.succeed Bool_

            else
                Json.Decode.fail "Not a Bool"
        )
        (Json.Decode.at
            [ "annotations", "Symbol(ElmType)" ]
            Json.Decode.string
        )


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



{- Containers -}


decodeMaybe : Json.Decode.Decoder AST
decodeMaybe =
    Json.Decode.map2 Tuple.pair
        (Json.Decode.at
            [ "annotations", "Symbol(ElmType)" ]
            Json.Decode.string
        )
        (Json.Decode.at
            [ "to", "typeParameters" ]
            (Json.Decode.lazy (\_ -> Json.Decode.list decodeAST))
        )
        |> Json.Decode.andThen
            (\( elmType, asts ) ->
                if elmType == "Maybe" then
                    case asts of
                        [ ast ] ->
                            Json.Decode.succeed <| Maybe_ ast

                        _ ->
                            Json.Decode.fail "Failed to decode type param"

                else
                    Json.Decode.fail "Not a Maybe"
            )


decodeList : Json.Decode.Decoder AST
decodeList =
    Json.Decode.map2 Tuple.pair
        (Json.Decode.at
            [ "annotations", "Symbol(ElmType)" ]
            Json.Decode.string
        )
        (Json.Decode.at
            [ "rest" ]
            (Json.Decode.lazy (\_ -> Json.Decode.list (Json.Decode.field "type" decodeAST)))
        )
        |> Json.Decode.andThen
            (\( elmType, asts ) ->
                if elmType == "List" then
                    case asts of
                        [ ast ] ->
                            Json.Decode.succeed <| List_ ast

                        _ ->
                            Json.Decode.fail "Failed to decode type param"

                else
                    Json.Decode.fail "Not a List"
            )


decodeResult : Json.Decode.Decoder AST
decodeResult =
    Json.Decode.map2 Tuple.pair
        (Json.Decode.at
            [ "annotations", "Symbol(ElmType)" ]
            Json.Decode.string
        )
        (Json.Decode.at
            [ "to", "typeParameters" ]
            (Json.Decode.oneOf
                [ Json.Decode.lazy (\_ -> Json.Decode.list decodeAST)
                , decodeNestHelper
                ]
            )
        )
        |> Json.Decode.andThen
            (\( elmType, asts ) ->
                if elmType == "Result" then
                    case asts of
                        [ value, error ] ->
                            Json.Decode.succeed <| Result_ error value

                        _ ->
                            Json.Decode.fail "Failed to decode type param"

                else
                    Json.Decode.fail "Not a Result"
            )


decodeNestHelper : Json.Decode.Decoder (List AST)
decodeNestHelper =
    Json.Decode.lazy
        (\_ ->
            Json.Decode.at [ "typeParameters" ] (Json.Decode.list decodeAST)
        )
