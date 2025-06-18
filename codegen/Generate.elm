module Generate exposing (main)

{-| -}

import Dict exposing (Dict)
import Elm exposing (Expression)
import Elm.Annotation as Type
import Elm.Arg
import Elm.Case
import Elm.Op
import Gen.CodeGen.Generate as Generate
import Gen.Dict
import Gen.Json.Decode
import Gen.Json.Decode.Extra
import Gen.Json.Encode
import Gen.List
import Gen.Set
import Gen.String
import Gen.Triple.Extra
import Gen.Tuple
import Json.Decode
import Set exposing (Set)
import Triple.Extra



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
    | Dict_ Comparable AST
    | Float_
    | Int_
    | String_
    | List_ AST
    | Maybe_ AST
    | Result_ AST AST
    | Record_ (Dict String AST)
    | Tuple2_ AST AST
    | Tuple3_ AST AST AST
    | CustomType String (List ( String, Dict String AST ))
    | Set_ Comparable



-- comparable permits Int, Float, Char, String, and lists/tuples of comparable values


type Comparable
    = Char__
    | Float__
    | Int__
    | String__
    | List__ Comparable
    | Tuple2__ Comparable Comparable
    | Tuple3__ Comparable Comparable Comparable


type alias Name =
    String


type alias Schemas =
    Dict Name AST



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
        (Json.Decode.dict decodeAST)
        generate


generate : Schemas -> List Elm.File
generate schemas =
    let
        listOf =
            schemas
                |> Dict.toList
    in
    [ Elm.file [ "Generated", "EffectTypes" ]
        (List.map astToTypeDeclaration listOf)
    , Elm.file [ "Generated", "EffectDecoders" ]
        (List.map
            astToDecoderDeclaration
            listOf
        )
    , Elm.file [ "Generated", "EffectEncoders" ]
        (List.map
            astToEncoderDeclaration
            listOf
        )
    ]


astToTypeDeclaration : ( String, AST ) -> Elm.Declaration
astToTypeDeclaration ( name, ast ) =
    let
        typeName =
            safeTypeName name
    in
    case ast of
        CustomType customTypeName varients ->
            Elm.customType (safeTypeName customTypeName)
                (List.map
                    (\( name_, params ) ->
                        Elm.variantWith
                            (safeTypeName name_)
                            (List.map
                                (\( _, ast_ ) ->
                                    astToAnnotation ast_
                                )
                                (Dict.toList params)
                            )
                    )
                    varients
                )

        _ ->
            Elm.alias typeName
                (astToAnnotation ast)


declarationName : ( String, AST ) -> String
declarationName decodedAstPair =
    case decodedAstPair of
        ( _, CustomType name _ ) ->
            safeValueName name

        ( name, _ ) ->
            safeValueName name


astToEncoderDeclaration : ( String, AST ) -> Elm.Declaration
astToEncoderDeclaration (( _, ast ) as pair) =
    Elm.declaration (declarationName pair ++ "Encoder")
        (Elm.withType
            (Type.function [ namedType pair ] Gen.Json.Encode.annotation_.value)
            (Elm.functionReduced "arg" (\arg -> astToEncoder ast arg))
        )


