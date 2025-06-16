module Generated.EffectEncoders exposing (..)

import Dict
import Generated.EffectTypes
import Json.Encode
import Triple.Extra


myBoolEncoder : Generated.EffectTypes.MyBool -> Json.Encode.Value
myBoolEncoder =
    Json.Encode.bool


myCharEncoder : Generated.EffectTypes.MyChar -> Json.Encode.Value
myCharEncoder arg =
    Json.Encode.string (String.fromChar arg)


myComplexDictEncoder : Generated.EffectTypes.MyComplexDict -> Json.Encode.Value
myComplexDictEncoder arg =
    Json.Encode.list
        (\a -> a)
        (List.map
             (\keyVal0 ->
                  Json.Encode.list
                      (\listUnpack -> listUnpack)
                      [ Json.Encode.list
                          Json.Encode.string
                          (Tuple.first keyVal0)
                      , case Tuple.second keyVal0 of
                          Generated.EffectTypes.A a ->
                              Json.Encode.object
                                  [ ( "a", Json.Encode.string a ) ]

                          Generated.EffectTypes.B a ->
                              Json.Encode.object [ ( "a", Json.Encode.int a ) ]

                          Generated.EffectTypes.C a b c d ->
                              Json.Encode.object
                                  [ ( "a", Json.Encode.int a )
                                  , ( "b", Json.Encode.int b )
                                  , ( "c", Json.Encode.string c )
                                  , ( "d"
                                    , Json.Encode.list
                                          (\arg0 ->
                                               case arg0 of
                                                   Ok ok ->
                                                       Json.Encode.object
                                                           [ ( "_id"
                                                             , Json.Encode.string
                                                                   "Either"
                                                             )
                                                           , ( "_tag"
                                                             , Json.Encode.string
                                                                   "Right"
                                                             )
                                                           , ( "right"
                                                             , Json.Encode.int
                                                                   ok
                                                             )
                                                           ]

                                                   Err err ->
                                                       Json.Encode.object
                                                           [ ( "_id"
                                                             , Json.Encode.string
                                                                   "Either"
                                                             )
                                                           , ( "_tag"
                                                             , Json.Encode.string
                                                                   "Left"
                                                             )
                                                           , ( "left"
                                                             , Json.Encode.string
                                                                   err
                                                             )
                                                           ]
                                          )
                                          d
                                    )
                                  ]
                      ]
             )
             (Dict.toList arg)
        )


myNewTypeEncoder : Generated.EffectTypes.MyNewType -> Json.Encode.Value
myNewTypeEncoder arg =
    case arg of
        Generated.EffectTypes.One one ->
            Json.Encode.object
                [ ( "one", Json.Encode.string (String.fromChar one) ) ]

        Generated.EffectTypes.Two two val ->
            Json.Encode.object
                [ ( "two", Json.Encode.string two )
                , ( "val", Json.Encode.string (String.fromChar val) )
                ]


myNewTypeTwoEncoder : Generated.EffectTypes.MyNewTypeTwo -> Json.Encode.Value
myNewTypeTwoEncoder arg =
    case arg of
        Generated.EffectTypes.A a ->
            Json.Encode.object [ ( "a", Json.Encode.string a ) ]

        Generated.EffectTypes.B a ->
            Json.Encode.object [ ( "a", Json.Encode.int a ) ]

        Generated.EffectTypes.C a b c d ->
            Json.Encode.object
                [ ( "a", Json.Encode.int a )
                , ( "b", Json.Encode.int b )
                , ( "c", Json.Encode.string c )
                , ( "d"
                  , Json.Encode.list
                        (\arg0 ->
                             case arg0 of
                                 Ok ok ->
                                     Json.Encode.object
                                         [ ( "_id"
                                           , Json.Encode.string "Either"
                                           )
                                         , ( "_tag"
                                           , Json.Encode.string "Right"
                                           )
                                         , ( "right", Json.Encode.int ok )
                                         ]

                                 Err err ->
                                     Json.Encode.object
                                         [ ( "_id"
                                           , Json.Encode.string "Either"
                                           )
                                         , ( "_tag", Json.Encode.string "Left" )
                                         , ( "left", Json.Encode.string err )
                                         ]
                        )
                        d
                  )
                ]


