module Gen.Float.Extra exposing
    ( moduleName_, aboutEqual, equalWithin, toFixedDecimalPlaces, toFixedSignificantDigits, boundaryValuesAsUnicode
    , range, modBy, interpolateFrom, call_, values_
    )

{-|
# Generated bindings for Float.Extra

@docs moduleName_, aboutEqual, equalWithin, toFixedDecimalPlaces, toFixedSignificantDigits, boundaryValuesAsUnicode
@docs range, modBy, interpolateFrom, call_, values_
-}


import Elm
import Elm.Annotation as Type


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Float", "Extra" ]


{-| Comparing Floats with `==` is usually wrong, unless you basically care for reference equality, since floating point
numbers often have small precision drift.

    0.1 + 0.2 == 0.3 --> False

This function implements an approximation where we are asking - are these values close enough that we can consider their difference to be
due to floating point drift rather than a result of meaningful difference in calculation?

    (0.1 + 0.2) |> Float.Extra.aboutEqual 0.3 --> True

This value handles Infinity and NaN like so:

    (1 / 0) |> Float.Extra.aboutEqual (100 / 0) --> True

    (0 / 0) |> Float.Extra.aboutEqual (0 / 0) --> False

**Warning:** This function is handy for casual usecases, where floats are giving you some modest trouble.
But for serious usecases, you should transition to using `equalWithin` and specify a tolerance that is
appropriate for your usecase.

aboutEqual: Float -> Float -> Bool
-}
aboutEqual : Float -> Float -> Elm.Expression
aboutEqual aboutEqualArg_ aboutEqualArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Float", "Extra" ]
             , name = "aboutEqual"
             , annotation =
                 Just (Type.function [ Type.float, Type.float ] Type.bool)
             }
        )
        [ Elm.float aboutEqualArg_, Elm.float aboutEqualArg_0 ]


{-| Check if two values are equal within a given (absolute) tolerance.

    Float.Extra.equalWithin 1.0e-6 1.9999 2.0001
    --> False

    Float.Extra.equalWithin 1.0e-3 1.9999 2.0001
    --> True

**Picking a tolerance**

`equalWithin` uses an absolute tolerance, meaning that the absolute difference between the two values should not exceed the tolerance.
As such, you should choose a number based on the overall magnitude of the domain you are computing in. For instance,
in a geometrical context, you can pick a value based on the size of the overall bounding box.
If measuring sizes of people, perhaps you can pick a value based on the tallest person alive, etc. In that context,
you may consider two persons equally tall, if they have the same number of millimeters in height.

equalWithin: Float -> Float -> Float -> Bool
-}
equalWithin : Float -> Float -> Float -> Elm.Expression
equalWithin equalWithinArg_ equalWithinArg_0 equalWithinArg_1 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Float", "Extra" ]
             , name = "equalWithin"
             , annotation =
                 Just
                     (Type.function
                          [ Type.float, Type.float, Type.float ]
                          Type.bool
                     )
             }
        )
        [ Elm.float equalWithinArg_
        , Elm.float equalWithinArg_0
        , Elm.float equalWithinArg_1
        ]


{-| Fix a float value represented to a certain number of decimal places as a string.

    Float.Extra.toFixedDecimalPlaces 3 0.0326232 --> "0.033"

toFixedDecimalPlaces: Int -> Float -> String
-}
toFixedDecimalPlaces : Int -> Float -> Elm.Expression
toFixedDecimalPlaces toFixedDecimalPlacesArg_ toFixedDecimalPlacesArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Float", "Extra" ]
             , name = "toFixedDecimalPlaces"
             , annotation =
                 Just (Type.function [ Type.int, Type.float ] Type.string)
             }
        )
        [ Elm.int toFixedDecimalPlacesArg_
        , Elm.float toFixedDecimalPlacesArg_0
        ]