astToDecoderDeclaration : ( String, AST ) -> Elm.Declaration
astToDecoderDeclaration (( _, ast ) as pair) =
    Elm.declaration (declarationName pair ++ "Decoder")
        (Elm.withType (Gen.Json.Decode.annotation_.decoder (namedType pair))
            (astToDecoder ast)
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

        CustomType customTypeName variants ->
            Gen.Json.Decode.oneOf
                (List.map
                    (\( name_, params ) ->
                        let
                            listOfParams =
                                Dict.toList params
                        in
                        List.foldl
                            (\( name__, ast_ ) expression ->
                                Gen.Json.Decode.Extra.andMap (Gen.Json.Decode.field name__ (astToDecoder ast_)) expression
                            )
                            (Gen.Json.Decode.succeed
                                (Elm.value
                                    { importFrom = [ "Generated", "EffectTypes" ]
                                    , name = safeTypeName name_
                                    , annotation = Nothing
                                    }
                                )
                            )
                            listOfParams
                    )
                    variants
                )

        Float_ ->
            Gen.Json.Decode.float

        Int_ ->
            Gen.Json.Decode.int

        Dict_ key val ->
            Gen.Json.Decode.map Gen.Dict.call_.fromList
                (Gen.Json.Decode.list
                    (Gen.Json.Decode.map2 Gen.Tuple.pair
                        (Gen.Json.Decode.index 0 (astToDecoder (comparableToAst key)))
                        (Gen.Json.Decode.index 1 (astToDecoder val))
                    )
                )

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

        Record_ params ->
            let
                listOfParams =
                    Dict.toList params
            in
            List.foldl
                (\( name, ast_ ) expression ->
                    Gen.Json.Decode.Extra.andMap (Gen.Json.Decode.field name (astToDecoder ast_)) expression
                )
                (Gen.Json.Decode.succeed
                    (Elm.function
                        (List.map (\( name, _ ) -> ( name, Nothing )) listOfParams)
                        (\args ->
                            Elm.record
                                (List.map2
                                    (\( name, _ ) arg -> ( name, arg ))
                                    listOfParams
                                    args
                                )
                        )
                    )
                )
                listOfParams

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

        Tuple2_ a b ->
            Gen.Json.Decode.map2 Gen.Tuple.pair
                (Gen.Json.Decode.index 0 (astToDecoder a))
                (Gen.Json.Decode.index 1 (astToDecoder b))

        Tuple3_ a b c ->
            Gen.Json.Decode.map3 Gen.Triple.Extra.triple
                (Gen.Json.Decode.index 0 (astToDecoder a))
                (Gen.Json.Decode.index 1 (astToDecoder b))
                (Gen.Json.Decode.index 2 (astToDecoder c))

        Set_ a ->
            let
                decodeChild =
                    a |> comparableToAst |> astToDecoder
            in
            Gen.Json.Decode.map Gen.Set.call_.fromList
                (Gen.Json.Decode.list decodeChild)



{-
   ▄▄▄▄▄▄ ▄▄   ▄   ▄▄▄   ▄▄▄▄  ▄▄▄▄   ▄▄▄▄▄▄ ▄▄▄▄▄   ▄▄▄▄
   █      █▀▄  █ ▄▀   ▀ ▄▀  ▀▄ █   ▀▄ █      █   ▀█ █▀   ▀
   █▄▄▄▄▄ █ █▄ █ █      █    █ █    █ █▄▄▄▄▄ █▄▄▄▄▀ ▀█▄▄▄
   █      █  █ █ █      █    █ █    █ █      █   ▀▄     ▀█
   █▄▄▄▄▄ █   ██  ▀▄▄▄▀  █▄▄█  █▄▄▄▀  █▄▄▄▄▄ █    ▀ ▀▄▄▄█▀
-}


astToEncoder : AST -> (Expression -> Expression)
astToEncoder =
    astToEncoderInternal 0


astToEncoderInternal : Int -> AST -> (Expression -> Expression)
astToEncoderInternal depth ast =
    let
        astToEncoder_ =
            astToEncoderInternal (depth + 1)
    in
    case ast of
        Bool_ ->
            Gen.Json.Encode.call_.bool

        Char_ ->
            \arg -> Gen.Json.Encode.call_.string (Gen.String.call_.fromChar arg)

        CustomType customTypeName variants ->
            \arg ->
                Elm.Case.custom arg
                    (Type.named [ "Generated", "EffectTypes" ] customTypeName)
                    (List.map
                        (\( variantName, params ) ->
                            let
                                params_ =
                                    Dict.toList params
                            in
                            Elm.Case.branch
                                (Elm.Arg.customType variantName identity
                                    |> Elm.Arg.items
                                        (params_
                                            |> List.map (\( fieldName, _ ) -> Elm.Arg.var fieldName)
                                        )
                                )
                                (\args ->
                                    Gen.Json.Encode.object
                                        (Elm.tuple (Elm.string "_id") (Gen.Json.Encode.string customTypeName)
                                            :: Elm.tuple (Elm.string "_tag") (Gen.Json.Encode.string variantName)
                                            :: List.map2
                                                (\( fieldName, type_ ) arg_ -> Elm.tuple (Elm.string fieldName) (astToEncoder_ type_ arg_))
                                                params_
                                                args
                                        )
                                )
                        )
                        variants
                    )

        Float_ ->
            Gen.Json.Encode.call_.float

        Int_ ->
            Gen.Json.Encode.call_.int

        String_ ->
            Gen.Json.Encode.call_.string

        Dict_ key val ->
            -- [["length", -530028691]]
            -- [[ key     , val      ]]
            \dict ->
                dict
                    |> Gen.Dict.toList
                    |> Gen.List.call_.map
                        (Elm.fn
                            (Elm.Arg.var ("keyVal" ++ String.fromInt depth))
                            (\keyVal ->
                                Gen.Json.Encode.list identity
                                    [ astToEncoder_
                                        (comparableToAst key)
                                        (Gen.Tuple.first keyVal)
                                    , astToEncoder_ val (Gen.Tuple.second keyVal)
                                    ]
                            )
                        )
                    |> Gen.Json.Encode.call_.list (Elm.fn (Elm.Arg.var "a") (\a -> a))

        List_ a ->
            Gen.Json.Encode.call_.list (Elm.functionReduced "arg" (\arg -> astToEncoder_ a arg))

        Maybe_ a ->
            let
                paramEncoder =
                    astToEncoder_ a
            in
            \myMaybe ->
                Elm.Case.maybe myMaybe
                    { nothing =
                        -- { _tag: "None" },
                        Gen.Json.Encode.object
                            [ Elm.tuple (Elm.string "_tag") (Gen.Json.Encode.string "None")
                            ]
                    , just =
                        ( "value"
                        , \content ->
                            -- { _tag: "Some", value: 11 },
                            Gen.Json.Encode.object
                                [ Elm.tuple (Elm.string "_tag") (Gen.Json.Encode.string "Some")
                                , Elm.tuple (Elm.string "value") (paramEncoder content)
                                ]
                        )
                    }

        Result_ errorType valueType ->
            let
                errorEncoder =
                    astToEncoder_ errorType

                valueEncoder =
                    astToEncoder_ valueType
            in
            \myResult ->
                Elm.Case.result myResult
                    { ok =
                        Tuple.pair "ok" <|
                            \ok ->
                                -- { _tag: "Right", right: 499221720 },
                                Gen.Json.Encode.object
                                    [ Elm.tuple (Elm.string "_tag") (Gen.Json.Encode.string "Right")
                                    , Elm.tuple (Elm.string "right") (valueEncoder ok)
                                    ]
                    , err =
                        Tuple.pair "err" <|
                            \err ->
                                -- { _tag: "Left", left: "57$'-`" },
                                Gen.Json.Encode.object
                                    [ Elm.tuple (Elm.string "_tag") (Gen.Json.Encode.string "Left")
                                    , Elm.tuple (Elm.string "left") (errorEncoder err)
                                    ]
                    }

        Record_ dict ->
            let
                listOf =
                    Dict.toList dict
            in
            \myRecord ->
                Gen.Json.Encode.object
                    (List.map (\( name, ast_ ) -> Elm.tuple (Elm.string name) (astToEncoder_ ast_ (Elm.get name myRecord))) listOf)

        Tuple2_ a b ->
            \arg ->
                Gen.Json.Encode.list identity [ astToEncoder_ a (Gen.Tuple.first arg), astToEncoder_ b (Gen.Tuple.second arg) ]

        Tuple3_ a b c ->
            \arg ->
                Gen.Json.Encode.list
                    identity
                    [ astToEncoder_ a (Gen.Triple.Extra.first arg)
                    , astToEncoder_ b (Gen.Triple.Extra.second arg)
                    , astToEncoder_ c (Gen.Triple.Extra.third arg)
                    ]

        Set_ a ->
            let
                encodeChildren =
                    a |> comparableToAst |> astToEncoder_
            in
            \set ->
                set
                    |> Gen.Set.call_.toList
                    |> Gen.Json.Encode.call_.list (Elm.functionReduced "arg" (\arg -> encodeChildren arg))



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

        CustomType customTypeName _ ->
            Type.named [] (safeTypeName customTypeName)

        Float_ ->
            Type.float

        Int_ ->
            Type.int

        String_ ->
            Type.string

        Dict_ key val ->
            let
                key_ =
                    comparableToAst key
            in
            -- We do not use `Elm.Annotation.dict` here because it will NOT
            -- result in `import Dict` being generated in the module, due to
            -- a bug in elm-codegen.
            -- https://github.com/mdgriffith/elm-codegen/issues/106
            Gen.Dict.annotation_.dict (astToAnnotation key_) (astToAnnotation val)

        List_ a ->
            Type.list <| astToAnnotation a

        Maybe_ a ->
            Type.maybe <| astToAnnotation a

        Result_ err ok ->
            Type.result (astToAnnotation err) (astToAnnotation ok)

        Tuple2_ a b ->
            Type.tuple (astToAnnotation a) (astToAnnotation b)

        Tuple3_ a b c ->
            Type.triple (astToAnnotation a) (astToAnnotation b) (astToAnnotation c)

        Record_ dict ->
            Type.record
                (dict |> Dict.toList |> List.map (Tuple.mapSecond astToAnnotation))

        Set_ a ->
            Gen.Set.annotation_.set (a |> comparableToAst |> astToAnnotation)


namedType : ( String, AST ) -> Type.Annotation
namedType decodedAstPair =
    case decodedAstPair of
        ( _, CustomType name _ ) ->
            Type.named [ "Generated", "EffectTypes" ] (safeTypeName name)

        ( name, _ ) ->
            Type.named [ "Generated", "EffectTypes" ] (safeTypeName name)



{-
   ▄▄▄▄▄  ▄▄   ▄   ▄▄▄  ▄▄▄▄▄▄  ▄▄▄▄ ▄▄▄▄▄▄▄
     █    █▀▄  █ ▄▀   ▀ █      █▀   ▀   █
     █    █ █▄ █ █   ▄▄ █▄▄▄▄▄ ▀█▄▄▄    █
     █    █  █ █ █    █ █          ▀█   █
   ▄▄█▄▄  █   ██  ▀▄▄▄▀ █▄▄▄▄▄ ▀▄▄▄█▀   █
-}


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
        , decodeMaybeDecleration
        , decodeList
        , decodeResult
        , decodeResultDecleration
        , decodeRecord
        , decodeCustomType
        , decodeDict
        , decodeDictDeclaration
        , decodeTuple2
        , decodeTuple3
        , decodeSet
        ]