myDictEncoder : Generated.EffectTypes.MyDict -> Json.Encode.Value
myDictEncoder arg =
    Json.Encode.list
        (\a -> a)
        (List.map
             (\keyVal0 ->
                  Json.Encode.list
                      (\listUnpack -> listUnpack)
                      [ Json.Encode.string (Tuple.first keyVal0)
                      , Json.Encode.int (Tuple.second keyVal0)
                      ]
             )
             (Dict.toList arg)
        )


myFloatEncoder : Generated.EffectTypes.MyFloat -> Json.Encode.Value
myFloatEncoder =
    Json.Encode.float


myIntEncoder : Generated.EffectTypes.MyInt -> Json.Encode.Value
myIntEncoder =
    Json.Encode.int


myKeyTupleDictEncoder :
    Generated.EffectTypes.MyKeyTupleDict -> Json.Encode.Value
myKeyTupleDictEncoder arg =
    Json.Encode.list
        (\a -> a)
        (List.map
             (\keyVal0 ->
                  Json.Encode.list
                      (\listUnpack -> listUnpack)
                      [ Json.Encode.list
                          (\listUnpack -> listUnpack)
                          [ Json.Encode.string
                                (Tuple.first (Tuple.first keyVal0))
                          , Json.Encode.float
                                (Tuple.second (Tuple.first keyVal0))
                          ]
                      , Json.Encode.int (Tuple.second keyVal0)
                      ]
             )
             (Dict.toList arg)
        )


myListEncoder : Generated.EffectTypes.MyList -> Json.Encode.Value
myListEncoder =
    Json.Encode.list Json.Encode.string


myMaybeEncoder : Generated.EffectTypes.MyMaybe -> Json.Encode.Value
myMaybeEncoder arg =
    case arg of
        Nothing ->
            Json.Encode.object [ ( "_tag", Json.Encode.string "None" ) ]

        Just value ->
            Json.Encode.object
                [ ( "_tag", Json.Encode.string "Some" )
                , ( "value", Json.Encode.int value )
                ]


myNestedDictEncoder : Generated.EffectTypes.MyNestedDict -> Json.Encode.Value
myNestedDictEncoder arg =
    Json.Encode.list
        (\a -> a)
        (List.map
             (\keyVal0 ->
                  Json.Encode.list
                      (\listUnpack -> listUnpack)
                      [ Json.Encode.string (Tuple.first keyVal0)
                      , Json.Encode.list
                          (\a -> a)
                          (List.map
                             (\keyVal1 ->
                                Json.Encode.list
                                    (\listUnpack -> listUnpack)
                                    [ Json.Encode.string (Tuple.first keyVal1)
                                    , Json.Encode.int (Tuple.second keyVal1)
                                    ]
                             )
                             (Dict.toList (Tuple.second keyVal0))
                          )
                      ]
             )
             (Dict.toList arg)
        )


myNestedTupleEncoder : Generated.EffectTypes.MyNestedTuple -> Json.Encode.Value
myNestedTupleEncoder arg =
    Json.Encode.list
        (\listUnpack -> listUnpack)
        [ Json.Encode.int (Tuple.first arg)
        , Json.Encode.list
            (\listUnpack -> listUnpack)
            [ Json.Encode.string
                  (String.fromChar (Tuple.first (Tuple.second arg)))
            , Json.Encode.bool (Tuple.second (Tuple.second arg))
            ]
        ]


myRecordEncoder : Generated.EffectTypes.MyRecord -> Json.Encode.Value
myRecordEncoder arg =
    Json.Encode.object
        [ ( "one", Json.Encode.string (String.fromChar arg.one) )
        , ( "two", Json.Encode.string arg.two )
        ]


