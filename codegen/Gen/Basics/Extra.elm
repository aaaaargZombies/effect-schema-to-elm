module Gen.Basics.Extra exposing
    ( moduleName_, maxSafeInteger, minSafeInteger, isSafeInteger, safeDivide, safeIntegerDivide
    , safeModBy, safeRemainderBy, inDegrees, inRadians, inTurns, flip, curry
    , uncurry, call_, values_
    )

{-|
# Generated bindings for Basics.Extra

@docs moduleName_, maxSafeInteger, minSafeInteger, isSafeInteger, safeDivide, safeIntegerDivide
@docs safeModBy, safeRemainderBy, inDegrees, inRadians, inTurns, flip
@docs curry, uncurry, call_, values_
-}


import Elm
import Elm.Annotation as Type


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Basics", "Extra" ]


{-| The maximum _safe_ value for an integer, defined as `2^53 - 1`. Anything
larger than that and behaviour becomes mathematically unsound.

    maxSafeInteger + 1 --> maxSafeInteger + 2

maxSafeInteger: number
-}
maxSafeInteger : Elm.Expression
maxSafeInteger =
    Elm.value
        { importFrom = [ "Basics", "Extra" ]
        , name = "maxSafeInteger"
        , annotation = Just (Type.var "number")
        }


{-| The minimum _safe_ value for an integer, defined as `-(2^53 - 1)`. Anything
smaller than that, and behaviour becomes mathematically unsound.

    minSafeInteger - 1 --> minSafeInteger - 2

minSafeInteger: number
-}
minSafeInteger : Elm.Expression
minSafeInteger =
    Elm.value
        { importFrom = [ "Basics", "Extra" ]
        , name = "minSafeInteger"
        , annotation = Just (Type.var "number")
        }


{-| Checks if a given integer is within the safe range, meaning it is between
`-(2^53 - 1)` and `2^53 - 1`.

    isSafeInteger 5 --> True

    isSafeInteger maxSafeInteger --> True

    isSafeInteger (maxSafeInteger + 1) --> False

isSafeInteger: Int -> Bool
-}
isSafeInteger : Int -> Elm.Expression
isSafeInteger isSafeIntegerArg_ =
    Elm.apply
        (Elm.value
             { importFrom = [ "Basics", "Extra" ]
             , name = "isSafeInteger"
             , annotation = Just (Type.function [ Type.int ] Type.bool)
             }
        )
        [ Elm.int isSafeIntegerArg_ ]


{-| Perform floating-point division (like Elm's `/` operator) that will never
crash the app. If the `y` argument in `safeDivide x y` is zero, we return `Nothing`.

    safeDivide 5 2 --> Just 2.5

    -- the interesting part
    safeDivide 5 0 --> Nothing

safeDivide: Float -> Float -> Maybe Float
-}
safeDivide : Float -> Float -> Elm.Expression
safeDivide safeDivideArg_ safeDivideArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Basics", "Extra" ]
             , name = "safeDivide"
             , annotation =
                 Just
                     (Type.function
                          [ Type.float, Type.float ]
                          (Type.maybe Type.float)
                     )
             }
        )
        [ Elm.float safeDivideArg_, Elm.float safeDivideArg_0 ]


{-| Perform integer division (like Elm's `//` operator) that will never crash
the app. If the `y` argument in `safeIntegerDivide x y` is zero, we return `Nothing`.

    safeIntegerDivide 5 2 --> Just 2

    -- the interesting part
    safeIntegerDivide 5 0 --> Nothing

safeIntegerDivide: Int -> Int -> Maybe Int
-}
safeIntegerDivide : Int -> Int -> Elm.Expression
safeIntegerDivide safeIntegerDivideArg_ safeIntegerDivideArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Basics", "Extra" ]
             , name = "safeIntegerDivide"
             , annotation =
                 Just
                     (Type.function [ Type.int, Type.int ] (Type.maybe Type.int)
                     )
             }
        )
        [ Elm.int safeIntegerDivideArg_, Elm.int safeIntegerDivideArg_0 ]


{-| Perform [modular arithmetic][ma] that will never crash the app. If the `modulus`
argument in `safeModBy modulus x` is zero, we return `Nothing`.

    safeModBy 2 4 --> Just 0

    safeModBy 2 5 --> Just 1

    -- the interesting part
    safeModBy 0 4 --> Nothing

Use [`safeRemainderBy`](#safeRemainderBy) for a different treatment of negative
numbers, or read Daan Leijen’s [Division and Modulus for Computer Scientists][dm]
for more information.

[ma]: https://en.wikipedia.org/wiki/Modular_arithmetic
[dm]: https://www.microsoft.com/en-us/research/wp-content/uploads/2016/02/divmodnote-letter.pdf

safeModBy: Int -> Int -> Maybe Int
-}
safeModBy : Int -> Int -> Elm.Expression
safeModBy safeModByArg_ safeModByArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Basics", "Extra" ]
             , name = "safeModBy"
             , annotation =
                 Just
                     (Type.function [ Type.int, Type.int ] (Type.maybe Type.int)
                     )
             }
        )
        [ Elm.int safeModByArg_, Elm.int safeModByArg_0 ]


