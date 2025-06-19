module Generated.EffectDecoders exposing (..)

import Array
import Dict
import Generated.EffectTypes
import Json.Decode
import Json.Decode.Extra
import Set
import Triple.Extra


myArrayDecoder : Json.Decode.Decoder Generated.EffectTypes.MyArray
myArrayDecoder =
    Json.Decode.map Array.fromList (Json.Decode.list Json.Decode.bool)


myBoolDecoder : Json.Decode.Decoder Generated.EffectTypes.MyBool
myBoolDecoder =
    Json.Decode.bool


myCharDecoder : Json.Decode.Decoder Generated.EffectTypes.MyChar
myCharDecoder =
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


myComplexArrayDecoder : Json.Decode.Decoder Generated.EffectTypes.MyComplexArray
myComplexArrayDecoder =
    Json.Decode.map
        Array.fromList
        (Json.Decode.list
             (Json.Decode.Extra.andMap
                  (Json.Decode.field "j" Json.Decode.float)
                  (Json.Decode.Extra.andMap
                       (Json.Decode.field
                            "i"
                            (Json.Decode.Extra.andMap
                                 (Json.Decode.field "two" Json.Decode.string)
                                 (Json.Decode.Extra.andMap
                                      (Json.Decode.field
                                           "one"
                                           (Json.Decode.andThen
                                                (\andThenUnpack ->
                                                     case
                                                         String.uncons
                                                             andThenUnpack
                                                     of
                                                         Nothing ->
                                                             Json.Decode.fail
                                                                 "Not a Char"

                                                         Just ( char, "" ) ->
                                                             Json.Decode.succeed
                                                                 char

                                                         _ ->
                                                             Json.Decode.fail
                                                                 "Not a Char"
                                                )
                                                Json.Decode.string
                                           )
                                      )
                                      (Json.Decode.succeed
                                           (\one two -> { one = one, two = two }
                                           )
                                      )
                                 )
                            )
                       )
                       (Json.Decode.Extra.andMap
                            (Json.Decode.field
                                 "h"
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
                            (Json.Decode.Extra.andMap
                                 (Json.Decode.field
                                      "g"
                                      (Json.Decode.map
                                           Set.fromList
                                           (Json.Decode.list Json.Decode.int)
                                      )
                                 )
                                 (Json.Decode.Extra.andMap
                                      (Json.Decode.field
                                           "f"
                                           (Json.Decode.oneOf
                                                [ Json.Decode.andThen
                                                    (\andThenUnpack ->
                                                       if
                                                           Tuple.first
                                                               andThenUnpack == "Right"
                                                       then
                                                           Json.Decode.succeed
                                                               (Result.Ok
                                                                    (Tuple.second
                                                                         andThenUnpack
                                                                    )
                                                               )

                                                       else
                                                           Json.Decode.fail
                                                               "Not a Ok"
                                                    )
                                                    (Json.Decode.map2
                                                       (\map2Unpack ->
                                                          \unpack ->
                                                              ( map2Unpack
                                                              , unpack
                                                              )
                                                       )
                                                       (Json.Decode.field
                                                          "_tag"
                                                          Json.Decode.string
                                                       )
                                                       (Json.Decode.field
                                                          "right"
                                                          (Json.Decode.oneOf
                                                             [ Json.Decode.andThen
                                                                   (\andThenUnpack ->
                                                                        if
                                                                            Tuple.first
                                                                                andThenUnpack == "Right"
                                                                        then
                                                                            Json.Decode.succeed
                                                                                (Result.Ok
                                                                                     (Tuple.second
                                                                                          andThenUnpack
                                                                                     )
                                                                                )

                                                                        else
                                                                            Json.Decode.fail
                                                                                "Not a Ok"
                                                                   )
                                                                   (Json.Decode.map2
                                                                        (\map2Unpack ->
                                                                             \unpack ->
                                                                                 ( map2Unpack
                                                                                 , unpack
                                                                                 )
                                                                        )
                                                                        (Json.Decode.field
                                                                             "_tag"
                                                                             Json.Decode.string
                                                                        )
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
                                                                                                ( map2Unpack
                                                                                                , unpack
                                                                                                )
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
                                                                                         if
                                                                                             andThenUnpack == "None"
                                                                                         then
                                                                                             Json.Decode.succeed
                                                                                                 Nothing

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
                                                                        if
                                                                            Tuple.first
                                                                                andThenUnpack == "Left"
                                                                        then
                                                                            Json.Decode.succeed
                                                                                (Result.Err
                                                                                     (Tuple.second
                                                                                          andThenUnpack
                                                                                     )
                                                                                )

                                                                        else
                                                                            Json.Decode.fail
                                                                                "Not a Err"
                                                                   )
                                                                   (Json.Decode.map2
                                                                        (\map2Unpack ->
                                                                             \unpack ->
                                                                                 ( map2Unpack
                                                                                 , unpack
                                                                                 )
                                                                        )
                                                                        (Json.Decode.field
                                                                             "_tag"
                                                                             Json.Decode.string
                                                                        )
                                                                        (Json.Decode.field
                                                                             "left"
                                                                             Json.Decode.string
                                                                        )
                                                                   )
                                                             ]
                                                          )
                                                       )
                                                    )
                                                , Json.Decode.andThen
                                                    (\andThenUnpack ->
                                                       if
                                                           Tuple.first
                                                               andThenUnpack == "Left"
                                                       then
                                                           Json.Decode.succeed
                                                               (Result.Err
                                                                    (Tuple.second
                                                                         andThenUnpack
                                                                    )
                                                               )

                                                       else
                                                           Json.Decode.fail
                                                               "Not a Err"
                                                    )
                                                    (Json.Decode.map2
                                                       (\map2Unpack ->
                                                          \unpack ->
                                                              ( map2Unpack
                                                              , unpack
                                                              )
                                                       )
                                                       (Json.Decode.field
                                                          "_tag"
                                                          Json.Decode.string
                                                       )
                                                       (Json.Decode.field
                                                          "left"
                                                          Json.Decode.string
                                                       )
                                                    )
                                                ]
                                           )
                                      )
                                      (Json.Decode.Extra.andMap
                                           (Json.Decode.field
                                                "e"
                                                (Json.Decode.andThen
                                                     (\andThenUnpack ->
                                                          case
                                                              String.uncons
                                                                  andThenUnpack
                                                          of
                                                              Nothing ->
                                                                  Json.Decode.fail
                                                                      "Not a Char"

                                                              Just ( char, "" ) ->
                                                                  Json.Decode.succeed
                                                                      char

                                                              _ ->
                                                                  Json.Decode.fail
                                                                      "Not a Char"
                                                     )
                                                     Json.Decode.string
                                                )
                                           )
                                           (Json.Decode.Extra.andMap
                                                (Json.Decode.field
                                                     "d"
                                                     (Json.Decode.andThen
                                                          (\andThenUnpack ->
                                                               case
                                                                   String.uncons
                                                                       andThenUnpack
                                                               of
                                                                   Nothing ->
                                                                       Json.Decode.fail
                                                                           "Not a Char"

                                                                   Just ( char, "" ) ->
                                                                       Json.Decode.succeed
                                                                           char

                                                                   _ ->
                                                                       Json.Decode.fail
                                                                           "Not a Char"
                                                          )
                                                          Json.Decode.string
                                                     )
                                                )
                                                (Json.Decode.Extra.andMap
                                                     (Json.Decode.field
                                                          "c"
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
                                                                             ( map2Unpack
                                                                             , unpack
                                                                             )
                                                                      )
                                                                      (Json.Decode.field
                                                                         "_tag"
                                                                         Json.Decode.string
                                                                      )
                                                                      (Json.Decode.field
                                                                         "value"
                                                                         Json.Decode.int
                                                                      )
                                                                   )
                                                               , Json.Decode.andThen
                                                                   (\andThenUnpack ->
                                                                      if
                                                                          andThenUnpack == "None"
                                                                      then
                                                                          Json.Decode.succeed
                                                                              Nothing

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
                                                     (Json.Decode.Extra.andMap
                                                          (Json.Decode.field
                                                               "b"
                                                               (Json.Decode.list
                                                                    (Json.Decode.andThen
                                                                         (\andThenUnpack ->
                                                                              case
                                                                                  String.uncons
                                                                                      andThenUnpack
                                                                              of
                                                                                  Nothing ->
                                                                                      Json.Decode.fail
                                                                                          "Not a Char"

                                                                                  Just ( char, "" ) ->
                                                                                      Json.Decode.succeed
                                                                                          char

                                                                                  _ ->
                                                                                      Json.Decode.fail
                                                                                          "Not a Char"
                                                                         )
                                                                         Json.Decode.string
                                                                    )
                                                               )
                                                          )
                                                          (Json.Decode.Extra.andMap
                                                               (Json.Decode.field
                                                                    "a"
                                                                    (Json.Decode.andThen
                                                                         (\andThenUnpack ->
                                                                              case
                                                                                  String.uncons
                                                                                      andThenUnpack
                                                                              of
                                                                                  Nothing ->
                                                                                      Json.Decode.fail
                                                                                          "Not a Char"

                                                                                  Just ( char, "" ) ->
                                                                                      Json.Decode.succeed
                                                                                          char

                                                                                  _ ->
                                                                                      Json.Decode.fail
                                                                                          "Not a Char"
                                                                         )
                                                                         Json.Decode.string
                                                                    )
                                                               )
                                                               (Json.Decode.succeed
                                                                    (\a b c d e f g h i j ->
                                                                         { a = a
                                                                         , b = b
                                                                         , c = c
                                                                         , d = d
                                                                         , e = e
                                                                         , f = f
                                                                         , g = g
                                                                         , h = h
                                                                         , i = i
                                                                         , j = j
                                                                         }
                                                                    )
                                                               )
                                                          )
                                                     )
                                                )
                                           )
                                      )
                                 )
                            )
                       )
                  )
             )
        )


myComplexDictDecoder : Json.Decode.Decoder Generated.EffectTypes.MyComplexDict
myComplexDictDecoder =
    Json.Decode.map
        Dict.fromList
        (Json.Decode.list
             (Json.Decode.map2
                  Tuple.pair
                  (Json.Decode.index 0 (Json.Decode.list Json.Decode.string))
                  (Json.Decode.index
                       1
                       (Json.Decode.oneOf
                            [ Json.Decode.Extra.andMap
                                (Json.Decode.field "a" Json.Decode.string)
                                (Json.Decode.succeed Generated.EffectTypes.A)
                            , Json.Decode.Extra.andMap
                                (Json.Decode.field "a" Json.Decode.int)
                                (Json.Decode.succeed Generated.EffectTypes.B)
                            , Json.Decode.Extra.andMap
                                (Json.Decode.field
                                   "d"
                                   (Json.Decode.list
                                      (Json.Decode.oneOf
                                         [ Json.Decode.andThen
                                               (\andThenUnpack ->
                                                    if
                                                        Tuple.first
                                                            andThenUnpack == "Right"
                                                    then
                                                        Json.Decode.succeed
                                                            (Result.Ok
                                                                 (Tuple.second
                                                                      andThenUnpack
                                                                 )
                                                            )

                                                    else
                                                        Json.Decode.fail
                                                            "Not a Ok"
                                               )
                                               (Json.Decode.map2
                                                    (\map2Unpack ->
                                                         \unpack ->
                                                             ( map2Unpack
                                                             , unpack
                                                             )
                                                    )
                                                    (Json.Decode.field
                                                         "_tag"
                                                         Json.Decode.string
                                                    )
                                                    (Json.Decode.field
                                                         "right"
                                                         Json.Decode.int
                                                    )
                                               )
                                         , Json.Decode.andThen
                                               (\andThenUnpack ->
                                                    if
                                                        Tuple.first
                                                            andThenUnpack == "Left"
                                                    then
                                                        Json.Decode.succeed
                                                            (Result.Err
                                                                 (Tuple.second
                                                                      andThenUnpack
                                                                 )
                                                            )

                                                    else
                                                        Json.Decode.fail
                                                            "Not a Err"
                                               )
                                               (Json.Decode.map2
                                                    (\map2Unpack ->
                                                         \unpack ->
                                                             ( map2Unpack
                                                             , unpack
                                                             )
                                                    )
                                                    (Json.Decode.field
                                                         "_tag"
                                                         Json.Decode.string
                                                    )
                                                    (Json.Decode.field
                                                         "left"
                                                         Json.Decode.string
                                                    )
                                               )
                                         ]
                                      )
                                   )
                                )
                                (Json.Decode.Extra.andMap
                                   (Json.Decode.field "c" Json.Decode.string)
                                   (Json.Decode.Extra.andMap
                                      (Json.Decode.field "b" Json.Decode.int)
                                      (Json.Decode.Extra.andMap
                                         (Json.Decode.field "a" Json.Decode.int)
                                         (Json.Decode.succeed
                                            Generated.EffectTypes.C
                                         )
                                      )
                                   )
                                )
                            ]
                       )
                  )
             )
        )


myNewTypeDecoder : Json.Decode.Decoder Generated.EffectTypes.MyNewType
myNewTypeDecoder =
    Json.Decode.oneOf
        [ Json.Decode.Extra.andMap
            (Json.Decode.field
               "one"
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
            (Json.Decode.succeed Generated.EffectTypes.One)
        , Json.Decode.Extra.andMap
            (Json.Decode.field
               "val"
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
            (Json.Decode.Extra.andMap
               (Json.Decode.field "two" Json.Decode.string)
               (Json.Decode.succeed Generated.EffectTypes.Two)
            )
        ]


myNewTypeTwoDecoder : Json.Decode.Decoder Generated.EffectTypes.MyNewTypeTwo
myNewTypeTwoDecoder =
    Json.Decode.oneOf
        [ Json.Decode.Extra.andMap
            (Json.Decode.field "a" Json.Decode.string)
            (Json.Decode.succeed Generated.EffectTypes.A)
        , Json.Decode.Extra.andMap
            (Json.Decode.field "a" Json.Decode.int)
            (Json.Decode.succeed Generated.EffectTypes.B)
        , Json.Decode.Extra.andMap
            (Json.Decode.field
               "d"
               (Json.Decode.list
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
                                (Json.Decode.field "right" Json.Decode.int)
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
            (Json.Decode.Extra.andMap
               (Json.Decode.field "c" Json.Decode.string)
               (Json.Decode.Extra.andMap
                  (Json.Decode.field "b" Json.Decode.int)
                  (Json.Decode.Extra.andMap
                     (Json.Decode.field "a" Json.Decode.int)
                     (Json.Decode.succeed Generated.EffectTypes.C)
                  )
               )
            )
        ]


myDictDecoder : Json.Decode.Decoder Generated.EffectTypes.MyDict
myDictDecoder =
    Json.Decode.map
        Dict.fromList
        (Json.Decode.list
             (Json.Decode.map2
                  Tuple.pair
                  (Json.Decode.index 0 Json.Decode.string)
                  (Json.Decode.index 1 Json.Decode.int)
             )
        )


myFloatDecoder : Json.Decode.Decoder Generated.EffectTypes.MyFloat
myFloatDecoder =
    Json.Decode.float


myIntDecoder : Json.Decode.Decoder Generated.EffectTypes.MyInt
myIntDecoder =
    Json.Decode.int


myKeyTupleDictDecoder : Json.Decode.Decoder Generated.EffectTypes.MyKeyTupleDict
myKeyTupleDictDecoder =
    Json.Decode.map
        Dict.fromList
        (Json.Decode.list
             (Json.Decode.map2
                  Tuple.pair
                  (Json.Decode.index
                       0
                       (Json.Decode.map2
                            Tuple.pair
                            (Json.Decode.index 0 Json.Decode.string)
                            (Json.Decode.index 1 Json.Decode.float)
                       )
                  )
                  (Json.Decode.index 1 Json.Decode.int)
             )
        )


myListDecoder : Json.Decode.Decoder Generated.EffectTypes.MyList
myListDecoder =
    Json.Decode.list Json.Decode.string


myMaybeDecoder : Json.Decode.Decoder Generated.EffectTypes.MyMaybe
myMaybeDecoder =
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


myNestedArrayDecoder : Json.Decode.Decoder Generated.EffectTypes.MyNestedArray
myNestedArrayDecoder =
    Json.Decode.map
        Array.fromList
        (Json.Decode.list
             (Json.Decode.map Array.fromList (Json.Decode.list Json.Decode.int))
        )


myNestedDictDecoder : Json.Decode.Decoder Generated.EffectTypes.MyNestedDict
myNestedDictDecoder =
    Json.Decode.map
        Dict.fromList
        (Json.Decode.list
             (Json.Decode.map2
                  Tuple.pair
                  (Json.Decode.index 0 Json.Decode.string)
                  (Json.Decode.index
                       1
                       (Json.Decode.map
                            Dict.fromList
                            (Json.Decode.list
                                 (Json.Decode.map2
                                      Tuple.pair
                                      (Json.Decode.index 0 Json.Decode.string)
                                      (Json.Decode.index 1 Json.Decode.int)
                                 )
                            )
                       )
                  )
             )
        )


myNestedTripleDecoder : Json.Decode.Decoder Generated.EffectTypes.MyNestedTriple
myNestedTripleDecoder =
    Json.Decode.map3
        Triple.Extra.triple
        (Json.Decode.index 0 Json.Decode.bool)
        (Json.Decode.index
             1
             (Json.Decode.map3
                  Triple.Extra.triple
                  (Json.Decode.index
                       0
                       (Json.Decode.map3
                            Triple.Extra.triple
                            (Json.Decode.index 0 Json.Decode.bool)
                            (Json.Decode.index
                                 1
                                 (Json.Decode.map3
                                      Triple.Extra.triple
                                      (Json.Decode.index 0 Json.Decode.bool)
                                      (Json.Decode.index 1 Json.Decode.bool)
                                      (Json.Decode.index 2 Json.Decode.string)
                                 )
                            )
                            (Json.Decode.index 2 Json.Decode.string)
                       )
                  )
                  (Json.Decode.index 1 Json.Decode.bool)
                  (Json.Decode.index 2 Json.Decode.string)
             )
        )
        (Json.Decode.index
             2
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


myNestedTupleDecoder : Json.Decode.Decoder Generated.EffectTypes.MyNestedTuple
myNestedTupleDecoder =
    Json.Decode.map2
        Tuple.pair
        (Json.Decode.index 0 Json.Decode.int)
        (Json.Decode.index
             1
             (Json.Decode.map2
                  Tuple.pair
                  (Json.Decode.index
                       0
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
                  (Json.Decode.index 1 Json.Decode.bool)
             )
        )


myRecordDecoder : Json.Decode.Decoder Generated.EffectTypes.MyRecord
myRecordDecoder =
    Json.Decode.Extra.andMap
        (Json.Decode.field "two" Json.Decode.string)
        (Json.Decode.Extra.andMap
             (Json.Decode.field
                  "one"
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
             (Json.Decode.succeed (\one two -> { one = one, two = two }))
        )


myRecordComplexDecoder :
    Json.Decode.Decoder Generated.EffectTypes.MyRecordComplex
myRecordComplexDecoder =
    Json.Decode.Extra.andMap
        (Json.Decode.field "j" Json.Decode.float)
        (Json.Decode.Extra.andMap
             (Json.Decode.field
                  "i"
                  (Json.Decode.Extra.andMap
                       (Json.Decode.field "two" Json.Decode.string)
                       (Json.Decode.Extra.andMap
                            (Json.Decode.field
                                 "one"
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
                            (Json.Decode.succeed
                                 (\one two -> { one = one, two = two })
                            )
                       )
                  )
             )
             (Json.Decode.Extra.andMap
                  (Json.Decode.field
                       "h"
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
                  (Json.Decode.Extra.andMap
                       (Json.Decode.field
                            "g"
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
                       (Json.Decode.Extra.andMap
                            (Json.Decode.field
                                 "f"
                                 (Json.Decode.oneOf
                                      [ Json.Decode.andThen
                                          (\andThenUnpack ->
                                             if
                                                 Tuple.first
                                                     andThenUnpack == "Right"
                                             then
                                                 Json.Decode.succeed
                                                     (Result.Ok
                                                          (Tuple.second
                                                               andThenUnpack
                                                          )
                                                     )

                                             else
                                                 Json.Decode.fail "Not a Ok"
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
                                                "right"
                                                (Json.Decode.oneOf
                                                   [ Json.Decode.andThen
                                                         (\andThenUnpack ->
                                                              if
                                                                  Tuple.first
                                                                      andThenUnpack == "Right"
                                                              then
                                                                  Json.Decode.succeed
                                                                      (Result.Ok
                                                                           (Tuple.second
                                                                                andThenUnpack
                                                                           )
                                                                      )

                                                              else
                                                                  Json.Decode.fail
                                                                      "Not a Ok"
                                                         )
                                                         (Json.Decode.map2
                                                              (\map2Unpack ->
                                                                   \unpack ->
                                                                       ( map2Unpack
                                                                       , unpack
                                                                       )
                                                              )
                                                              (Json.Decode.field
                                                                   "_tag"
                                                                   Json.Decode.string
                                                              )
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
                                                                                      ( map2Unpack
                                                                                      , unpack
                                                                                      )
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
                                                                               if
                                                                                   andThenUnpack == "None"
                                                                               then
                                                                                   Json.Decode.succeed
                                                                                       Nothing

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
                                                              if
                                                                  Tuple.first
                                                                      andThenUnpack == "Left"
                                                              then
                                                                  Json.Decode.succeed
                                                                      (Result.Err
                                                                           (Tuple.second
                                                                                andThenUnpack
                                                                           )
                                                                      )

                                                              else
                                                                  Json.Decode.fail
                                                                      "Not a Err"
                                                         )
                                                         (Json.Decode.map2
                                                              (\map2Unpack ->
                                                                   \unpack ->
                                                                       ( map2Unpack
                                                                       , unpack
                                                                       )
                                                              )
                                                              (Json.Decode.field
                                                                   "_tag"
                                                                   Json.Decode.string
                                                              )
                                                              (Json.Decode.field
                                                                   "left"
                                                                   Json.Decode.string
                                                              )
                                                         )
                                                   ]
                                                )
                                             )
                                          )
                                      , Json.Decode.andThen
                                          (\andThenUnpack ->
                                             if
                                                 Tuple.first
                                                     andThenUnpack == "Left"
                                             then
                                                 Json.Decode.succeed
                                                     (Result.Err
                                                          (Tuple.second
                                                               andThenUnpack
                                                          )
                                                     )

                                             else
                                                 Json.Decode.fail "Not a Err"
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
                                                "left"
                                                Json.Decode.string
                                             )
                                          )
                                      ]
                                 )
                            )
                            (Json.Decode.Extra.andMap
                                 (Json.Decode.field
                                      "e"
                                      (Json.Decode.andThen
                                           (\andThenUnpack ->
                                                case String.uncons andThenUnpack
                                                of
                                                    Nothing ->
                                                        Json.Decode.fail
                                                            "Not a Char"

                                                    Just ( char, "" ) ->
                                                        Json.Decode.succeed char

                                                    _ ->
                                                        Json.Decode.fail
                                                            "Not a Char"
                                           )
                                           Json.Decode.string
                                      )
                                 )
                                 (Json.Decode.Extra.andMap
                                      (Json.Decode.field
                                           "d"
                                           (Json.Decode.andThen
                                                (\andThenUnpack ->
                                                     case
                                                         String.uncons
                                                             andThenUnpack
                                                     of
                                                         Nothing ->
                                                             Json.Decode.fail
                                                                 "Not a Char"

                                                         Just ( char, "" ) ->
                                                             Json.Decode.succeed
                                                                 char

                                                         _ ->
                                                             Json.Decode.fail
                                                                 "Not a Char"
                                                )
                                                Json.Decode.string
                                           )
                                      )
                                      (Json.Decode.Extra.andMap
                                           (Json.Decode.field
                                                "c"
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
                                                                   ( map2Unpack
                                                                   , unpack
                                                                   )
                                                            )
                                                            (Json.Decode.field
                                                               "_tag"
                                                               Json.Decode.string
                                                            )
                                                            (Json.Decode.field
                                                               "value"
                                                               Json.Decode.int
                                                            )
                                                         )
                                                     , Json.Decode.andThen
                                                         (\andThenUnpack ->
                                                            if
                                                                andThenUnpack == "None"
                                                            then
                                                                Json.Decode.succeed
                                                                    Nothing

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
                                           (Json.Decode.Extra.andMap
                                                (Json.Decode.field
                                                     "b"
                                                     (Json.Decode.list
                                                          (Json.Decode.andThen
                                                               (\andThenUnpack ->
                                                                    case
                                                                        String.uncons
                                                                            andThenUnpack
                                                                    of
                                                                        Nothing ->
                                                                            Json.Decode.fail
                                                                                "Not a Char"

                                                                        Just ( char, "" ) ->
                                                                            Json.Decode.succeed
                                                                                char

                                                                        _ ->
                                                                            Json.Decode.fail
                                                                                "Not a Char"
                                                               )
                                                               Json.Decode.string
                                                          )
                                                     )
                                                )
                                                (Json.Decode.Extra.andMap
                                                     (Json.Decode.field
                                                          "a"
                                                          (Json.Decode.andThen
                                                               (\andThenUnpack ->
                                                                    case
                                                                        String.uncons
                                                                            andThenUnpack
                                                                    of
                                                                        Nothing ->
                                                                            Json.Decode.fail
                                                                                "Not a Char"

                                                                        Just ( char, "" ) ->
                                                                            Json.Decode.succeed
                                                                                char

                                                                        _ ->
                                                                            Json.Decode.fail
                                                                                "Not a Char"
                                                               )
                                                               Json.Decode.string
                                                          )
                                                     )
                                                     (Json.Decode.succeed
                                                          (\a b c d e f g h i j ->
                                                               { a = a
                                                               , b = b
                                                               , c = c
                                                               , d = d
                                                               , e = e
                                                               , f = f
                                                               , g = g
                                                               , h = h
                                                               , i = i
                                                               , j = j
                                                               }
                                                          )
                                                     )
                                                )
                                           )
                                      )
                                 )
                            )
                       )
                  )
             )
        )


myRecordLongDecoder : Json.Decode.Decoder Generated.EffectTypes.MyRecordLong
myRecordLongDecoder =
    Json.Decode.Extra.andMap
        (Json.Decode.field
             "j"
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
        (Json.Decode.Extra.andMap
             (Json.Decode.field
                  "i"
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
             (Json.Decode.Extra.andMap
                  (Json.Decode.field
                       "h"
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
                  (Json.Decode.Extra.andMap
                       (Json.Decode.field
                            "g"
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
                       (Json.Decode.Extra.andMap
                            (Json.Decode.field
                                 "f"
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
                            (Json.Decode.Extra.andMap
                                 (Json.Decode.field
                                      "e"
                                      (Json.Decode.andThen
                                           (\andThenUnpack ->
                                                case String.uncons andThenUnpack
                                                of
                                                    Nothing ->
                                                        Json.Decode.fail
                                                            "Not a Char"

                                                    Just ( char, "" ) ->
                                                        Json.Decode.succeed char

                                                    _ ->
                                                        Json.Decode.fail
                                                            "Not a Char"
                                           )
                                           Json.Decode.string
                                      )
                                 )
                                 (Json.Decode.Extra.andMap
                                      (Json.Decode.field
                                           "d"
                                           (Json.Decode.andThen
                                                (\andThenUnpack ->
                                                     case
                                                         String.uncons
                                                             andThenUnpack
                                                     of
                                                         Nothing ->
                                                             Json.Decode.fail
                                                                 "Not a Char"

                                                         Just ( char, "" ) ->
                                                             Json.Decode.succeed
                                                                 char

                                                         _ ->
                                                             Json.Decode.fail
                                                                 "Not a Char"
                                                )
                                                Json.Decode.string
                                           )
                                      )
                                      (Json.Decode.Extra.andMap
                                           (Json.Decode.field
                                                "c"
                                                (Json.Decode.andThen
                                                     (\andThenUnpack ->
                                                          case
                                                              String.uncons
                                                                  andThenUnpack
                                                          of
                                                              Nothing ->
                                                                  Json.Decode.fail
                                                                      "Not a Char"

                                                              Just ( char, "" ) ->
                                                                  Json.Decode.succeed
                                                                      char

                                                              _ ->
                                                                  Json.Decode.fail
                                                                      "Not a Char"
                                                     )
                                                     Json.Decode.string
                                                )
                                           )
                                           (Json.Decode.Extra.andMap
                                                (Json.Decode.field
                                                     "b"
                                                     (Json.Decode.andThen
                                                          (\andThenUnpack ->
                                                               case
                                                                   String.uncons
                                                                       andThenUnpack
                                                               of
                                                                   Nothing ->
                                                                       Json.Decode.fail
                                                                           "Not a Char"

                                                                   Just ( char, "" ) ->
                                                                       Json.Decode.succeed
                                                                           char

                                                                   _ ->
                                                                       Json.Decode.fail
                                                                           "Not a Char"
                                                          )
                                                          Json.Decode.string
                                                     )
                                                )
                                                (Json.Decode.Extra.andMap
                                                     (Json.Decode.field
                                                          "a"
                                                          (Json.Decode.andThen
                                                               (\andThenUnpack ->
                                                                    case
                                                                        String.uncons
                                                                            andThenUnpack
                                                                    of
                                                                        Nothing ->
                                                                            Json.Decode.fail
                                                                                "Not a Char"

                                                                        Just ( char, "" ) ->
                                                                            Json.Decode.succeed
                                                                                char

                                                                        _ ->
                                                                            Json.Decode.fail
                                                                                "Not a Char"
                                                               )
                                                               Json.Decode.string
                                                          )
                                                     )
                                                     (Json.Decode.succeed
                                                          (\a b c d e f g h i j ->
                                                               { a = a
                                                               , b = b
                                                               , c = c
                                                               , d = d
                                                               , e = e
                                                               , f = f
                                                               , g = g
                                                               , h = h
                                                               , i = i
                                                               , j = j
                                                               }
                                                          )
                                                     )
                                                )
                                           )
                                      )
                                 )
                            )
                       )
                  )
             )
        )


myRecordWithCustomTypeDecoder :
    Json.Decode.Decoder Generated.EffectTypes.MyRecordWithCustomType
myRecordWithCustomTypeDecoder =
    Json.Decode.Extra.andMap
        (Json.Decode.field
             "b"
             (Json.Decode.list
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
                              (\map2Unpack -> \unpack -> ( map2Unpack, unpack ))
                              (Json.Decode.field "_tag" Json.Decode.string)
                              (Json.Decode.field "value" Json.Decode.float)
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
        (Json.Decode.Extra.andMap
             (Json.Decode.field
                  "a"
                  (Json.Decode.oneOf
                       [ Json.Decode.Extra.andMap
                           (Json.Decode.field "a" Json.Decode.string)
                           (Json.Decode.succeed Generated.EffectTypes.A)
                       , Json.Decode.Extra.andMap
                           (Json.Decode.field "a" Json.Decode.int)
                           (Json.Decode.succeed Generated.EffectTypes.B)
                       , Json.Decode.Extra.andMap
                           (Json.Decode.field
                              "d"
                              (Json.Decode.list
                                 (Json.Decode.oneOf
                                    [ Json.Decode.andThen
                                          (\andThenUnpack ->
                                               if
                                                   Tuple.first
                                                       andThenUnpack == "Right"
                                               then
                                                   Json.Decode.succeed
                                                       (Result.Ok
                                                            (Tuple.second
                                                                 andThenUnpack
                                                            )
                                                       )

                                               else
                                                   Json.Decode.fail "Not a Ok"
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
                                                    "right"
                                                    Json.Decode.int
                                               )
                                          )
                                    , Json.Decode.andThen
                                          (\andThenUnpack ->
                                               if
                                                   Tuple.first
                                                       andThenUnpack == "Left"
                                               then
                                                   Json.Decode.succeed
                                                       (Result.Err
                                                            (Tuple.second
                                                                 andThenUnpack
                                                            )
                                                       )

                                               else
                                                   Json.Decode.fail "Not a Err"
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
                                                    "left"
                                                    Json.Decode.string
                                               )
                                          )
                                    ]
                                 )
                              )
                           )
                           (Json.Decode.Extra.andMap
                              (Json.Decode.field "c" Json.Decode.string)
                              (Json.Decode.Extra.andMap
                                 (Json.Decode.field "b" Json.Decode.int)
                                 (Json.Decode.Extra.andMap
                                    (Json.Decode.field "a" Json.Decode.int)
                                    (Json.Decode.succeed Generated.EffectTypes.C
                                    )
                                 )
                              )
                           )
                       ]
                  )
             )
             (Json.Decode.succeed (\a b -> { a = a, b = b }))
        )


myResultDecoder : Json.Decode.Decoder Generated.EffectTypes.MyResult
myResultDecoder =
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


myResult_Decoder : Json.Decode.Decoder Generated.EffectTypes.MyResult_
myResult_Decoder =
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


mySetDecoder : Json.Decode.Decoder Generated.EffectTypes.MySet
mySetDecoder =
    Json.Decode.map Set.fromList (Json.Decode.list Json.Decode.int)


myStringDecoder : Json.Decode.Decoder Generated.EffectTypes.MyString
myStringDecoder =
    Json.Decode.string


myTripleDecoder : Json.Decode.Decoder Generated.EffectTypes.MyTriple
myTripleDecoder =
    Json.Decode.map3
        Triple.Extra.triple
        (Json.Decode.index 0 Json.Decode.bool)
        (Json.Decode.index 1 Json.Decode.bool)
        (Json.Decode.index 2 Json.Decode.string)


myTupleDecoder : Json.Decode.Decoder Generated.EffectTypes.MyTuple
myTupleDecoder =
    Json.Decode.map2
        Tuple.pair
        (Json.Decode.index 0 Json.Decode.string)
        (Json.Decode.index 1 Json.Decode.float)