myRecordComplexEncoder :
    Generated.EffectTypes.MyRecordComplex -> Json.Encode.Value
myRecordComplexEncoder arg =
    Json.Encode.object
        [ ( "a", Json.Encode.string (String.fromChar arg.a) )
        , ( "b"
          , Json.Encode.list
                (\arg0 -> Json.Encode.string (String.fromChar arg0))
                arg.b
          )
        , ( "c"
          , case arg.c of
                Nothing ->
                    Json.Encode.object [ ( "_tag", Json.Encode.string "None" ) ]

                Just value ->
                    Json.Encode.object
                        [ ( "_tag", Json.Encode.string "Some" )
                        , ( "value", Json.Encode.int value )
                        ]
          )
        , ( "d", Json.Encode.string (String.fromChar arg.d) )
        , ( "e", Json.Encode.string (String.fromChar arg.e) )
        , ( "f"
          , case arg.f of
                Ok ok ->
                    Json.Encode.object
                        [ ( "_id", Json.Encode.string "Either" )
                        , ( "_tag", Json.Encode.string "Right" )
                        , ( "right"
                          , case ok of
                                Ok ok0 ->
                                    Json.Encode.object
                                        [ ( "_id", Json.Encode.string "Either" )
                                        , ( "_tag", Json.Encode.string "Right" )
                                        , ( "right"
                                          , case ok0 of
                                                Nothing ->
                                                    Json.Encode.object
                                                        [ ( "_tag"
                                                          , Json.Encode.string
                                                                "None"
                                                          )
                                                        ]

                                                Just value ->
                                                    Json.Encode.object
                                                        [ ( "_tag"
                                                          , Json.Encode.string
                                                                "Some"
                                                          )
                                                        , ( "value"
                                                          , Json.Encode.list
                                                                Json.Encode.string
                                                                value
                                                          )
                                                        ]
                                          )
                                        ]

                                Err err ->
                                    Json.Encode.object
                                        [ ( "_id", Json.Encode.string "Either" )
                                        , ( "_tag", Json.Encode.string "Left" )
                                        , ( "left", Json.Encode.string err )
                                        ]
                          )
                        ]

                Err err ->
                    Json.Encode.object
                        [ ( "_id", Json.Encode.string "Either" )
                        , ( "_tag", Json.Encode.string "Left" )
                        , ( "left", Json.Encode.string err )
                        ]
          )
        , ( "g", Json.Encode.string (String.fromChar arg.g) )
        , ( "h", Json.Encode.string (String.fromChar arg.h) )
        , ( "i"
          , Json.Encode.object
                [ ( "one", Json.Encode.string (String.fromChar arg.i.one) )
                , ( "two", Json.Encode.string arg.i.two )
                ]
          )
        , ( "j", Json.Encode.float arg.j )
        ]


myRecordLongEncoder : Generated.EffectTypes.MyRecordLong -> Json.Encode.Value
myRecordLongEncoder arg =
    Json.Encode.object
        [ ( "a", Json.Encode.string (String.fromChar arg.a) )
        , ( "b", Json.Encode.string (String.fromChar arg.b) )
        , ( "c", Json.Encode.string (String.fromChar arg.c) )
        , ( "d", Json.Encode.string (String.fromChar arg.d) )
        , ( "e", Json.Encode.string (String.fromChar arg.e) )
        , ( "f", Json.Encode.string (String.fromChar arg.f) )
        , ( "g", Json.Encode.string (String.fromChar arg.g) )
        , ( "h", Json.Encode.string (String.fromChar arg.h) )
        , ( "i", Json.Encode.string (String.fromChar arg.i) )
        , ( "j", Json.Encode.string (String.fromChar arg.j) )
        ]


myRecordWithCustomTypeEncoder :
    Generated.EffectTypes.MyRecordWithCustomType -> Json.Encode.Value