{-| Get the remainder after division in a way that will never crash the app. If
the `divisor` argument in `safeRemainderBy divisor x` is zero, we return `Nothing`.

    safeRemainderBy 2 4 --> Just 0

    safeRemainderBy 2 5 --> Just 1

    -- the interesting part
    safeRemainderBy 0 4 --> Nothing

Use [`safeModBy`](#safeModBy) for a different treatment of negative
numbers, or read Daan Leijen’s [Division and Modulus for Computer Scientists][dm]
for more information.

[dm]: https://www.microsoft.com/en-us/research/wp-content/uploads/2016/02/divmodnote-letter.pdf

safeRemainderBy: Int -> Int -> Maybe Int
-}
safeRemainderBy : Int -> Int -> Elm.Expression
safeRemainderBy safeRemainderByArg_ safeRemainderByArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Basics", "Extra" ]
             , name = "safeRemainderBy"
             , annotation =
                 Just
                     (Type.function [ Type.int, Type.int ] (Type.maybe Type.int)
                     )
             }
        )
        [ Elm.int safeRemainderByArg_, Elm.int safeRemainderByArg_0 ]


{-| Convert standard Elm angles (radians) to degrees.

    inDegrees (turns 2) --> 720

    inDegrees pi --> 180

inDegrees: Float -> Float
-}
inDegrees : Float -> Elm.Expression
inDegrees inDegreesArg_ =
    Elm.apply
        (Elm.value
             { importFrom = [ "Basics", "Extra" ]
             , name = "inDegrees"
             , annotation = Just (Type.function [ Type.float ] Type.float)
             }
        )
        [ Elm.float inDegreesArg_ ]


{-| Convert standard Elm angles (radians) to radians.

    inRadians (degrees 90) == pi / 2

    inRadians (turns 1) == 2 * pi

inRadians: Float -> Float
-}
inRadians : Float -> Elm.Expression
inRadians inRadiansArg_ =
    Elm.apply
        (Elm.value
             { importFrom = [ "Basics", "Extra" ]
             , name = "inRadians"
             , annotation = Just (Type.function [ Type.float ] Type.float)
             }
        )
        [ Elm.float inRadiansArg_ ]


{-| Convert standard Elm angles (radians) to turns. One turn is equal to 360°.

    inTurns (degrees 180) == 0.5

    inTurns (3 * pi) == 1.5

inTurns: Float -> Float
-}
inTurns : Float -> Elm.Expression
inTurns inTurnsArg_ =
    Elm.apply
        (Elm.value
             { importFrom = [ "Basics", "Extra" ]
             , name = "inTurns"
             , annotation = Just (Type.function [ Type.float ] Type.float)
             }
        )
        [ Elm.float inTurnsArg_ ]


{-| Flip the order of the first two arguments to a function.

flip: (a -> b -> c) -> b -> a -> c
-}
flip :
    (Elm.Expression -> Elm.Expression -> Elm.Expression)
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
flip flipArg_ flipArg_0 flipArg_1 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Basics", "Extra" ]
             , name = "flip"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function
                              [ Type.var "a", Type.var "b" ]
                              (Type.var "c")
                          , Type.var "b"
                          , Type.var "a"
                          ]
                          (Type.var "c")
                     )
             }
        )
        [ Elm.functionReduced
            "flipUnpack"
            (\functionReducedUnpack ->
               Elm.functionReduced "unpack" (flipArg_ functionReducedUnpack)
            )
        , flipArg_0
        , flipArg_1
        ]


{-| Change how arguments are passed to a function.
This splits paired arguments into two separate arguments.

curry: (( a, b ) -> c) -> a -> b -> c
-}
curry :
    (Elm.Expression -> Elm.Expression)
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
curry curryArg_ curryArg_0 curryArg_1 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Basics", "Extra" ]
             , name = "curry"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function
                              [ Type.tuple (Type.var "a") (Type.var "b") ]
                              (Type.var "c")
                          , Type.var "a"
                          , Type.var "b"
                          ]
                          (Type.var "c")
                     )
             }
        )
        [ Elm.functionReduced "curryUnpack" curryArg_, curryArg_0, curryArg_1 ]