{-| Fix a float value represented as a string to a certain number of significant digits.

    Float.Extra.toFixedSignificantDigits 2 1.435 --> "1.4"

    Float.Extra.toFixedSignificantDigits 2 545435 --> "550000"

    Float.Extra.toFixedSignificantDigits 2 0.0039 --> "0.0039"

toFixedSignificantDigits: Int -> Float -> String
-}
toFixedSignificantDigits : Int -> Float -> Elm.Expression
toFixedSignificantDigits toFixedSignificantDigitsArg_ toFixedSignificantDigitsArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Float", "Extra" ]
             , name = "toFixedSignificantDigits"
             , annotation =
                 Just (Type.function [ Type.int, Type.float ] Type.string)
             }
        )
        [ Elm.int toFixedSignificantDigitsArg_
        , Elm.float toFixedSignificantDigitsArg_0
        ]


{-| When showing Float values to users, we generally don't particularly want them to see programmer-y values like
`NaN` or `Infinity`. This function wraps a number formatting routine, but replaces those values with unicode symbols:

    format : Float -> String
    format =
        Float.Extra.toFixedSignificantDigits 3
            |> Float.Extra.boundaryValuesAsUnicode

    format (0 / 0) --> "∅"
    format (1 / 0) --> "∞"
    format (-1 / 0) --> "-∞"
    format (1 / 3) -> "0.333"

Of course using this is unsuitable for when you want the numbers to be machine readable.

boundaryValuesAsUnicode: (Float -> String) -> Float -> String
-}
boundaryValuesAsUnicode :
    (Elm.Expression -> Elm.Expression) -> Float -> Elm.Expression
boundaryValuesAsUnicode boundaryValuesAsUnicodeArg_ boundaryValuesAsUnicodeArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Float", "Extra" ]
             , name = "boundaryValuesAsUnicode"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function [ Type.float ] Type.string
                          , Type.float
                          ]
                          Type.string
                     )
             }
        )
        [ Elm.functionReduced
            "boundaryValuesAsUnicodeUnpack"
            boundaryValuesAsUnicodeArg_
        , Elm.float boundaryValuesAsUnicodeArg_0
        ]


{-| Returns a List containing an arithmetic progression, similar to the Python
built-in range.

Takes a `start`, `stop` and `step` argument. The stop value is exclusive; it is not
included in the result. If `step` is positive, the last element is the largest
`start + i * step` less than `stop`; if `step` is negative, the last element is
the smallest `start + i * step` greater than `stop`. If the returned list would
contain an infinite number of values, an empty range is returned.

The arguments are not required to be whole numbers; however, the results are more
predictable if they are.

Differences from [List.range from the standard library](https://package.elm-lang.org/packages/elm/core/latest/List#range):

  - `List.range` is inclusive, meaning that the stop value will be included in the result
  - `List.range` supports `Int`, whereas this uses `Float`
  - `List.range` supports only increasing intervals (i.e. `List.range 3 1 == []` vs. `range 3 1 -1 == [3, 2]`)
  - `List.range` doesn't allow for specifying the step value

range: Float -> Float -> Float -> List Float
-}
range : Float -> Float -> Float -> Elm.Expression
range rangeArg_ rangeArg_0 rangeArg_1 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Float", "Extra" ]
             , name = "range"
             , annotation =
                 Just
                     (Type.function
                          [ Type.float, Type.float, Type.float ]
                          (Type.list Type.float)
                     )
             }
        )
        [ Elm.float rangeArg_, Elm.float rangeArg_0, Elm.float rangeArg_1 ]