myRecordWithCustomTypeEncoder arg =
    Json.Encode.object
        [ ( "a"
          , case arg.a of
                Generated.EffectTypes.A a ->
                    Json.Encode.object [ ( "a", Json.Encode.string a ) ]

                Generated.EffectTypes.B a ->
                    Json.Encode.object [ ( "a", Json.Encode.int a ) ]

                Generated.EffectTypes.C a b c d ->
                    Json.Encode.object
                        [ ( "a", Json.Encode.int a )
                        , ( "b", Json.Encode.int b )
                        , ( "c", Json.Encode.string c )
                        , ( "d"
                          , Json.Encode.list
                                (\arg0 ->
                                     case arg0 of
                                         Ok ok ->
                                             Json.Encode.object
                                                 [ ( "_id"
                                                   , Json.Encode.string "Either"
                                                   )
                                                 , ( "_tag"
                                                   , Json.Encode.string "Right"
                                                   )
                                                 , ( "right"
                                                   , Json.Encode.int ok
                                                   )
                                                 ]

                                         Err err ->
                                             Json.Encode.object
                                                 [ ( "_id"
                                                   , Json.Encode.string "Either"
                                                   )
                                                 , ( "_tag"
                                                   , Json.Encode.string "Left"
                                                   )
                                                 , ( "left"
                                                   , Json.Encode.string err
                                                   )
                                                 ]
                                )
                                d
                          )
                        ]
          )
        , ( "b"
          , Json.Encode.list
                (\arg0 ->
                     case arg0 of
                         Nothing ->
                             Json.Encode.object
                                 [ ( "_tag", Json.Encode.string "None" ) ]

                         Just value ->
                             Json.Encode.object
                                 [ ( "_tag", Json.Encode.string "Some" )
                                 , ( "value", Json.Encode.float value )
                                 ]
                )
                arg.b
          )
        ]


myResultEncoder : Generated.EffectTypes.MyResult -> Json.Encode.Value
myResultEncoder arg =
    case arg of
        Ok ok ->
            Json.Encode.object
                [ ( "_id", Json.Encode.string "Either" )
                , ( "_tag", Json.Encode.string "Right" )
                , ( "right", Json.Encode.int ok )
                ]

        Err err ->
            Json.Encode.object
                [ ( "_id", Json.Encode.string "Either" )
                , ( "_tag", Json.Encode.string "Left" )
                , ( "left", Json.Encode.string err )
                ]


myResult_Encoder : Generated.EffectTypes.MyResult_ -> Json.Encode.Value
myResult_Encoder arg =
    case arg of
        Ok ok ->
            Json.Encode.object
                [ ( "_id", Json.Encode.string "Either" )
                , ( "_tag", Json.Encode.string "Right" )
                , ( "right"
                  , case ok of
                        Nothing ->
                            Json.Encode.object
                                [ ( "_tag", Json.Encode.string "None" ) ]

                        Just value ->
                            Json.Encode.object
                                [ ( "_tag", Json.Encode.string "Some" )
                                , ( "value"
                                  , Json.Encode.list Json.Encode.string value
                                  )
                                ]
                  )
                ]

        Err err ->
            Json.Encode.object
                [ ( "_id", Json.Encode.string "Either" )
                , ( "_tag", Json.Encode.string "Left" )
                , ( "left", Json.Encode.string err )
                ]


myStringEncoder : Generated.EffectTypes.MyString -> Json.Encode.Value
myStringEncoder =
    Json.Encode.string


myTripleEncoder : Generated.EffectTypes.MyTriple -> Json.Encode.Value
myTripleEncoder arg =
    Json.Encode.list
        (\listUnpack -> listUnpack)
        [ Json.Encode.bool (Triple.Extra.first arg)
        , Json.Encode.bool (Triple.Extra.second arg)
        , Json.Encode.string (Triple.Extra.third arg)
        ]


myTupleEncoder : Generated.EffectTypes.MyTuple -> Json.Encode.Value
myTupleEncoder arg =
    Json.Encode.list
        (\listUnpack -> listUnpack)
        [ Json.Encode.string (Tuple.first arg)
        , Json.Encode.float (Tuple.second arg)
        ]