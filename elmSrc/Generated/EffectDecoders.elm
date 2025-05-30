module Generated.EffectDecoders exposing (..)

import Json.Decode


boolDecoder : Json.Decode.Decoder Bool
boolDecoder =
    Json.Decode.bool


charDecoder : Json.Decode.Decoder Char.Char
charDecoder =
    Json.Decode.andThen
        (\andThenUnpack ->
             case String.uncons andThenUnpack of
                 Nothing ->
                     Json.Decode.fail "Not a Char"

                 Just ( char, "" ) ->
                     Json.Decode.succeed char

                 _ ->
                     Json.Decode.fail "Not a Char"
        )
        Json.Decode.string


floatDecoder : Json.Decode.Decoder Float
floatDecoder =
    Json.Decode.float


intDecoder : Json.Decode.Decoder Int
intDecoder =
    Json.Decode.int


stringDecoder : Json.Decode.Decoder String
stringDecoder =
    Json.Decode.string


listStringDecoder : Json.Decode.Decoder (List String)
listStringDecoder =
    Json.Decode.list Json.Decode.string


maybeIntDecoder : Json.Decode.Decoder (Maybe Int)
maybeIntDecoder =
    Json.Decode.oneOf
        [ Json.Decode.andThen
            (\andThenUnpack ->
               if Tuple.first andThenUnpack == "Some" then
                   Json.Decode.succeed (Just (Tuple.second andThenUnpack))

               else
                   Json.Decode.fail "Not a Just"
            )
            (Json.Decode.map2
               (\map2Unpack -> \unpack -> ( map2Unpack, unpack ))
               (Json.Decode.field "_tag" Json.Decode.string)
               (Json.Decode.field "value" Json.Decode.int)
            )
        , Json.Decode.andThen
            (\andThenUnpack ->
               if andThenUnpack == "None" then
                   Json.Decode.succeed Nothing

               else
                   Json.Decode.fail "Not a Nothing"
            )
            (Json.Decode.field "_tag" Json.Decode.string)
        ]


maybeCharDecoder : Json.Decode.Decoder (Maybe Char.Char)
maybeCharDecoder =
    Json.Decode.oneOf
        [ Json.Decode.andThen
            (\andThenUnpack ->
               if Tuple.first andThenUnpack == "Some" then
                   Json.Decode.succeed (Just (Tuple.second andThenUnpack))

               else
                   Json.Decode.fail "Not a Just"
            )
            (Json.Decode.map2
               (\map2Unpack -> \unpack -> ( map2Unpack, unpack ))
               (Json.Decode.field "_tag" Json.Decode.string)
               (Json.Decode.field
                  "value"
                  (Json.Decode.andThen
                     (\andThenUnpack ->
                        case String.uncons andThenUnpack of
                            Nothing ->
                                Json.Decode.fail "Not a Char"

                            Just ( char, "" ) ->
                                Json.Decode.succeed char

                            _ ->
                                Json.Decode.fail "Not a Char"
                     )
                     Json.Decode.string
                  )
               )
            )
        , Json.Decode.andThen
            (\andThenUnpack ->
               if andThenUnpack == "None" then
                   Json.Decode.succeed Nothing

               else
                   Json.Decode.fail "Not a Nothing"
            )
            (Json.Decode.field "_tag" Json.Decode.string)
        ]


resultStringIntDecoder : Json.Decode.Decoder (Result String Int)
resultStringIntDecoder =
    Json.Decode.oneOf
        [ Json.Decode.andThen
            (\andThenUnpack ->
               if Tuple.first andThenUnpack == "Right" then
                   Json.Decode.succeed (Result.Ok (Tuple.second andThenUnpack))

               else
                   Json.Decode.fail "Not a Ok"
            )
            (Json.Decode.map2
               (\map2Unpack -> \unpack -> ( map2Unpack, unpack ))
               (Json.Decode.field "_tag" Json.Decode.string)
               (Json.Decode.field "right" Json.Decode.int)
            )
        , Json.Decode.andThen
            (\andThenUnpack ->
               if Tuple.first andThenUnpack == "Left" then
                   Json.Decode.succeed (Result.Err (Tuple.second andThenUnpack))

               else
                   Json.Decode.fail "Not a Err"
            )
            (Json.Decode.map2
               (\map2Unpack -> \unpack -> ( map2Unpack, unpack ))
               (Json.Decode.field "_tag" Json.Decode.string)
               (Json.Decode.field "left" Json.Decode.string)
            )
        ]


resultStringMaybeListStringDecoder :
    Json.Decode.Decoder (Result String (Maybe (List String)))