{-| Change how arguments are passed to a function.
This combines two arguments into a single pair.

uncurry: (a -> b -> c) -> ( a, b ) -> c
-}
uncurry :
    (Elm.Expression -> Elm.Expression -> Elm.Expression)
    -> Elm.Expression
    -> Elm.Expression
uncurry uncurryArg_ uncurryArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Basics", "Extra" ]
             , name = "uncurry"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function
                              [ Type.var "a", Type.var "b" ]
                              (Type.var "c")
                          , Type.tuple (Type.var "a") (Type.var "b")
                          ]
                          (Type.var "c")
                     )
             }
        )
        [ Elm.functionReduced
            "uncurryUnpack"
            (\functionReducedUnpack ->
               Elm.functionReduced "unpack" (uncurryArg_ functionReducedUnpack)
            )
        , uncurryArg_0
        ]


call_ :
    { isSafeInteger : Elm.Expression -> Elm.Expression
    , safeDivide : Elm.Expression -> Elm.Expression -> Elm.Expression
    , safeIntegerDivide : Elm.Expression -> Elm.Expression -> Elm.Expression
    , safeModBy : Elm.Expression -> Elm.Expression -> Elm.Expression
    , safeRemainderBy : Elm.Expression -> Elm.Expression -> Elm.Expression
    , inDegrees : Elm.Expression -> Elm.Expression
    , inRadians : Elm.Expression -> Elm.Expression
    , inTurns : Elm.Expression -> Elm.Expression
    , flip :
        Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
    , curry :
        Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
    , uncurry : Elm.Expression -> Elm.Expression -> Elm.Expression
    }
call_ =
    { isSafeInteger =
        \isSafeIntegerArg_ ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Basics", "Extra" ]
                     , name = "isSafeInteger"
                     , annotation = Just (Type.function [ Type.int ] Type.bool)
                     }
                )
                [ isSafeIntegerArg_ ]
    , safeDivide =
        \safeDivideArg_ safeDivideArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Basics", "Extra" ]
                     , name = "safeDivide"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.float, Type.float ]
                                  (Type.maybe Type.float)
                             )
                     }
                )
                [ safeDivideArg_, safeDivideArg_0 ]
    , safeIntegerDivide =
        \safeIntegerDivideArg_ safeIntegerDivideArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Basics", "Extra" ]
                     , name = "safeIntegerDivide"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.int, Type.int ]
                                  (Type.maybe Type.int)
                             )
                     }
                )
                [ safeIntegerDivideArg_, safeIntegerDivideArg_0 ]
    , safeModBy =
        \safeModByArg_ safeModByArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Basics", "Extra" ]
                     , name = "safeModBy"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.int, Type.int ]
                                  (Type.maybe Type.int)
                             )
                     }
                )
                [ safeModByArg_, safeModByArg_0 ]
    , safeRemainderBy =
        \safeRemainderByArg_ safeRemainderByArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Basics", "Extra" ]
                     , name = "safeRemainderBy"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.int, Type.int ]
                                  (Type.maybe Type.int)
                             )
                     }
                )
                [ safeRemainderByArg_, safeRemainderByArg_0 ]
    , inDegrees =
        \inDegreesArg_ ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Basics", "Extra" ]
                     , name = "inDegrees"
                     , annotation =
                         Just (Type.function [ Type.float ] Type.float)
                     }
                )
                [ inDegreesArg_ ]
    , inRadians =
        \inRadiansArg_ ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Basics", "Extra" ]
                     , name = "inRadians"
                     , annotation =
                         Just (Type.function [ Type.float ] Type.float)
                     }
                )
                [ inRadiansArg_ ]
    , inTurns =
        \inTurnsArg_ ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Basics", "Extra" ]
                     , name = "inTurns"
                     , annotation =
                         Just (Type.function [ Type.float ] Type.float)
                     }
                )
                [ inTurnsArg_ ]
    , flip =
        \flipArg_ flipArg_0 flipArg_1 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Basics", "Extra" ]
                     , name = "flip"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function
                                      [ Type.var "a", Type.var "b" ]
                                      (Type.var "c")
                                  , Type.var "b"
                                  , Type.var "a"
                                  ]
                                  (Type.var "c")
                             )
                     }
                )
                [ flipArg_, flipArg_0, flipArg_1 ]
    , curry =
        \curryArg_ curryArg_0 curryArg_1 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Basics", "Extra" ]
                     , name = "curry"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function
                                      [ Type.tuple (Type.var "a") (Type.var "b")
                                      ]
                                      (Type.var "c")
                                  , Type.var "a"
                                  , Type.var "b"
                                  ]
                                  (Type.var "c")
                             )
                     }
                )
                [ curryArg_, curryArg_0, curryArg_1 ]
    , uncurry =
        \uncurryArg_ uncurryArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Basics", "Extra" ]
                     , name = "uncurry"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function
                                      [ Type.var "a", Type.var "b" ]
                                      (Type.var "c")
                                  , Type.tuple (Type.var "a") (Type.var "b")
                                  ]
                                  (Type.var "c")
                             )
                     }
                )
                [ uncurryArg_, uncurryArg_0 ]
    }


