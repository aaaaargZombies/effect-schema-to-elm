module Generated.EffectEncoders exposing (..)

import Generated.EffectTypes
import Json.Encode


myBoolEncoder : Generated.EffectTypes.MyBool -> Json.Encode.Value
myBoolEncoder =
    Json.Encode.bool


myCharEncoder : Generated.EffectTypes.MyChar -> Json.Encode.Value
myCharEncoder arg =
    Json.Encode.string (String.fromChar arg)


myCustomTypeEncoder : Generated.EffectTypes.MyNewType -> Json.Encode.Value
myCustomTypeEncoder arg =
    case arg of
        Generated.EffectTypes.One one ->
            Json.Encode.object
                [ ( "one", Json.Encode.string (String.fromChar one) ) ]

        Generated.EffectTypes.Two two val ->
            Json.Encode.object
                [ ( "two", Json.Encode.string two )
                , ( "val", Json.Encode.string (String.fromChar val) )
                ]


myFloatEncoder : Generated.EffectTypes.MyFloat -> Json.Encode.Value
myFloatEncoder =
    Json.Encode.float


myIntEncoder : Generated.EffectTypes.MyInt -> Json.Encode.Value
myIntEncoder =
    Json.Encode.int


myListEncoder : Generated.EffectTypes.MyList -> Json.Encode.Value
myListEncoder =
    Json.Encode.list Json.Encode.string


myMaybeEncoder : Generated.EffectTypes.MyMaybe -> Json.Encode.Value
myMaybeEncoder arg =
    case arg of
        Nothing ->
            Json.Encode.object
                [ ( "_id", Json.Encode.string "Option" )
                , ( "_tag", Json.Encode.string "None" )
                ]

        Just value ->
            Json.Encode.object
                [ ( "_id", Json.Encode.string "Option" )
                , ( "_tag", Json.Encode.string "Some" )
                , ( "value", Json.Encode.int value )
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
                    Json.Encode.object
                        [ ( "_id", Json.Encode.string "Option" )
                        , ( "_tag", Json.Encode.string "None" )
                        ]

                Just value ->
                    Json.Encode.object
                        [ ( "_id", Json.Encode.string "Option" )
                        , ( "_tag", Json.Encode.string "Some" )
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
                                                        [ ( "_id"
                                                          , Json.Encode.string
                                                                "Option"
                                                          )
                                                        , ( "_tag"
                                                          , Json.Encode.string
                                                                "None"
                                                          )
                                                        ]

                                                Just value ->
                                                    Json.Encode.object
                                                        [ ( "_id"
                                                          , Json.Encode.string
                                                                "Option"
                                                          )
                                                        , ( "_tag"
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
                                [ ( "_id", Json.Encode.string "Option" )
                                , ( "_tag", Json.Encode.string "None" )
                                ]

                        Just value ->
                            Json.Encode.object
                                [ ( "_id", Json.Encode.string "Option" )
                                , ( "_tag", Json.Encode.string "Some" )
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