{-| Perform [modular arithmetic](https://en.wikipedia.org/wiki/Modular_arithmetic)
involving floating point numbers.

The sign of the result is the same as the sign of the `modulus`
in `Float.Extra.modBy modulus x`.

    Float.Extra.modBy 2.5 5 --> 0

    Float.Extra.modBy 2 4.5 == 0.5

    Float.Extra.modBy 2 -4.5 == 1.5

    Float.Extra.modBy -2 4.5 == -1.5

modBy: Float -> Float -> Float
-}
modBy : Float -> Float -> Elm.Expression
modBy modByArg_ modByArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Float", "Extra" ]
             , name = "modBy"
             , annotation =
                 Just (Type.function [ Type.float, Type.float ] Type.float)
             }
        )
        [ Elm.float modByArg_, Elm.float modByArg_0 ]


{-| Interpolate from the first value to the second, based on a parameter that
ranges from zero to one. Passing a parameter value of zero will return the start
value and passing a parameter value of one will return the end value.

    Float.Extra.interpolateFrom 5 10 0 == 5

    Float.Extra.interpolateFrom 5 10 1 == 10

    Float.Extra.interpolateFrom 5 10 0.6 == 8

The end value can be less than the start value:

    Float.Extra.interpolateFrom 10 5 0.1 == 9.5

Parameter values less than zero or greater than one can be used to extrapolate:

    Float.Extra.interpolateFrom 5 10 1.5 == 12.5

    Float.Extra.interpolateFrom 5 10 -0.5 == 2.5

    Float.Extra.interpolateFrom 10 5 -0.2 == 11

interpolateFrom: Float -> Float -> Float -> Float
-}
interpolateFrom : Float -> Float -> Float -> Elm.Expression
interpolateFrom interpolateFromArg_ interpolateFromArg_0 interpolateFromArg_1 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Float", "Extra" ]
             , name = "interpolateFrom"
             , annotation =
                 Just
                     (Type.function
                          [ Type.float, Type.float, Type.float ]
                          Type.float
                     )
             }
        )
        [ Elm.float interpolateFromArg_
        , Elm.float interpolateFromArg_0
        , Elm.float interpolateFromArg_1
        ]


call_ :
    { aboutEqual : Elm.Expression -> Elm.Expression -> Elm.Expression
    , equalWithin :
        Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
    , toFixedDecimalPlaces : Elm.Expression -> Elm.Expression -> Elm.Expression
    , toFixedSignificantDigits :
        Elm.Expression -> Elm.Expression -> Elm.Expression
    , boundaryValuesAsUnicode :
        Elm.Expression -> Elm.Expression -> Elm.Expression
    , range :
        Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
    , modBy : Elm.Expression -> Elm.Expression -> Elm.Expression
    , interpolateFrom :
        Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
    }
call_ =
    { aboutEqual =
        \aboutEqualArg_ aboutEqualArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Float", "Extra" ]
                     , name = "aboutEqual"
                     , annotation =
                         Just
                             (Type.function [ Type.float, Type.float ] Type.bool
                             )
                     }
                )
                [ aboutEqualArg_, aboutEqualArg_0 ]
    , equalWithin =
        \equalWithinArg_ equalWithinArg_0 equalWithinArg_1 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Float", "Extra" ]
                     , name = "equalWithin"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.float, Type.float, Type.float ]
                                  Type.bool
                             )
                     }
                )
                [ equalWithinArg_, equalWithinArg_0, equalWithinArg_1 ]
    , toFixedDecimalPlaces =
        \toFixedDecimalPlacesArg_ toFixedDecimalPlacesArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Float", "Extra" ]
                     , name = "toFixedDecimalPlaces"
                     , annotation =
                         Just
                             (Type.function [ Type.int, Type.float ] Type.string
                             )
                     }
                )
                [ toFixedDecimalPlacesArg_, toFixedDecimalPlacesArg_0 ]
    , toFixedSignificantDigits =
        \toFixedSignificantDigitsArg_ toFixedSignificantDigitsArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Float", "Extra" ]
                     , name = "toFixedSignificantDigits"
                     , annotation =
                         Just
                             (Type.function [ Type.int, Type.float ] Type.string
                             )
                     }
                )
                [ toFixedSignificantDigitsArg_, toFixedSignificantDigitsArg_0 ]
    , boundaryValuesAsUnicode =
        \boundaryValuesAsUnicodeArg_ boundaryValuesAsUnicodeArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Float", "Extra" ]
                     , name = "boundaryValuesAsUnicode"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function [ Type.float ] Type.string
                                  , Type.float
                                  ]
                                  Type.string
                             )
                     }
                )
                [ boundaryValuesAsUnicodeArg_, boundaryValuesAsUnicodeArg_0 ]
    , range =
        \rangeArg_ rangeArg_0 rangeArg_1 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Float", "Extra" ]
                     , name = "range"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.float, Type.float, Type.float ]
                                  (Type.list Type.float)
                             )
                     }
                )
                [ rangeArg_, rangeArg_0, rangeArg_1 ]
    , modBy =
        \modByArg_ modByArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Float", "Extra" ]
                     , name = "modBy"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.float, Type.float ]
                                  Type.float
                             )
                     }
                )
                [ modByArg_, modByArg_0 ]
    , interpolateFrom =
        \interpolateFromArg_ interpolateFromArg_0 interpolateFromArg_1 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Float", "Extra" ]
                     , name = "interpolateFrom"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.float, Type.float, Type.float ]
                                  Type.float
                             )
                     }
                )
                [ interpolateFromArg_
                , interpolateFromArg_0
                , interpolateFromArg_1
                ]
    }