resultStringMaybeListStringDecoder =
    Json.Decode.oneOf
        [ Json.Decode.andThen
            (\andThenUnpack ->
               if Tuple.first andThenUnpack == "Right" then
                   Json.Decode.succeed (Result.Ok (Tuple.second andThenUnpack))

               else
                   Json.Decode.fail "Not a Ok"
            )
            (Json.Decode.map2
               (\map2Unpack -> \unpack -> ( map2Unpack, unpack ))
               (Json.Decode.field "_tag" Json.Decode.string)
               (Json.Decode.field
                  "right"
                  (Json.Decode.oneOf
                     [ Json.Decode.andThen
                           (\andThenUnpack ->
                                if Tuple.first andThenUnpack == "Some" then
                                    Json.Decode.succeed
                                        (Just (Tuple.second andThenUnpack))

                                else
                                    Json.Decode.fail "Not a Just"
                           )
                           (Json.Decode.map2
                                (\map2Unpack ->
                                     \unpack -> ( map2Unpack, unpack )
                                )
                                (Json.Decode.field "_tag" Json.Decode.string)
                                (Json.Decode.field
                                     "value"
                                     (Json.Decode.list Json.Decode.string)
                                )
                           )
                     , Json.Decode.andThen
                           (\andThenUnpack ->
                                if andThenUnpack == "None" then
                                    Json.Decode.succeed Nothing

                                else
                                    Json.Decode.fail "Not a Nothing"
                           )
                           (Json.Decode.field "_tag" Json.Decode.string)
                     ]
                  )
               )
            )
        , Json.Decode.andThen
            (\andThenUnpack ->
               if Tuple.first andThenUnpack == "Left" then
                   Json.Decode.succeed (Result.Err (Tuple.second andThenUnpack))

               else
                   Json.Decode.fail "Not a Err"
            )
            (Json.Decode.map2
               (\map2Unpack -> \unpack -> ( map2Unpack, unpack ))
               (Json.Decode.field "_tag" Json.Decode.string)
               (Json.Decode.field "left" Json.Decode.string)
            )
        ]


resultStringResultStringMaybeListStringDecoder :
    Json.Decode.Decoder (Result String (Result String (Maybe (List String))))
resultStringResultStringMaybeListStringDecoder =
    Json.Decode.oneOf
        [ Json.Decode.andThen
            (\andThenUnpack ->
               if Tuple.first andThenUnpack == "Right" then
                   Json.Decode.succeed (Result.Ok (Tuple.second andThenUnpack))

               else
                   Json.Decode.fail "Not a Ok"
            )
            (Json.Decode.map2
               (\map2Unpack -> \unpack -> ( map2Unpack, unpack ))
               (Json.Decode.field "_tag" Json.Decode.string)
               (Json.Decode.field
                  "right"
                  (Json.Decode.oneOf
                     [ Json.Decode.andThen
                           (\andThenUnpack ->
                                if Tuple.first andThenUnpack == "Right" then
                                    Json.Decode.succeed
                                        (Result.Ok (Tuple.second andThenUnpack))

                                else
                                    Json.Decode.fail "Not a Ok"
                           )
                           (Json.Decode.map2
                                (\map2Unpack ->
                                     \unpack -> ( map2Unpack, unpack )
                                )
                                (Json.Decode.field "_tag" Json.Decode.string)
                                (Json.Decode.field
                                     "right"
                                     (Json.Decode.oneOf
                                          [ Json.Decode.andThen
                                              (\andThenUnpack ->
                                                 if
                                                     Tuple.first
                                                         andThenUnpack == "Some"
                                                 then
                                                     Json.Decode.succeed
                                                         (Just
                                                              (Tuple.second
                                                                   andThenUnpack
                                                              )
                                                         )

                                                 else
                                                     Json.Decode.fail
                                                         "Not a Just"
                                              )
                                              (Json.Decode.map2
                                                 (\map2Unpack ->
                                                    \unpack ->
                                                        ( map2Unpack, unpack )
                                                 )
                                                 (Json.Decode.field
                                                    "_tag"
                                                    Json.Decode.string
                                                 )
                                                 (Json.Decode.field
                                                    "value"
                                                    (Json.Decode.list
                                                       Json.Decode.string
                                                    )
                                                 )
                                              )
                                          , Json.Decode.andThen
                                              (\andThenUnpack ->
                                                 if andThenUnpack == "None" then
                                                     Json.Decode.succeed Nothing

                                                 else
                                                     Json.Decode.fail
                                                         "Not a Nothing"
                                              )
                                              (Json.Decode.field
                                                 "_tag"
                                                 Json.Decode.string
                                              )
                                          ]
                                     )
                                )
                           )
                     , Json.Decode.andThen
                           (\andThenUnpack ->
                                if Tuple.first andThenUnpack == "Left" then
                                    Json.Decode.succeed
                                        (Result.Err (Tuple.second andThenUnpack)
                                        )

                                else
                                    Json.Decode.fail "Not a Err"
                           )
                           (Json.Decode.map2
                                (\map2Unpack ->
                                     \unpack -> ( map2Unpack, unpack )
                                )
                                (Json.Decode.field "_tag" Json.Decode.string)
                                (Json.Decode.field "left" Json.Decode.string)
                           )
                     ]
                  )
               )
            )
        , Json.Decode.andThen
            (\andThenUnpack ->
               if Tuple.first andThenUnpack == "Left" then
                   Json.Decode.succeed (Result.Err (Tuple.second andThenUnpack))

               else
                   Json.Decode.fail "Not a Err"
            )
            (Json.Decode.map2
               (\map2Unpack -> \unpack -> ( map2Unpack, unpack ))
               (Json.Decode.field "_tag" Json.Decode.string)
               (Json.Decode.field "left" Json.Decode.string)
            )
        ]