values_ :
    { maxSafeInteger : Elm.Expression
    , minSafeInteger : Elm.Expression
    , isSafeInteger : Elm.Expression
    , safeDivide : Elm.Expression
    , safeIntegerDivide : Elm.Expression
    , safeModBy : Elm.Expression
    , safeRemainderBy : Elm.Expression
    , inDegrees : Elm.Expression
    , inRadians : Elm.Expression
    , inTurns : Elm.Expression
    , flip : Elm.Expression
    , curry : Elm.Expression
    , uncurry : Elm.Expression
    }
values_ =
    { maxSafeInteger =
        Elm.value
            { importFrom = [ "Basics", "Extra" ]
            , name = "maxSafeInteger"
            , annotation = Just (Type.var "number")
            }
    , minSafeInteger =
        Elm.value
            { importFrom = [ "Basics", "Extra" ]
            , name = "minSafeInteger"
            , annotation = Just (Type.var "number")
            }
    , isSafeInteger =
        Elm.value
            { importFrom = [ "Basics", "Extra" ]
            , name = "isSafeInteger"
            , annotation = Just (Type.function [ Type.int ] Type.bool)
            }
    , safeDivide =
        Elm.value
            { importFrom = [ "Basics", "Extra" ]
            , name = "safeDivide"
            , annotation =
                Just
                    (Type.function
                         [ Type.float, Type.float ]
                         (Type.maybe Type.float)
                    )
            }
    , safeIntegerDivide =
        Elm.value
            { importFrom = [ "Basics", "Extra" ]
            , name = "safeIntegerDivide"
            , annotation =
                Just
                    (Type.function [ Type.int, Type.int ] (Type.maybe Type.int))
            }
    , safeModBy =
        Elm.value
            { importFrom = [ "Basics", "Extra" ]
            , name = "safeModBy"
            , annotation =
                Just
                    (Type.function [ Type.int, Type.int ] (Type.maybe Type.int))
            }
    , safeRemainderBy =
        Elm.value
            { importFrom = [ "Basics", "Extra" ]
            , name = "safeRemainderBy"
            , annotation =
                Just
                    (Type.function [ Type.int, Type.int ] (Type.maybe Type.int))
            }
    , inDegrees =
        Elm.value
            { importFrom = [ "Basics", "Extra" ]
            , name = "inDegrees"
            , annotation = Just (Type.function [ Type.float ] Type.float)
            }
    , inRadians =
        Elm.value
            { importFrom = [ "Basics", "Extra" ]
            , name = "inRadians"
            , annotation = Just (Type.function [ Type.float ] Type.float)
            }
    , inTurns =
        Elm.value
            { importFrom = [ "Basics", "Extra" ]
            , name = "inTurns"
            , annotation = Just (Type.function [ Type.float ] Type.float)
            }
    , flip =
        Elm.value
            { importFrom = [ "Basics", "Extra" ]
            , name = "flip"
            , annotation =
                Just
                    (Type.function
                         [ Type.function
                             [ Type.var "a", Type.var "b" ]
                             (Type.var "c")
                         , Type.var "b"
                         , Type.var "a"
                         ]
                         (Type.var "c")
                    )
            }
    , curry =
        Elm.value
            { importFrom = [ "Basics", "Extra" ]
            , name = "curry"
            , annotation =
                Just
                    (Type.function
                         [ Type.function
                             [ Type.tuple (Type.var "a") (Type.var "b") ]
                             (Type.var "c")
                         , Type.var "a"
                         , Type.var "b"
                         ]
                         (Type.var "c")
                    )
            }
    , uncurry =
        Elm.value
            { importFrom = [ "Basics", "Extra" ]
            , name = "uncurry"
            , annotation =
                Just
                    (Type.function
                         [ Type.function
                             [ Type.var "a", Type.var "b" ]
                             (Type.var "c")
                         , Type.tuple (Type.var "a") (Type.var "b")
                         ]
                         (Type.var "c")
                    )
            }
    }