{- Basics -}


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


decodeMaybeDecleration : Json.Decode.Decoder AST
decodeMaybeDecleration =
    Json.Decode.map2 Tuple.pair
        (Json.Decode.at
            [ "annotations", "Symbol(effect/annotation/Description)" ]
            Json.Decode.string
        )
        (Json.Decode.at
            [ "typeParameters" ]
            (Json.Decode.lazy (\_ -> Json.Decode.list decodeAST))
        )
        |> Json.Decode.andThen
            (\( description, asts ) ->
                if String.startsWith "Option" description then
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
            (Json.Decode.lazy
                (\_ -> Json.Decode.list decodeAST)
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


decodeResultDecleration : Json.Decode.Decoder AST
decodeResultDecleration =
    Json.Decode.map2 Tuple.pair
        (Json.Decode.at
            [ "annotations", "Symbol(effect/annotation/Description)" ]
            Json.Decode.string
        )
        (Json.Decode.at
            [ "typeParameters" ]
            (Json.Decode.lazy
                (\_ -> Json.Decode.list decodeAST)
            )
        )
        |> Json.Decode.andThen
            (\( description, asts ) ->
                if String.startsWith "Either" description then
                    case asts of
                        [ value, error ] ->
                            Json.Decode.succeed <| Result_ error value

                        _ ->
                            Json.Decode.fail "Failed to decode type param"

                else
                    Json.Decode.fail "Not a Result"
            )


decodeRecord : Json.Decode.Decoder AST
decodeRecord =
    Json.Decode.map2 Tuple.pair
        (Json.Decode.at
            [ "annotations", "Symbol(ElmType)" ]
            Json.Decode.string
        )
        (Json.Decode.at [ "propertySignatures" ]
            (Json.Decode.list
                (Json.Decode.map2 Tuple.pair
                    (Json.Decode.at [ "name" ] Json.Decode.string)
                    (Json.Decode.at [ "type" ] (Json.Decode.lazy (\_ -> decodeAST)))
                )
            )
        )
        |> Json.Decode.andThen
            (\( elmType, content ) ->
                if elmType == "Record" then
                    Json.Decode.succeed <| Record_ (Dict.fromList content)

                else
                    Json.Decode.fail "Not a Record"
            )


decodeCustomType : Json.Decode.Decoder AST
decodeCustomType =
    Json.Decode.oneOf [ decodeMutlipleCustomType, decodeSingleCustomType ]
        |> Json.Decode.andThen
            (\literals ->
                case literals of
                    ( typeName, variantName, params ) :: [] ->
                        Json.Decode.succeed (CustomType typeName [ ( variantName, params ) ])

                    (( typeName, _, _ ) :: _) as variants ->
                        let
                            variants_ =
                                variants
                                    |> List.map (\( _, vName, params ) -> ( vName, params ))
                        in
                        Json.Decode.succeed (CustomType typeName variants_)

                    [] ->
                        Json.Decode.fail "Empty union schema - cannot create CustomType"
            )


decodeSingleCustomType : Json.Decode.Decoder (List ( String, String, Dict String AST ))
decodeSingleCustomType =
    Json.Decode.at [ "annotations", "Symbol(ElmType)" ] Json.Decode.string
        |> Json.Decode.andThen
            (\type_ ->
                if type_ == "CustomType" then
                    decodeLiteral
                        |> Json.Decode.map (\a -> [ a ])

                else
                    Json.Decode.fail "Not a CustomType"
            )


decodeMutlipleCustomType : Json.Decode.Decoder (List ( String, String, Dict String AST ))
decodeMutlipleCustomType =
    Json.Decode.at [ "annotations", "Symbol(ElmType)" ] Json.Decode.string
        |> Json.Decode.andThen
            (\type_ ->
                if type_ == "CustomType" then
                    Json.Decode.at [ "types" ] (Json.Decode.list decodeLiteral)

                else
                    Json.Decode.fail "Not a CustomType"
            )


decodeLiteral : Json.Decode.Decoder ( String, String, Dict String AST )
decodeLiteral =
    Json.Decode.at [ "_tag" ] Json.Decode.string
        |> Json.Decode.andThen
            (\tag ->
                if tag == "TypeLiteral" then
                    Json.Decode.at [ "propertySignatures" ] decodeLiteralHelper
                        |> Json.Decode.andThen
                            (\literals ->
                                case literals of
                                    (TypeName tName) :: (VariantName vName) :: [] ->
                                        Json.Decode.succeed ( tName, vName, Dict.empty )

                                    (TypeName tName) :: (VariantName vName) :: tail ->
                                        let
                                            params =
                                                tail
                                                    |> List.filterMap
                                                        (\helper ->
                                                            case helper of
                                                                TypeName _ ->
                                                                    Nothing

                                                                VariantName _ ->
                                                                    Nothing

                                                                Param val ->
                                                                    Just val
                                                        )
                                                    |> Dict.fromList
                                        in
                                        Json.Decode.succeed ( tName, vName, params )

                                    _ ->
                                        Json.Decode.fail "Single CustomType missing name"
                            )

                else
                    Json.Decode.fail "Not a TypeLiteral"
            )


decodeDict : Json.Decode.Decoder AST
decodeDict =
    Json.Decode.at [ "annotations", "Symbol(ElmType)" ] Json.Decode.string
        |> Json.Decode.andThen
            (\type_ ->
                if type_ == "Dict" then
                    Json.Decode.map2 Tuple.pair
                        (Json.Decode.at
                            [ "to", "typeParameters" ]
                            (Json.Decode.index 0 decodeAST)
                        )
                        (Json.Decode.at
                            [ "to", "typeParameters" ]
                            (Json.Decode.index 1 decodeAST)
                        )
                        |> Json.Decode.andThen
                            (\( key, val ) ->
                                case astToComparable key of
                                    Just key_ ->
                                        Json.Decode.succeed <| Dict_ key_ val

                                    Nothing ->
                                        Json.Decode.fail "Not a Dict"
                            )

                else
                    Json.Decode.fail "Not a Dict"
            )


decodeDictDeclaration : Json.Decode.Decoder AST
decodeDictDeclaration =
    Json.Decode.map2 Tuple.pair
        (Json.Decode.at
            [ "annotations", "Symbol(effect/annotation/Description)" ]
            Json.Decode.string
        )
        (Json.Decode.at
            [ "typeParameters" ]
            (Json.Decode.lazy
                (\_ -> Json.Decode.list decodeAST)
            )
        )
        |> Json.Decode.andThen
            (\( description, asts ) ->
                if String.startsWith "HashMap" description then
                    case asts of
                        [ key, value ] ->
                            case astToComparable key of
                                Just key_ ->
                                    Json.Decode.succeed <| Dict_ key_ value

                                Nothing ->
                                    Json.Decode.fail "Dict key not Comparable"

                        _ ->
                            Json.Decode.fail "Failed to decode type param"

                else
                    Json.Decode.fail "Not a Dict"
            )


decodeTuple2 : Json.Decode.Decoder AST
decodeTuple2 =
    Json.Decode.at [ "annotations", "Symbol(ElmType)" ] Json.Decode.string
        |> Json.Decode.andThen
            (\type_ ->
                if type_ == "Tuple2" then
                    Json.Decode.map2 Tuple.pair
                        (Json.Decode.at [ "elements" ] (Json.Decode.index 0 (Json.Decode.at [ "type" ] decodeAST)))
                        (Json.Decode.at [ "elements" ] (Json.Decode.index 1 (Json.Decode.at [ "type" ] decodeAST)))
                        |> Json.Decode.andThen
                            (\( a, b ) -> Json.Decode.succeed <| Tuple2_ a b)

                else
                    Json.Decode.fail "Not a Tuple2"
            )


decodeTuple3 : Json.Decode.Decoder AST
decodeTuple3 =
    Json.Decode.at [ "annotations", "Symbol(ElmType)" ] Json.Decode.string
        |> Json.Decode.andThen
            (\type_ ->
                if type_ == "Tuple3" then
                    Json.Decode.map3 Triple.Extra.triple
                        (Json.Decode.at [ "elements" ] (Json.Decode.index 0 (Json.Decode.at [ "type" ] decodeAST)))
                        (Json.Decode.at [ "elements" ] (Json.Decode.index 1 (Json.Decode.at [ "type" ] decodeAST)))
                        (Json.Decode.at [ "elements" ] (Json.Decode.index 2 (Json.Decode.at [ "type" ] decodeAST)))
                        |> Json.Decode.andThen
                            (\( a, b, c ) -> Json.Decode.succeed <| Tuple3_ a b c)

                else
                    Json.Decode.fail "Not a Tuple3"
            )


decodeSet : Json.Decode.Decoder AST
decodeSet =
    Json.Decode.at [ "annotations", "Symbol(ElmType)" ] Json.Decode.string
        |> Json.Decode.andThen
            (\type_ ->
                if type_ == "Set" then
                    Json.Decode.at
                        [ "to", "typeParameters" ]
                        (Json.Decode.index 0 decodeAST)
                        |> Json.Decode.andThen
                            (\param ->
                                case astToComparable param of
                                    Just param_ ->
                                        Json.Decode.succeed <| Set_ param_

                                    Nothing ->
                                        Json.Decode.fail "Sets can only contain Comparable types"
                            )

                else
                    Json.Decode.fail "Not a Set"
            )



{-
   ▄    ▄ ▄▄▄▄▄▄ ▄      ▄▄▄▄▄  ▄▄▄▄▄▄ ▄▄▄▄▄   ▄▄▄▄
   █    █ █      █      █   ▀█ █      █   ▀█ █▀   ▀
   █▄▄▄▄█ █▄▄▄▄▄ █      █▄▄▄█▀ █▄▄▄▄▄ █▄▄▄▄▀ ▀█▄▄▄
   █    █ █      █      █      █      █   ▀▄     ▀█
   █    █ █▄▄▄▄▄ █▄▄▄▄▄ █      █▄▄▄▄▄ █    ▀ ▀▄▄▄█▀
-}


type LiteralHelper
    = TypeName String
    | VariantName String
    | Param ( String, AST )


decodeLiteralHelper : Json.Decode.Decoder (List LiteralHelper)
decodeLiteralHelper =
    Json.Decode.oneOf
        [ Json.Decode.at [ "name" ] Json.Decode.string
            |> Json.Decode.andThen
                (\name ->
                    if name == "_id" then
                        Json.Decode.at [ "type", "literal" ] Json.Decode.string
                            |> Json.Decode.map (\literal -> TypeName literal)

                    else if name == "_tag" then
                        Json.Decode.at [ "type", "literal" ] Json.Decode.string
                            |> Json.Decode.map (\literal -> VariantName literal)

                    else
                        Json.Decode.fail "Not the _tag property"
                )
        , Json.Decode.map2 (\name type_ -> Param ( name, type_ ))
            (Json.Decode.at [ "name" ] Json.Decode.string)
            (Json.Decode.at [ "type" ] decodeAST)
        ]
        |> Json.Decode.list


reservedList : Set String
reservedList =
    -- Copied from elm-open-api-cli Copied from elm-syntax
    [ "module"
    , "exposing"
    , "import"
    , "as"
    , "if"
    , "then"
    , "else"
    , "let"
    , "in"
    , "case"
    , "of"
    , "port"
    , "type"
    , "where"
    ]
        |> Set.fromList


mapFirst : (Char -> Char) -> String -> String
mapFirst f s =
    s
        |> String.uncons
        |> Maybe.map (Tuple.mapFirst f)
        |> Maybe.map (\( a, b ) -> String.cons a b)
        |> Maybe.withDefault s


clean : String -> String
clean s =
    s
        |> String.filter (\c -> Char.isAlphaNum c || '_' == c)
        |> (\s_ ->
                if Set.member s_ reservedList then
                    s_ ++ "_"

                else
                    s_
           )
        |> mapFirst
            (\c ->
                if Char.isAlpha c then
                    c

                else
                    'a'
            )


capitalize : String -> String
capitalize =
    mapFirst Char.toUpper


decapitalize : String -> String
decapitalize =
    mapFirst Char.toLower


safeTypeName : String -> String
safeTypeName s =
    s |> clean |> capitalize


safeValueName : String -> String
safeValueName s =
    s |> clean |> decapitalize


astToComparable : AST -> Maybe Comparable
astToComparable a =
    case a of
        Char_ ->
            Just <| Char__

        Float_ ->
            Just <| Float__

        Int_ ->
            Just <| Int__

        String_ ->
            Just <| String__

        List_ ast ->
            ast
                |> astToComparable
                |> Maybe.map List__

        Tuple2_ left right ->
            let
                left_ =
                    astToComparable left

                right_ =
                    astToComparable right
            in
            Maybe.map2 Tuple2__ left_ right_

        Tuple3_ left middle right ->
            let
                left_ =
                    astToComparable left

                middle_ =
                    astToComparable middle

                right_ =
                    astToComparable right
            in
            Maybe.map3 Tuple3__ left_ middle_ right_

        _ ->
            Nothing


comparableToAst : Comparable -> AST
comparableToAst c =
    case c of
        Char__ ->
            Char_

        Float__ ->
            Float_

        Int__ ->
            Int_

        String__ ->
            String_

        List__ ast ->
            List_ <| comparableToAst ast

        Tuple2__ left right ->
            Tuple2_ (comparableToAst left) (comparableToAst right)

        Tuple3__ left middle right ->
            Tuple3_ (comparableToAst left) (comparableToAst middle) (comparableToAst right)