values_ :
    { aboutEqual : Elm.Expression
    , equalWithin : Elm.Expression
    , toFixedDecimalPlaces : Elm.Expression
    , toFixedSignificantDigits : Elm.Expression
    , boundaryValuesAsUnicode : Elm.Expression
    , range : Elm.Expression
    , modBy : Elm.Expression
    , interpolateFrom : Elm.Expression
    }
values_ =
    { aboutEqual =
        Elm.value
            { importFrom = [ "Float", "Extra" ]
            , name = "aboutEqual"
            , annotation =
                Just (Type.function [ Type.float, Type.float ] Type.bool)
            }
    , equalWithin =
        Elm.value
            { importFrom = [ "Float", "Extra" ]
            , name = "equalWithin"
            , annotation =
                Just
                    (Type.function
                         [ Type.float, Type.float, Type.float ]
                         Type.bool
                    )
            }
    , toFixedDecimalPlaces =
        Elm.value
            { importFrom = [ "Float", "Extra" ]
            , name = "toFixedDecimalPlaces"
            , annotation =
                Just (Type.function [ Type.int, Type.float ] Type.string)
            }
    , toFixedSignificantDigits =
        Elm.value
            { importFrom = [ "Float", "Extra" ]
            , name = "toFixedSignificantDigits"
            , annotation =
                Just (Type.function [ Type.int, Type.float ] Type.string)
            }
    , boundaryValuesAsUnicode =
        Elm.value
            { importFrom = [ "Float", "Extra" ]
            , name = "boundaryValuesAsUnicode"
            , annotation =
                Just
                    (Type.function
                         [ Type.function [ Type.float ] Type.string
                         , Type.float
                         ]
                         Type.string
                    )
            }
    , range =
        Elm.value
            { importFrom = [ "Float", "Extra" ]
            , name = "range"
            , annotation =
                Just
                    (Type.function
                         [ Type.float, Type.float, Type.float ]
                         (Type.list Type.float)
                    )
            }
    , modBy =
        Elm.value
            { importFrom = [ "Float", "Extra" ]
            , name = "modBy"
            , annotation =
                Just (Type.function [ Type.float, Type.float ] Type.float)
            }
    , interpolateFrom =
        Elm.value
            { importFrom = [ "Float", "Extra" ]
            , name = "interpolateFrom"
            , annotation =
                Just
                    (Type.function
                         [ Type.float, Type.float, Type.float ]
                         Type.float
                    )
            }
    }