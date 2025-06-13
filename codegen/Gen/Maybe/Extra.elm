module Gen.Maybe.Extra exposing
    ( moduleName_, isJust, isNothing, join, filter, withDefaultLazy
    , unwrap, unpack, or, orElse, orList, orLazy, orElseLazy
    , orListLazy, oneOf, values, combine, combineMap, combineArray, combineMapArray
    , combineFirst, combineSecond, combineBoth, combineMapFirst, combineMapSecond, combineMapBoth, toList
    , toArray, cons, andThen2, andThen3, andThen4, andMap, next
    , prev, call_, values_
    )

{-|
# Generated bindings for Maybe.Extra

@docs moduleName_, isJust, isNothing, join, filter, withDefaultLazy
@docs unwrap, unpack, or, orElse, orList, orLazy
@docs orElseLazy, orListLazy, oneOf, values, combine, combineMap
@docs combineArray, combineMapArray, combineFirst, combineSecond, combineBoth, combineMapFirst
@docs combineMapSecond, combineMapBoth, toList, toArray, cons, andThen2
@docs andThen3, andThen4, andMap, next, prev, call_
@docs values_
-}


import Elm
import Elm.Annotation as Type


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Maybe", "Extra" ]


{-| isJust (Just 42)
    --> True

    isJust (Just [])
    --> True

    isJust Nothing
    --> False

isJust: Maybe a -> Bool
-}
isJust : Elm.Expression -> Elm.Expression
isJust isJustArg_ =
    Elm.apply
        (Elm.value
             { importFrom = [ "Maybe", "Extra" ]
             , name = "isJust"
             , annotation =
                 Just (Type.function [ Type.maybe (Type.var "a") ] Type.bool)
             }
        )
        [ isJustArg_ ]


{-| isNothing (Just 42)
    --> False

    isNothing (Just [])
    --> False

    isNothing Nothing
    --> True

isNothing: Maybe a -> Bool
-}
isNothing : Elm.Expression -> Elm.Expression
isNothing isNothingArg_ =
    Elm.apply
        (Elm.value
             { importFrom = [ "Maybe", "Extra" ]
             , name = "isNothing"
             , annotation =
                 Just (Type.function [ Type.maybe (Type.var "a") ] Type.bool)
             }
        )
        [ isNothingArg_ ]


{-| Flattens nested `Maybe`s

    join (Just (Just 1))
    --> Just 1

    join (Just Nothing)
    --> Nothing

    join Nothing
    --> Nothing

join: Maybe (Maybe a) -> Maybe a
-}
join : Elm.Expression -> Elm.Expression
join joinArg_ =
    Elm.apply
        (Elm.value
             { importFrom = [ "Maybe", "Extra" ]
             , name = "join"
             , annotation =
                 Just
                     (Type.function
                          [ Type.maybe (Type.maybe (Type.var "a")) ]
                          (Type.maybe (Type.var "a"))
                     )
             }
        )
        [ joinArg_ ]


{-| Keep the `Maybe` only if the predicate function passes

    filter (\v -> v == 1) (Just 1)
    --> Just 1

    filter (\v -> v == 2) (Just 1)
    --> Nothing

    filter (\v -> v == 1) Nothing
    --> Nothing

filter: (a -> Bool) -> Maybe a -> Maybe a
-}
filter : (Elm.Expression -> Elm.Expression) -> Elm.Expression -> Elm.Expression
filter filterArg_ filterArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Maybe", "Extra" ]
             , name = "filter"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function [ Type.var "a" ] Type.bool
                          , Type.maybe (Type.var "a")
                          ]
                          (Type.maybe (Type.var "a"))
                     )
             }
        )
        [ Elm.functionReduced "filterUnpack" filterArg_, filterArg_0 ]


{-| Lazy version of [Maybe.withDefault](https://package.elm-lang.org/packages/elm/core/latest/Maybe#withDefault).

It will only calculate the default if needed.

Examples:

    withDefaultLazy (\() -> 2 + 2) Nothing
    --> 4

    withDefaultLazy (\() -> Debug.todo "Expensive calculation") (Just 4)
    --> 4

withDefaultLazy: (() -> a) -> Maybe a -> a
-}
withDefaultLazy :
    (Elm.Expression -> Elm.Expression) -> Elm.Expression -> Elm.Expression
withDefaultLazy withDefaultLazyArg_ withDefaultLazyArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Maybe", "Extra" ]
             , name = "withDefaultLazy"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function [ Type.unit ] (Type.var "a")
                          , Type.maybe (Type.var "a")
                          ]
                          (Type.var "a")
                     )
             }
        )
        [ Elm.functionReduced "withDefaultLazyUnpack" withDefaultLazyArg_
        , withDefaultLazyArg_0
        ]


{-| Like using a `case`.
Give a function that says what to do if the input is `Just`,
and a value to use if the input is `Nothing`.

These are all equivalent:

    unwrap default f maybeX

    maybeX
        |> Maybe.map f
        |> Maybe.withDefault default

    case maybeX of
        Just x ->
            f x

        Nothing ->
            default

Except that unlike a `case`, the default value for `unwrap` is always computed.
If your default value is expensive to compute, use the lazy [`unpack`](#unpack) instead.

Examples:

    unwrap 0 String.length Nothing
    --> 0

    unwrap 0 String.length (Just "abc")
    --> 3

unwrap: b -> (a -> b) -> Maybe a -> b
-}
unwrap :
    Elm.Expression
    -> (Elm.Expression -> Elm.Expression)
    -> Elm.Expression
    -> Elm.Expression
unwrap unwrapArg_ unwrapArg_0 unwrapArg_1 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Maybe", "Extra" ]
             , name = "unwrap"
             , annotation =
                 Just
                     (Type.function
                          [ Type.var "b"
                          , Type.function [ Type.var "a" ] (Type.var "b")
                          , Type.maybe (Type.var "a")
                          ]
                          (Type.var "b")
                     )
             }
        )
        [ unwrapArg_
        , Elm.functionReduced "unwrapUnpack" unwrapArg_0
        , unwrapArg_1
        ]


{-| Like [`unwrap`](#unwrap), but the default value is lazy,
and will only be computed if the `Maybe` is `Nothing`.

    unpack (\() -> 0) String.length Nothing
    --> 0

    unpack (\() -> 0) String.length (Just "abc")
    --> 3

`unpack (\() -> default) f maybeX` is equivalent to

    case maybeX of
        Just x ->
            f x

        Nothing ->
            default

unpack: (() -> b) -> (a -> b) -> Maybe a -> b
-}
unpack :
    (Elm.Expression -> Elm.Expression)
    -> (Elm.Expression -> Elm.Expression)
    -> Elm.Expression
    -> Elm.Expression
unpack unpackArg_ unpackArg_0 unpackArg_1 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Maybe", "Extra" ]
             , name = "unpack"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function [ Type.unit ] (Type.var "b")
                          , Type.function [ Type.var "a" ] (Type.var "b")
                          , Type.maybe (Type.var "a")
                          ]
                          (Type.var "b")
                     )
             }
        )
        [ Elm.functionReduced "unpackUnpack" unpackArg_
        , Elm.functionReduced "unpackUnpack" unpackArg_0
        , unpackArg_1
        ]


{-| Returns the first value that is present, like the boolean `||`.

Both values will be computed. There is no short-circuiting.
If your second argument is expensive to calculate and you need short circuiting, use [`orLazy`](#orLazy) instead.

    or (Just 4) (Just 5)
    --> Just 4

    or (Just 4) Nothing
    --> Just 4

    or Nothing (Just 5)
    --> Just 5

    or Nothing Nothing
    --> Nothing

Advanced functional programmers will recognize this as the
implementation of `mplus` for `Maybe`s from the `MonadPlus` type
class.

or: Maybe a -> Maybe a -> Maybe a
-}
or : Elm.Expression -> Elm.Expression -> Elm.Expression
or orArg_ orArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Maybe", "Extra" ]
             , name = "or"
             , annotation =
                 Just
                     (Type.function
                          [ Type.maybe (Type.var "a")
                          , Type.maybe (Type.var "a")
                          ]
                          (Type.maybe (Type.var "a"))
                     )
             }
        )
        [ orArg_, orArg_0 ]


{-| Piping-friendly version of [`or`](#or).

    Just 5
        |> orElse (Just 4)
    --> Just 5

    orElse (Just 4) (Just 5)
    --> Just 5

    List.head []
        |> orElse (List.head [ 4 ])
    --> Just 4

orElse: Maybe a -> Maybe a -> Maybe a
-}
orElse : Elm.Expression -> Elm.Expression -> Elm.Expression
orElse orElseArg_ orElseArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Maybe", "Extra" ]
             , name = "orElse"
             , annotation =
                 Just
                     (Type.function
                          [ Type.maybe (Type.var "a")
                          , Type.maybe (Type.var "a")
                          ]
                          (Type.maybe (Type.var "a"))
                     )
             }
        )
        [ orElseArg_, orElseArg_0 ]


{-| Returns the first value that is present.

All values will be computed.
If your arguments are expensive to calculate, use [`orListLazy`](#orListLazy) instead.

    orList
        [ Nothing
        , Just 1
        , Just 2
        ]
    --> Just 1

    orList
        [ List.head []
        , String.toInt ""
        ]
    --> Nothing

    orList []
    --> Nothing

orList: List (Maybe a) -> Maybe a
-}
orList : List Elm.Expression -> Elm.Expression
orList orListArg_ =
    Elm.apply
        (Elm.value
             { importFrom = [ "Maybe", "Extra" ]
             , name = "orList"
             , annotation =
                 Just
                     (Type.function
                          [ Type.list (Type.maybe (Type.var "a")) ]
                          (Type.maybe (Type.var "a"))
                     )
             }
        )
        [ Elm.list orListArg_ ]


{-| Lazy version of [`or`](#or).

The second argument will only be evaluated if the first argument is `Nothing`.

    orLazy (Just 4) (\() -> Debug.todo "Expensive calculation")
    --> Just 4

orLazy: Maybe a -> (() -> Maybe a) -> Maybe a
-}
orLazy : Elm.Expression -> (Elm.Expression -> Elm.Expression) -> Elm.Expression
orLazy orLazyArg_ orLazyArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Maybe", "Extra" ]
             , name = "orLazy"
             , annotation =
                 Just
                     (Type.function
                          [ Type.maybe (Type.var "a")
                          , Type.function
                              [ Type.unit ]
                              (Type.maybe (Type.var "a"))
                          ]
                          (Type.maybe (Type.var "a"))
                     )
             }
        )
        [ orLazyArg_, Elm.functionReduced "orLazyUnpack" orLazyArg_0 ]


{-| Lazy version of [`orElse`](#orElse).
Piping-friendly version of [`orLazy`](#orLazy).

The first argument will only be evaluated if the second argument is `Nothing`.

    Just 4
        |> orElseLazy (\() -> Debug.todo "Expensive calculation")
    --> Just 4

orElseLazy: (() -> Maybe a) -> Maybe a -> Maybe a
-}
orElseLazy :
    (Elm.Expression -> Elm.Expression) -> Elm.Expression -> Elm.Expression
orElseLazy orElseLazyArg_ orElseLazyArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Maybe", "Extra" ]
             , name = "orElseLazy"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function
                              [ Type.unit ]
                              (Type.maybe (Type.var "a"))
                          , Type.maybe (Type.var "a")
                          ]
                          (Type.maybe (Type.var "a"))
                     )
             }
        )
        [ Elm.functionReduced "orElseLazyUnpack" orElseLazyArg_
        , orElseLazyArg_0
        ]


{-| Lazy version of [`orList`](#orList)

Stops calculating new values after the first match

    orListLazy
        [ \() -> Nothing
        , \() -> Just 1
        , \() -> Debug.todo "Expensive calculation"
        ]
    --> Just 1

orListLazy: List (() -> Maybe a) -> Maybe a
-}
orListLazy : List Elm.Expression -> Elm.Expression
orListLazy orListLazyArg_ =
    Elm.apply
        (Elm.value
             { importFrom = [ "Maybe", "Extra" ]
             , name = "orListLazy"
             , annotation =
                 Just
                     (Type.function
                          [ Type.list
                              (Type.function
                                 [ Type.unit ]
                                 (Type.maybe (Type.var "a"))
                              )
                          ]
                          (Type.maybe (Type.var "a"))
                     )
             }
        )
        [ Elm.list orListLazyArg_ ]


{-| Try a list of functions against a value. Return the value of the first call that succeeds (returns `Just`).

    type UserInput
        = FloatInput Float
        | IntInput Int
        | UnknownInput

    "5.6"
        |> oneOf
            [ String.toInt >> Maybe.map IntInput
            , String.toFloat >> Maybe.map FloatInput
            ]
        |> Maybe.withDefault UnknownInput
    --> FloatInput 5.6

oneOf: List (a -> Maybe b) -> a -> Maybe b
-}
oneOf : List Elm.Expression -> Elm.Expression -> Elm.Expression
oneOf oneOfArg_ oneOfArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Maybe", "Extra" ]
             , name = "oneOf"
             , annotation =
                 Just
                     (Type.function
                          [ Type.list
                              (Type.function
                                 [ Type.var "a" ]
                                 (Type.maybe (Type.var "b"))
                              )
                          , Type.var "a"
                          ]
                          (Type.maybe (Type.var "b"))
                     )
             }
        )
        [ Elm.list oneOfArg_, oneOfArg_0 ]


{-| Take all the values that are present, throwing away any `Nothing`s.

Equivalent to [`List.filterMap identity`](https://package.elm-lang.org/packages/elm/core/latest/List#filterMap).

    values [ Just 1, Nothing, Just 2 ]
    --> [ 1, 2 ]

values: List (Maybe a) -> List a
-}
values : List Elm.Expression -> Elm.Expression
values valuesArg_ =
    Elm.apply
        (Elm.value
             { importFrom = [ "Maybe", "Extra" ]
             , name = "values"
             , annotation =
                 Just
                     (Type.function
                          [ Type.list (Type.maybe (Type.var "a")) ]
                          (Type.list (Type.var "a"))
                     )
             }
        )
        [ Elm.list valuesArg_ ]


{-| If every `Maybe` in the list is present, return all of the values unwrapped.
If there are any `Nothing`s, the whole function fails and returns `Nothing`.

    combine []
    --> Just []

    combine [ Just 1, Just 2, Just 3 ]
    --> Just [ 1, 2, 3 ]

    combine [ Just 1, Nothing, Just 3 ]
    --> Nothing

combine: List (Maybe a) -> Maybe (List a)
-}
combine : List Elm.Expression -> Elm.Expression
combine combineArg_ =
    Elm.apply
        (Elm.value
             { importFrom = [ "Maybe", "Extra" ]
             , name = "combine"
             , annotation =
                 Just
                     (Type.function
                          [ Type.list (Type.maybe (Type.var "a")) ]
                          (Type.maybe (Type.list (Type.var "a")))
                     )
             }
        )
        [ Elm.list combineArg_ ]


{-| Like [`combine`](#combine), but map a function over each element of the list first.

If every function call succeeds (returns `Just`), `combineMap` will return a list.
If any function call fails (returns `Nothing`), `combineMap` will return `Nothing`.

`combine` is equivalent to `combineMap identity`.

    combineMap (\x -> Just (x * 10)) [ 1, 2, 3, 4, 5 ]
    --> Just [ 10, 20, 30, 40, 50 ]

    combineMap List.head [ [1], [2, 3], [] ]
    --> Nothing

combineMap: (a -> Maybe b) -> List a -> Maybe (List b)
-}
combineMap :
    (Elm.Expression -> Elm.Expression) -> List Elm.Expression -> Elm.Expression
combineMap combineMapArg_ combineMapArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Maybe", "Extra" ]
             , name = "combineMap"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function
                              [ Type.var "a" ]
                              (Type.maybe (Type.var "b"))
                          , Type.list (Type.var "a")
                          ]
                          (Type.maybe (Type.list (Type.var "b")))
                     )
             }
        )
        [ Elm.functionReduced "combineMapUnpack" combineMapArg_
        , Elm.list combineMapArg_0
        ]


{-| Like [`combine`](#combine),
but works on [`Array`](https://package.elm-lang.org/packages/elm/core/latest/Array) instead of `List`.

combineArray: Array.Array (Maybe a) -> Maybe (Array.Array a)
-}
combineArray : Elm.Expression -> Elm.Expression
combineArray combineArrayArg_ =
    Elm.apply
        (Elm.value
             { importFrom = [ "Maybe", "Extra" ]
             , name = "combineArray"
             , annotation =
                 Just
                     (Type.function
                          [ Type.namedWith
                              [ "Array" ]
                              "Array"
                              [ Type.maybe (Type.var "a") ]
                          ]
                          (Type.maybe
                               (Type.namedWith
                                    [ "Array" ]
                                    "Array"
                                    [ Type.var "a" ]
                               )
                          )
                     )
             }
        )
        [ combineArrayArg_ ]


{-| Like [`combineMap`](#combineMap),
but works on [`Array`](https://package.elm-lang.org/packages/elm/core/latest/Array) instead of `List`.

combineMapArray: (a -> Maybe b) -> Array.Array a -> Maybe (Array.Array b)
-}
combineMapArray :
    (Elm.Expression -> Elm.Expression) -> Elm.Expression -> Elm.Expression
combineMapArray combineMapArrayArg_ combineMapArrayArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Maybe", "Extra" ]
             , name = "combineMapArray"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function
                              [ Type.var "a" ]
                              (Type.maybe (Type.var "b"))
                          , Type.namedWith [ "Array" ] "Array" [ Type.var "a" ]
                          ]
                          (Type.maybe
                               (Type.namedWith
                                    [ "Array" ]
                                    "Array"
                                    [ Type.var "b" ]
                               )
                          )
                     )
             }
        )
        [ Elm.functionReduced "combineMapArrayUnpack" combineMapArrayArg_
        , combineMapArrayArg_0
        ]


{-| Pull a maybe out of the _first_ element of a tuple
and combine it into a maybe holding the tuple's values.

combineFirst: ( Maybe a, c ) -> Maybe ( a, c )
-}
combineFirst : Elm.Expression -> Elm.Expression
combineFirst combineFirstArg_ =
    Elm.apply
        (Elm.value
             { importFrom = [ "Maybe", "Extra" ]
             , name = "combineFirst"
             , annotation =
                 Just
                     (Type.function
                          [ Type.tuple
                              (Type.maybe (Type.var "a"))
                              (Type.var "c")
                          ]
                          (Type.maybe (Type.tuple (Type.var "a") (Type.var "c"))
                          )
                     )
             }
        )
        [ combineFirstArg_ ]


{-| Pull a result out of the _second_ element of a tuple
and combine it into a result holding the tuple's values.
Also known as `sequence` on tuples.

combineSecond: ( c, Maybe a ) -> Maybe ( c, a )
-}
combineSecond : Elm.Expression -> Elm.Expression
combineSecond combineSecondArg_ =
    Elm.apply
        (Elm.value
             { importFrom = [ "Maybe", "Extra" ]
             , name = "combineSecond"
             , annotation =
                 Just
                     (Type.function
                          [ Type.tuple
                              (Type.var "c")
                              (Type.maybe (Type.var "a"))
                          ]
                          (Type.maybe (Type.tuple (Type.var "c") (Type.var "a"))
                          )
                     )
             }
        )
        [ combineSecondArg_ ]


{-| Combine all maybes in a tuple
into a single maybe holding the tuple's values.

combineBoth: ( Maybe a, Maybe b ) -> Maybe ( a, b )
-}
combineBoth : Elm.Expression -> Elm.Expression
combineBoth combineBothArg_ =
    Elm.apply
        (Elm.value
             { importFrom = [ "Maybe", "Extra" ]
             , name = "combineBoth"
             , annotation =
                 Just
                     (Type.function
                          [ Type.tuple
                              (Type.maybe (Type.var "a"))
                              (Type.maybe (Type.var "b"))
                          ]
                          (Type.maybe (Type.tuple (Type.var "a") (Type.var "b"))
                          )
                     )
             }
        )
        [ combineBothArg_ ]


{-| Map a function producing maybes on the _first_ element of a tuple
and then pull it out using `combineFirst`.

    combineMapFirst f ( x, y )
        == combineFirst (Tuple.mapFirst f ( x, y ))
        == Maybe.map (\newX -> ( newX, y )) (f x)

combineMapFirst: (a -> Maybe b) -> ( a, c ) -> Maybe ( b, c )
-}
combineMapFirst :
    (Elm.Expression -> Elm.Expression) -> Elm.Expression -> Elm.Expression
combineMapFirst combineMapFirstArg_ combineMapFirstArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Maybe", "Extra" ]
             , name = "combineMapFirst"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function
                              [ Type.var "a" ]
                              (Type.maybe (Type.var "b"))
                          , Type.tuple (Type.var "a") (Type.var "c")
                          ]
                          (Type.maybe (Type.tuple (Type.var "b") (Type.var "c"))
                          )
                     )
             }
        )
        [ Elm.functionReduced "combineMapFirstUnpack" combineMapFirstArg_
        , combineMapFirstArg_0
        ]


{-| Map a function producing maybes on the _second_ element of a tuple
and then pull it out using `combineSecond`.

    combineMapSecond f ( x, y )
        == combineSecond (Tuple.mapSecond f ( x, y ))
        == Maybe.map (Tuple.pair x) (f y)

combineMapSecond: (a -> Maybe b) -> ( c, a ) -> Maybe ( c, b )
-}
combineMapSecond :
    (Elm.Expression -> Elm.Expression) -> Elm.Expression -> Elm.Expression
combineMapSecond combineMapSecondArg_ combineMapSecondArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Maybe", "Extra" ]
             , name = "combineMapSecond"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function
                              [ Type.var "a" ]
                              (Type.maybe (Type.var "b"))
                          , Type.tuple (Type.var "c") (Type.var "a")
                          ]
                          (Type.maybe (Type.tuple (Type.var "c") (Type.var "b"))
                          )
                     )
             }
        )
        [ Elm.functionReduced "combineMapSecondUnpack" combineMapSecondArg_
        , combineMapSecondArg_0
        ]


{-| Map a function producing maybes on the _both_ elements of a tuple
and then pull them out using `combineBoth`.

    combineMapBoth f g ( x, y )
        == combineBoth (Tuple.mapBoth f g ( x, y ))
        == Maybe.map2 Tuple.pair (f x) (g y)

combineMapBoth: (a -> Maybe c) -> (b -> Maybe d) -> ( a, b ) -> Maybe ( c, d )
-}
combineMapBoth :
    (Elm.Expression -> Elm.Expression)
    -> (Elm.Expression -> Elm.Expression)
    -> Elm.Expression
    -> Elm.Expression
combineMapBoth combineMapBothArg_ combineMapBothArg_0 combineMapBothArg_1 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Maybe", "Extra" ]
             , name = "combineMapBoth"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function
                              [ Type.var "a" ]
                              (Type.maybe (Type.var "c"))
                          , Type.function
                              [ Type.var "b" ]
                              (Type.maybe (Type.var "d"))
                          , Type.tuple (Type.var "a") (Type.var "b")
                          ]
                          (Type.maybe (Type.tuple (Type.var "c") (Type.var "d"))
                          )
                     )
             }
        )
        [ Elm.functionReduced "combineMapBothUnpack" combineMapBothArg_
        , Elm.functionReduced "combineMapBothUnpack" combineMapBothArg_0
        , combineMapBothArg_1
        ]


{-| A `Maybe` is a lot like a list that can only be length 0 or 1.

Returns a singleton list if the value is present, and an empty list it's missing.

    toList Nothing
    --> []

    toList (Just 1)
    --> [ 1 ]

toList: Maybe a -> List a
-}
toList : Elm.Expression -> Elm.Expression
toList toListArg_ =
    Elm.apply
        (Elm.value
             { importFrom = [ "Maybe", "Extra" ]
             , name = "toList"
             , annotation =
                 Just
                     (Type.function
                          [ Type.maybe (Type.var "a") ]
                          (Type.list (Type.var "a"))
                     )
             }
        )
        [ toListArg_ ]


{-| Like `toList`, but returns a singleton or empty [`Array`](https://package.elm-lang.org/packages/elm/core/latest/Array).

    import Array

    toArray Nothing
    --> Array.fromList []

    toArray (Just 1)
    --> Array.fromList [ 1 ]

toArray: Maybe a -> Array.Array a
-}
toArray : Elm.Expression -> Elm.Expression
toArray toArrayArg_ =
    Elm.apply
        (Elm.value
             { importFrom = [ "Maybe", "Extra" ]
             , name = "toArray"
             , annotation =
                 Just
                     (Type.function
                          [ Type.maybe (Type.var "a") ]
                          (Type.namedWith [ "Array" ] "Array" [ Type.var "a" ])
                     )
             }
        )
        [ toArrayArg_ ]


{-| Add an item to a list only if it's a `Just`.

    cons (Just 1) [ 2, 3 ]
    --> [ 1, 2, 3 ]

    cons Nothing [2, 3 ]
    --> [ 2, 3 ]

cons: Maybe a -> List a -> List a
-}
cons : Elm.Expression -> List Elm.Expression -> Elm.Expression
cons consArg_ consArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Maybe", "Extra" ]
             , name = "cons"
             , annotation =
                 Just
                     (Type.function
                          [ Type.maybe (Type.var "a")
                          , Type.list (Type.var "a")
                          ]
                          (Type.list (Type.var "a"))
                     )
             }
        )
        [ consArg_, Elm.list consArg_0 ]


{-| import Array exposing (Array)

    array : Array Int
    array = Array.fromList [1,2,3]

    andThen2 Array.get (Just 1) (Just array)
    --> Just 2

    andThen2 Array.get Nothing (Just array)
    --> Nothing

    andThen2 Array.get (Just 1) Nothing
    --> Nothing

    andThen2 Array.get (Just 4) (Just array)
    --> Nothing

andThen2: (a -> b -> Maybe value) -> Maybe a -> Maybe b -> Maybe value
-}
andThen2 :
    (Elm.Expression -> Elm.Expression -> Elm.Expression)
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
andThen2 andThen2Arg_ andThen2Arg_0 andThen2Arg_1 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Maybe", "Extra" ]
             , name = "andThen2"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function
                              [ Type.var "a", Type.var "b" ]
                              (Type.maybe (Type.var "value"))
                          , Type.maybe (Type.var "a")
                          , Type.maybe (Type.var "b")
                          ]
                          (Type.maybe (Type.var "value"))
                     )
             }
        )
        [ Elm.functionReduced
            "andThen2Unpack"
            (\functionReducedUnpack ->
               Elm.functionReduced "unpack" (andThen2Arg_ functionReducedUnpack)
            )
        , andThen2Arg_0
        , andThen2Arg_1
        ]


{-| `andThen` for 3 maybes.

andThen3: (a -> b -> c -> Maybe value) -> Maybe a -> Maybe b -> Maybe c -> Maybe value
-}
andThen3 :
    (Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression)
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
andThen3 andThen3Arg_ andThen3Arg_0 andThen3Arg_1 andThen3Arg_2 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Maybe", "Extra" ]
             , name = "andThen3"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function
                              [ Type.var "a", Type.var "b", Type.var "c" ]
                              (Type.maybe (Type.var "value"))
                          , Type.maybe (Type.var "a")
                          , Type.maybe (Type.var "b")
                          , Type.maybe (Type.var "c")
                          ]
                          (Type.maybe (Type.var "value"))
                     )
             }
        )
        [ Elm.functionReduced
            "andThen3Unpack"
            (\functionReducedUnpack ->
               Elm.functionReduced
                   "unpack"
                   (\functionReducedUnpack0 ->
                        Elm.functionReduced
                            "unpack"
                            ((andThen3Arg_ functionReducedUnpack)
                                 functionReducedUnpack0
                            )
                   )
            )
        , andThen3Arg_0
        , andThen3Arg_1
        , andThen3Arg_2
        ]


{-| `andThen` for 4 maybes.

andThen4: 
    (a -> b -> c -> d -> Maybe value)
    -> Maybe a
    -> Maybe b
    -> Maybe c
    -> Maybe d
    -> Maybe value
-}
andThen4 :
    (Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression)
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
andThen4 andThen4Arg_ andThen4Arg_0 andThen4Arg_1 andThen4Arg_2 andThen4Arg_3 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Maybe", "Extra" ]
             , name = "andThen4"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function
                              [ Type.var "a"
                              , Type.var "b"
                              , Type.var "c"
                              , Type.var "d"
                              ]
                              (Type.maybe (Type.var "value"))
                          , Type.maybe (Type.var "a")
                          , Type.maybe (Type.var "b")
                          , Type.maybe (Type.var "c")
                          , Type.maybe (Type.var "d")
                          ]
                          (Type.maybe (Type.var "value"))
                     )
             }
        )
        [ Elm.functionReduced
            "andThen4Unpack"
            (\functionReducedUnpack ->
               Elm.functionReduced
                   "unpack"
                   (\functionReducedUnpack0 ->
                        Elm.functionReduced
                            "unpack"
                            (\functionReducedUnpack_2_1_2_0_2_0_2_0_0 ->
                                 Elm.functionReduced
                                     "unpack"
                                     (((andThen4Arg_ functionReducedUnpack)
                                           functionReducedUnpack0
                                      )
                                          functionReducedUnpack_2_1_2_0_2_0_2_0_0
                                     )
                            )
                   )
            )
        , andThen4Arg_0
        , andThen4Arg_1
        , andThen4Arg_2
        , andThen4Arg_3
        ]


{-| If both a function and a value are present, apply the function to the value.
If either argument is `Nothing`, return `Nothing`.

    Just ((+) 2)
        |> andMap (Just 3)
    --> Just 5

    Nothing
        |> andMap (Just 3)
    --> Nothing

    Just ((+) 2)
        |> andMap Nothing
    --> Nothing

This can be used to do [`Maybe.mapN`](https://package.elm-lang.org/packages/elm/core/latest/Maybe#map2) or [`andThenN`](#andthenn) for any number of arguments.

    -- map4
    Just (\a b c d -> a + b + c + d )
        |> andMap (Just 1)
        |> andMap (Just 2)
        |> andMap (Just 4)
        |> andMap (Just 8)
    --> Just 15

    -- andThen4
    Just (\a b c d -> Just (a + b + c + d ))
        |> andMap (Just 1)
        |> andMap (Just 2)
        |> andMap (Just 4)
        |> andMap (Just 8)
        |> join
    --> Just 15

Advanced functional programmers will recognize this as the implementation of `<*>` for `Maybe`s from the `Applicative` typeclass.

andMap: Maybe a -> Maybe (a -> b) -> Maybe b
-}
andMap : Elm.Expression -> Elm.Expression -> Elm.Expression
andMap andMapArg_ andMapArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Maybe", "Extra" ]
             , name = "andMap"
             , annotation =
                 Just
                     (Type.function
                          [ Type.maybe (Type.var "a")
                          , Type.maybe
                              (Type.function [ Type.var "a" ] (Type.var "b"))
                          ]
                          (Type.maybe (Type.var "b"))
                     )
             }
        )
        [ andMapArg_, andMapArg_0 ]


{-| Take two `Maybe` values. If the first one equals `Nothing`, return `Nothing`. Otherwise return the second value.

    next (Just 1) (Just 2)
    --> Just 2

    next Nothing (Just 2)
    --> Nothing

    next (Just 1) Nothing
    --> Nothing

Advanced functional programmers will recognize this as the implementation of `*>` for `Maybe`s from the `Applicative` typeclass.

next: Maybe a -> Maybe b -> Maybe b
-}
next : Elm.Expression -> Elm.Expression -> Elm.Expression
next nextArg_ nextArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Maybe", "Extra" ]
             , name = "next"
             , annotation =
                 Just
                     (Type.function
                          [ Type.maybe (Type.var "a")
                          , Type.maybe (Type.var "b")
                          ]
                          (Type.maybe (Type.var "b"))
                     )
             }
        )
        [ nextArg_, nextArg_0 ]


{-| Take two `Maybe` values. If the second one equals `Nothing`, return `Nothing`. Otherwise return the first value.

    prev (Just 1) (Just 2)
    --> Just 1

    prev Nothing (Just 2)
    --> Nothing

    prev (Just 1) Nothing
    --> Nothing

Advanced functional programmers will recognize this as the implementation of `<*` for `Maybe`s from the `Applicative` typeclass.

prev: Maybe a -> Maybe b -> Maybe a
-}
prev : Elm.Expression -> Elm.Expression -> Elm.Expression
prev prevArg_ prevArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Maybe", "Extra" ]
             , name = "prev"
             , annotation =
                 Just
                     (Type.function
                          [ Type.maybe (Type.var "a")
                          , Type.maybe (Type.var "b")
                          ]
                          (Type.maybe (Type.var "a"))
                     )
             }
        )
        [ prevArg_, prevArg_0 ]


call_ :
    { isJust : Elm.Expression -> Elm.Expression
    , isNothing : Elm.Expression -> Elm.Expression
    , join : Elm.Expression -> Elm.Expression
    , filter : Elm.Expression -> Elm.Expression -> Elm.Expression
    , withDefaultLazy : Elm.Expression -> Elm.Expression -> Elm.Expression
    , unwrap :
        Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
    , unpack :
        Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
    , or : Elm.Expression -> Elm.Expression -> Elm.Expression
    , orElse : Elm.Expression -> Elm.Expression -> Elm.Expression
    , orList : Elm.Expression -> Elm.Expression
    , orLazy : Elm.Expression -> Elm.Expression -> Elm.Expression
    , orElseLazy : Elm.Expression -> Elm.Expression -> Elm.Expression
    , orListLazy : Elm.Expression -> Elm.Expression
    , oneOf : Elm.Expression -> Elm.Expression -> Elm.Expression
    , values : Elm.Expression -> Elm.Expression
    , combine : Elm.Expression -> Elm.Expression
    , combineMap : Elm.Expression -> Elm.Expression -> Elm.Expression
    , combineArray : Elm.Expression -> Elm.Expression
    , combineMapArray : Elm.Expression -> Elm.Expression -> Elm.Expression
    , combineFirst : Elm.Expression -> Elm.Expression
    , combineSecond : Elm.Expression -> Elm.Expression
    , combineBoth : Elm.Expression -> Elm.Expression
    , combineMapFirst : Elm.Expression -> Elm.Expression -> Elm.Expression
    , combineMapSecond : Elm.Expression -> Elm.Expression -> Elm.Expression
    , combineMapBoth :
        Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
    , toList : Elm.Expression -> Elm.Expression
    , toArray : Elm.Expression -> Elm.Expression
    , cons : Elm.Expression -> Elm.Expression -> Elm.Expression
    , andThen2 :
        Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
    , andThen3 :
        Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
    , andThen4 :
        Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
    , andMap : Elm.Expression -> Elm.Expression -> Elm.Expression
    , next : Elm.Expression -> Elm.Expression -> Elm.Expression
    , prev : Elm.Expression -> Elm.Expression -> Elm.Expression
    }
call_ =
    { isJust =
        \isJustArg_ ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Maybe", "Extra" ]
                     , name = "isJust"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.maybe (Type.var "a") ]
                                  Type.bool
                             )
                     }
                )
                [ isJustArg_ ]
    , isNothing =
        \isNothingArg_ ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Maybe", "Extra" ]
                     , name = "isNothing"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.maybe (Type.var "a") ]
                                  Type.bool
                             )
                     }
                )
                [ isNothingArg_ ]
    , join =
        \joinArg_ ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Maybe", "Extra" ]
                     , name = "join"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.maybe (Type.maybe (Type.var "a")) ]
                                  (Type.maybe (Type.var "a"))
                             )
                     }
                )
                [ joinArg_ ]
    , filter =
        \filterArg_ filterArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Maybe", "Extra" ]
                     , name = "filter"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function [ Type.var "a" ] Type.bool
                                  , Type.maybe (Type.var "a")
                                  ]
                                  (Type.maybe (Type.var "a"))
                             )
                     }
                )
                [ filterArg_, filterArg_0 ]
    , withDefaultLazy =
        \withDefaultLazyArg_ withDefaultLazyArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Maybe", "Extra" ]
                     , name = "withDefaultLazy"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function [ Type.unit ] (Type.var "a")
                                  , Type.maybe (Type.var "a")
                                  ]
                                  (Type.var "a")
                             )
                     }
                )
                [ withDefaultLazyArg_, withDefaultLazyArg_0 ]
    , unwrap =
        \unwrapArg_ unwrapArg_0 unwrapArg_1 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Maybe", "Extra" ]
                     , name = "unwrap"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.var "b"
                                  , Type.function
                                      [ Type.var "a" ]
                                      (Type.var "b")
                                  , Type.maybe (Type.var "a")
                                  ]
                                  (Type.var "b")
                             )
                     }
                )
                [ unwrapArg_, unwrapArg_0, unwrapArg_1 ]
    , unpack =
        \unpackArg_ unpackArg_0 unpackArg_1 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Maybe", "Extra" ]
                     , name = "unpack"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function [ Type.unit ] (Type.var "b")
                                  , Type.function
                                      [ Type.var "a" ]
                                      (Type.var "b")
                                  , Type.maybe (Type.var "a")
                                  ]
                                  (Type.var "b")
                             )
                     }
                )
                [ unpackArg_, unpackArg_0, unpackArg_1 ]
    , or =
        \orArg_ orArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Maybe", "Extra" ]
                     , name = "or"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.maybe (Type.var "a")
                                  , Type.maybe (Type.var "a")
                                  ]
                                  (Type.maybe (Type.var "a"))
                             )
                     }
                )
                [ orArg_, orArg_0 ]
    , orElse =
        \orElseArg_ orElseArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Maybe", "Extra" ]
                     , name = "orElse"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.maybe (Type.var "a")
                                  , Type.maybe (Type.var "a")
                                  ]
                                  (Type.maybe (Type.var "a"))
                             )
                     }
                )
                [ orElseArg_, orElseArg_0 ]
    , orList =
        \orListArg_ ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Maybe", "Extra" ]
                     , name = "orList"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.list (Type.maybe (Type.var "a")) ]
                                  (Type.maybe (Type.var "a"))
                             )
                     }
                )
                [ orListArg_ ]
    , orLazy =
        \orLazyArg_ orLazyArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Maybe", "Extra" ]
                     , name = "orLazy"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.maybe (Type.var "a")
                                  , Type.function
                                      [ Type.unit ]
                                      (Type.maybe (Type.var "a"))
                                  ]
                                  (Type.maybe (Type.var "a"))
                             )
                     }
                )
                [ orLazyArg_, orLazyArg_0 ]
    , orElseLazy =
        \orElseLazyArg_ orElseLazyArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Maybe", "Extra" ]
                     , name = "orElseLazy"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function
                                      [ Type.unit ]
                                      (Type.maybe (Type.var "a"))
                                  , Type.maybe (Type.var "a")
                                  ]
                                  (Type.maybe (Type.var "a"))
                             )
                     }
                )
                [ orElseLazyArg_, orElseLazyArg_0 ]
    , orListLazy =
        \orListLazyArg_ ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Maybe", "Extra" ]
                     , name = "orListLazy"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.list
                                      (Type.function
                                         [ Type.unit ]
                                         (Type.maybe (Type.var "a"))
                                      )
                                  ]
                                  (Type.maybe (Type.var "a"))
                             )
                     }
                )
                [ orListLazyArg_ ]
    , oneOf =
        \oneOfArg_ oneOfArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Maybe", "Extra" ]
                     , name = "oneOf"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.list
                                      (Type.function
                                         [ Type.var "a" ]
                                         (Type.maybe (Type.var "b"))
                                      )
                                  , Type.var "a"
                                  ]
                                  (Type.maybe (Type.var "b"))
                             )
                     }
                )
                [ oneOfArg_, oneOfArg_0 ]
    , values =
        \valuesArg_ ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Maybe", "Extra" ]
                     , name = "values"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.list (Type.maybe (Type.var "a")) ]
                                  (Type.list (Type.var "a"))
                             )
                     }
                )
                [ valuesArg_ ]
    , combine =
        \combineArg_ ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Maybe", "Extra" ]
                     , name = "combine"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.list (Type.maybe (Type.var "a")) ]
                                  (Type.maybe (Type.list (Type.var "a")))
                             )
                     }
                )
                [ combineArg_ ]
    , combineMap =
        \combineMapArg_ combineMapArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Maybe", "Extra" ]
                     , name = "combineMap"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function
                                      [ Type.var "a" ]
                                      (Type.maybe (Type.var "b"))
                                  , Type.list (Type.var "a")
                                  ]
                                  (Type.maybe (Type.list (Type.var "b")))
                             )
                     }
                )
                [ combineMapArg_, combineMapArg_0 ]
    , combineArray =
        \combineArrayArg_ ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Maybe", "Extra" ]
                     , name = "combineArray"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.namedWith
                                      [ "Array" ]
                                      "Array"
                                      [ Type.maybe (Type.var "a") ]
                                  ]
                                  (Type.maybe
                                       (Type.namedWith
                                            [ "Array" ]
                                            "Array"
                                            [ Type.var "a" ]
                                       )
                                  )
                             )
                     }
                )
                [ combineArrayArg_ ]
    , combineMapArray =
        \combineMapArrayArg_ combineMapArrayArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Maybe", "Extra" ]
                     , name = "combineMapArray"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function
                                      [ Type.var "a" ]
                                      (Type.maybe (Type.var "b"))
                                  , Type.namedWith
                                      [ "Array" ]
                                      "Array"
                                      [ Type.var "a" ]
                                  ]
                                  (Type.maybe
                                       (Type.namedWith
                                            [ "Array" ]
                                            "Array"
                                            [ Type.var "b" ]
                                       )
                                  )
                             )
                     }
                )
                [ combineMapArrayArg_, combineMapArrayArg_0 ]
    , combineFirst =
        \combineFirstArg_ ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Maybe", "Extra" ]
                     , name = "combineFirst"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.tuple
                                      (Type.maybe (Type.var "a"))
                                      (Type.var "c")
                                  ]
                                  (Type.maybe
                                       (Type.tuple (Type.var "a") (Type.var "c")
                                       )
                                  )
                             )
                     }
                )
                [ combineFirstArg_ ]
    , combineSecond =
        \combineSecondArg_ ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Maybe", "Extra" ]
                     , name = "combineSecond"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.tuple
                                      (Type.var "c")
                                      (Type.maybe (Type.var "a"))
                                  ]
                                  (Type.maybe
                                       (Type.tuple (Type.var "c") (Type.var "a")
                                       )
                                  )
                             )
                     }
                )
                [ combineSecondArg_ ]
    , combineBoth =
        \combineBothArg_ ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Maybe", "Extra" ]
                     , name = "combineBoth"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.tuple
                                      (Type.maybe (Type.var "a"))
                                      (Type.maybe (Type.var "b"))
                                  ]
                                  (Type.maybe
                                       (Type.tuple (Type.var "a") (Type.var "b")
                                       )
                                  )
                             )
                     }
                )
                [ combineBothArg_ ]
    , combineMapFirst =
        \combineMapFirstArg_ combineMapFirstArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Maybe", "Extra" ]
                     , name = "combineMapFirst"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function
                                      [ Type.var "a" ]
                                      (Type.maybe (Type.var "b"))
                                  , Type.tuple (Type.var "a") (Type.var "c")
                                  ]
                                  (Type.maybe
                                       (Type.tuple (Type.var "b") (Type.var "c")
                                       )
                                  )
                             )
                     }
                )
                [ combineMapFirstArg_, combineMapFirstArg_0 ]
    , combineMapSecond =
        \combineMapSecondArg_ combineMapSecondArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Maybe", "Extra" ]
                     , name = "combineMapSecond"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function
                                      [ Type.var "a" ]
                                      (Type.maybe (Type.var "b"))
                                  , Type.tuple (Type.var "c") (Type.var "a")
                                  ]
                                  (Type.maybe
                                       (Type.tuple (Type.var "c") (Type.var "b")
                                       )
                                  )
                             )
                     }
                )
                [ combineMapSecondArg_, combineMapSecondArg_0 ]
    , combineMapBoth =
        \combineMapBothArg_ combineMapBothArg_0 combineMapBothArg_1 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Maybe", "Extra" ]
                     , name = "combineMapBoth"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function
                                      [ Type.var "a" ]
                                      (Type.maybe (Type.var "c"))
                                  , Type.function
                                      [ Type.var "b" ]
                                      (Type.maybe (Type.var "d"))
                                  , Type.tuple (Type.var "a") (Type.var "b")
                                  ]
                                  (Type.maybe
                                       (Type.tuple (Type.var "c") (Type.var "d")
                                       )
                                  )
                             )
                     }
                )
                [ combineMapBothArg_, combineMapBothArg_0, combineMapBothArg_1 ]
    , toList =
        \toListArg_ ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Maybe", "Extra" ]
                     , name = "toList"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.maybe (Type.var "a") ]
                                  (Type.list (Type.var "a"))
                             )
                     }
                )
                [ toListArg_ ]
    , toArray =
        \toArrayArg_ ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Maybe", "Extra" ]
                     , name = "toArray"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.maybe (Type.var "a") ]
                                  (Type.namedWith
                                       [ "Array" ]
                                       "Array"
                                       [ Type.var "a" ]
                                  )
                             )
                     }
                )
                [ toArrayArg_ ]
    , cons =
        \consArg_ consArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Maybe", "Extra" ]
                     , name = "cons"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.maybe (Type.var "a")
                                  , Type.list (Type.var "a")
                                  ]
                                  (Type.list (Type.var "a"))
                             )
                     }
                )
                [ consArg_, consArg_0 ]
    , andThen2 =
        \andThen2Arg_ andThen2Arg_0 andThen2Arg_1 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Maybe", "Extra" ]
                     , name = "andThen2"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function
                                      [ Type.var "a", Type.var "b" ]
                                      (Type.maybe (Type.var "value"))
                                  , Type.maybe (Type.var "a")
                                  , Type.maybe (Type.var "b")
                                  ]
                                  (Type.maybe (Type.var "value"))
                             )
                     }
                )
                [ andThen2Arg_, andThen2Arg_0, andThen2Arg_1 ]
    , andThen3 =
        \andThen3Arg_ andThen3Arg_0 andThen3Arg_1 andThen3Arg_2 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Maybe", "Extra" ]
                     , name = "andThen3"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function
                                      [ Type.var "a"
                                      , Type.var "b"
                                      , Type.var "c"
                                      ]
                                      (Type.maybe (Type.var "value"))
                                  , Type.maybe (Type.var "a")
                                  , Type.maybe (Type.var "b")
                                  , Type.maybe (Type.var "c")
                                  ]
                                  (Type.maybe (Type.var "value"))
                             )
                     }
                )
                [ andThen3Arg_, andThen3Arg_0, andThen3Arg_1, andThen3Arg_2 ]
    , andThen4 =
        \andThen4Arg_ andThen4Arg_0 andThen4Arg_1 andThen4Arg_2 andThen4Arg_3 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Maybe", "Extra" ]
                     , name = "andThen4"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function
                                      [ Type.var "a"
                                      , Type.var "b"
                                      , Type.var "c"
                                      , Type.var "d"
                                      ]
                                      (Type.maybe (Type.var "value"))
                                  , Type.maybe (Type.var "a")
                                  , Type.maybe (Type.var "b")
                                  , Type.maybe (Type.var "c")
                                  , Type.maybe (Type.var "d")
                                  ]
                                  (Type.maybe (Type.var "value"))
                             )
                     }
                )
                [ andThen4Arg_
                , andThen4Arg_0
                , andThen4Arg_1
                , andThen4Arg_2
                , andThen4Arg_3
                ]
    , andMap =
        \andMapArg_ andMapArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Maybe", "Extra" ]
                     , name = "andMap"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.maybe (Type.var "a")
                                  , Type.maybe
                                      (Type.function
                                         [ Type.var "a" ]
                                         (Type.var "b")
                                      )
                                  ]
                                  (Type.maybe (Type.var "b"))
                             )
                     }
                )
                [ andMapArg_, andMapArg_0 ]
    , next =
        \nextArg_ nextArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Maybe", "Extra" ]
                     , name = "next"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.maybe (Type.var "a")
                                  , Type.maybe (Type.var "b")
                                  ]
                                  (Type.maybe (Type.var "b"))
                             )
                     }
                )
                [ nextArg_, nextArg_0 ]
    , prev =
        \prevArg_ prevArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Maybe", "Extra" ]
                     , name = "prev"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.maybe (Type.var "a")
                                  , Type.maybe (Type.var "b")
                                  ]
                                  (Type.maybe (Type.var "a"))
                             )
                     }
                )
                [ prevArg_, prevArg_0 ]
    }


values_ :
    { isJust : Elm.Expression
    , isNothing : Elm.Expression
    , join : Elm.Expression
    , filter : Elm.Expression
    , withDefaultLazy : Elm.Expression
    , unwrap : Elm.Expression
    , unpack : Elm.Expression
    , or : Elm.Expression
    , orElse : Elm.Expression
    , orList : Elm.Expression
    , orLazy : Elm.Expression
    , orElseLazy : Elm.Expression
    , orListLazy : Elm.Expression
    , oneOf : Elm.Expression
    , values : Elm.Expression
    , combine : Elm.Expression
    , combineMap : Elm.Expression
    , combineArray : Elm.Expression
    , combineMapArray : Elm.Expression
    , combineFirst : Elm.Expression
    , combineSecond : Elm.Expression
    , combineBoth : Elm.Expression
    , combineMapFirst : Elm.Expression
    , combineMapSecond : Elm.Expression
    , combineMapBoth : Elm.Expression
    , toList : Elm.Expression
    , toArray : Elm.Expression
    , cons : Elm.Expression
    , andThen2 : Elm.Expression
    , andThen3 : Elm.Expression
    , andThen4 : Elm.Expression
    , andMap : Elm.Expression
    , next : Elm.Expression
    , prev : Elm.Expression
    }
values_ =
    { isJust =
        Elm.value
            { importFrom = [ "Maybe", "Extra" ]
            , name = "isJust"
            , annotation =
                Just (Type.function [ Type.maybe (Type.var "a") ] Type.bool)
            }
    , isNothing =
        Elm.value
            { importFrom = [ "Maybe", "Extra" ]
            , name = "isNothing"
            , annotation =
                Just (Type.function [ Type.maybe (Type.var "a") ] Type.bool)
            }
    , join =
        Elm.value
            { importFrom = [ "Maybe", "Extra" ]
            , name = "join"
            , annotation =
                Just
                    (Type.function
                         [ Type.maybe (Type.maybe (Type.var "a")) ]
                         (Type.maybe (Type.var "a"))
                    )
            }
    , filter =
        Elm.value
            { importFrom = [ "Maybe", "Extra" ]
            , name = "filter"
            , annotation =
                Just
                    (Type.function
                         [ Type.function [ Type.var "a" ] Type.bool
                         , Type.maybe (Type.var "a")
                         ]
                         (Type.maybe (Type.var "a"))
                    )
            }
    , withDefaultLazy =
        Elm.value
            { importFrom = [ "Maybe", "Extra" ]
            , name = "withDefaultLazy"
            , annotation =
                Just
                    (Type.function
                         [ Type.function [ Type.unit ] (Type.var "a")
                         , Type.maybe (Type.var "a")
                         ]
                         (Type.var "a")
                    )
            }
    , unwrap =
        Elm.value
            { importFrom = [ "Maybe", "Extra" ]
            , name = "unwrap"
            , annotation =
                Just
                    (Type.function
                         [ Type.var "b"
                         , Type.function [ Type.var "a" ] (Type.var "b")
                         , Type.maybe (Type.var "a")
                         ]
                         (Type.var "b")
                    )
            }
    , unpack =
        Elm.value
            { importFrom = [ "Maybe", "Extra" ]
            , name = "unpack"
            , annotation =
                Just
                    (Type.function
                         [ Type.function [ Type.unit ] (Type.var "b")
                         , Type.function [ Type.var "a" ] (Type.var "b")
                         , Type.maybe (Type.var "a")
                         ]
                         (Type.var "b")
                    )
            }
    , or =
        Elm.value
            { importFrom = [ "Maybe", "Extra" ]
            , name = "or"
            , annotation =
                Just
                    (Type.function
                         [ Type.maybe (Type.var "a")
                         , Type.maybe (Type.var "a")
                         ]
                         (Type.maybe (Type.var "a"))
                    )
            }
    , orElse =
        Elm.value
            { importFrom = [ "Maybe", "Extra" ]
            , name = "orElse"
            , annotation =
                Just
                    (Type.function
                         [ Type.maybe (Type.var "a")
                         , Type.maybe (Type.var "a")
                         ]
                         (Type.maybe (Type.var "a"))
                    )
            }
    , orList =
        Elm.value
            { importFrom = [ "Maybe", "Extra" ]
            , name = "orList"
            , annotation =
                Just
                    (Type.function
                         [ Type.list (Type.maybe (Type.var "a")) ]
                         (Type.maybe (Type.var "a"))
                    )
            }
    , orLazy =
        Elm.value
            { importFrom = [ "Maybe", "Extra" ]
            , name = "orLazy"
            , annotation =
                Just
                    (Type.function
                         [ Type.maybe (Type.var "a")
                         , Type.function
                             [ Type.unit ]
                             (Type.maybe (Type.var "a"))
                         ]
                         (Type.maybe (Type.var "a"))
                    )
            }
    , orElseLazy =
        Elm.value
            { importFrom = [ "Maybe", "Extra" ]
            , name = "orElseLazy"
            , annotation =
                Just
                    (Type.function
                         [ Type.function
                             [ Type.unit ]
                             (Type.maybe (Type.var "a"))
                         , Type.maybe (Type.var "a")
                         ]
                         (Type.maybe (Type.var "a"))
                    )
            }
    , orListLazy =
        Elm.value
            { importFrom = [ "Maybe", "Extra" ]
            , name = "orListLazy"
            , annotation =
                Just
                    (Type.function
                         [ Type.list
                             (Type.function
                                [ Type.unit ]
                                (Type.maybe (Type.var "a"))
                             )
                         ]
                         (Type.maybe (Type.var "a"))
                    )
            }
    , oneOf =
        Elm.value
            { importFrom = [ "Maybe", "Extra" ]
            , name = "oneOf"
            , annotation =
                Just
                    (Type.function
                         [ Type.list
                             (Type.function
                                [ Type.var "a" ]
                                (Type.maybe (Type.var "b"))
                             )
                         , Type.var "a"
                         ]
                         (Type.maybe (Type.var "b"))
                    )
            }
    , values =
        Elm.value
            { importFrom = [ "Maybe", "Extra" ]
            , name = "values"
            , annotation =
                Just
                    (Type.function
                         [ Type.list (Type.maybe (Type.var "a")) ]
                         (Type.list (Type.var "a"))
                    )
            }
    , combine =
        Elm.value
            { importFrom = [ "Maybe", "Extra" ]
            , name = "combine"
            , annotation =
                Just
                    (Type.function
                         [ Type.list (Type.maybe (Type.var "a")) ]
                         (Type.maybe (Type.list (Type.var "a")))
                    )
            }
    , combineMap =
        Elm.value
            { importFrom = [ "Maybe", "Extra" ]
            , name = "combineMap"
            , annotation =
                Just
                    (Type.function
                         [ Type.function
                             [ Type.var "a" ]
                             (Type.maybe (Type.var "b"))
                         , Type.list (Type.var "a")
                         ]
                         (Type.maybe (Type.list (Type.var "b")))
                    )
            }
    , combineArray =
        Elm.value
            { importFrom = [ "Maybe", "Extra" ]
            , name = "combineArray"
            , annotation =
                Just
                    (Type.function
                         [ Type.namedWith
                             [ "Array" ]
                             "Array"
                             [ Type.maybe (Type.var "a") ]
                         ]
                         (Type.maybe
                              (Type.namedWith
                                   [ "Array" ]
                                   "Array"
                                   [ Type.var "a" ]
                              )
                         )
                    )
            }
    , combineMapArray =
        Elm.value
            { importFrom = [ "Maybe", "Extra" ]
            , name = "combineMapArray"
            , annotation =
                Just
                    (Type.function
                         [ Type.function
                             [ Type.var "a" ]
                             (Type.maybe (Type.var "b"))
                         , Type.namedWith [ "Array" ] "Array" [ Type.var "a" ]
                         ]
                         (Type.maybe
                              (Type.namedWith
                                   [ "Array" ]
                                   "Array"
                                   [ Type.var "b" ]
                              )
                         )
                    )
            }
    , combineFirst =
        Elm.value
            { importFrom = [ "Maybe", "Extra" ]
            , name = "combineFirst"
            , annotation =
                Just
                    (Type.function
                         [ Type.tuple (Type.maybe (Type.var "a")) (Type.var "c")
                         ]
                         (Type.maybe (Type.tuple (Type.var "a") (Type.var "c")))
                    )
            }
    , combineSecond =
        Elm.value
            { importFrom = [ "Maybe", "Extra" ]
            , name = "combineSecond"
            , annotation =
                Just
                    (Type.function
                         [ Type.tuple (Type.var "c") (Type.maybe (Type.var "a"))
                         ]
                         (Type.maybe (Type.tuple (Type.var "c") (Type.var "a")))
                    )
            }
    , combineBoth =
        Elm.value
            { importFrom = [ "Maybe", "Extra" ]
            , name = "combineBoth"
            , annotation =
                Just
                    (Type.function
                         [ Type.tuple
                             (Type.maybe (Type.var "a"))
                             (Type.maybe (Type.var "b"))
                         ]
                         (Type.maybe (Type.tuple (Type.var "a") (Type.var "b")))
                    )
            }
    , combineMapFirst =
        Elm.value
            { importFrom = [ "Maybe", "Extra" ]
            , name = "combineMapFirst"
            , annotation =
                Just
                    (Type.function
                         [ Type.function
                             [ Type.var "a" ]
                             (Type.maybe (Type.var "b"))
                         , Type.tuple (Type.var "a") (Type.var "c")
                         ]
                         (Type.maybe (Type.tuple (Type.var "b") (Type.var "c")))
                    )
            }
    , combineMapSecond =
        Elm.value
            { importFrom = [ "Maybe", "Extra" ]
            , name = "combineMapSecond"
            , annotation =
                Just
                    (Type.function
                         [ Type.function
                             [ Type.var "a" ]
                             (Type.maybe (Type.var "b"))
                         , Type.tuple (Type.var "c") (Type.var "a")
                         ]
                         (Type.maybe (Type.tuple (Type.var "c") (Type.var "b")))
                    )
            }
    , combineMapBoth =
        Elm.value
            { importFrom = [ "Maybe", "Extra" ]
            , name = "combineMapBoth"
            , annotation =
                Just
                    (Type.function
                         [ Type.function
                             [ Type.var "a" ]
                             (Type.maybe (Type.var "c"))
                         , Type.function
                             [ Type.var "b" ]
                             (Type.maybe (Type.var "d"))
                         , Type.tuple (Type.var "a") (Type.var "b")
                         ]
                         (Type.maybe (Type.tuple (Type.var "c") (Type.var "d")))
                    )
            }
    , toList =
        Elm.value
            { importFrom = [ "Maybe", "Extra" ]
            , name = "toList"
            , annotation =
                Just
                    (Type.function
                         [ Type.maybe (Type.var "a") ]
                         (Type.list (Type.var "a"))
                    )
            }
    , toArray =
        Elm.value
            { importFrom = [ "Maybe", "Extra" ]
            , name = "toArray"
            , annotation =
                Just
                    (Type.function
                         [ Type.maybe (Type.var "a") ]
                         (Type.namedWith [ "Array" ] "Array" [ Type.var "a" ])
                    )
            }
    , cons =
        Elm.value
            { importFrom = [ "Maybe", "Extra" ]
            , name = "cons"
            , annotation =
                Just
                    (Type.function
                         [ Type.maybe (Type.var "a"), Type.list (Type.var "a") ]
                         (Type.list (Type.var "a"))
                    )
            }
    , andThen2 =
        Elm.value
            { importFrom = [ "Maybe", "Extra" ]
            , name = "andThen2"
            , annotation =
                Just
                    (Type.function
                         [ Type.function
                             [ Type.var "a", Type.var "b" ]
                             (Type.maybe (Type.var "value"))
                         , Type.maybe (Type.var "a")
                         , Type.maybe (Type.var "b")
                         ]
                         (Type.maybe (Type.var "value"))
                    )
            }
    , andThen3 =
        Elm.value
            { importFrom = [ "Maybe", "Extra" ]
            , name = "andThen3"
            , annotation =
                Just
                    (Type.function
                         [ Type.function
                             [ Type.var "a", Type.var "b", Type.var "c" ]
                             (Type.maybe (Type.var "value"))
                         , Type.maybe (Type.var "a")
                         , Type.maybe (Type.var "b")
                         , Type.maybe (Type.var "c")
                         ]
                         (Type.maybe (Type.var "value"))
                    )
            }
    , andThen4 =
        Elm.value
            { importFrom = [ "Maybe", "Extra" ]
            , name = "andThen4"
            , annotation =
                Just
                    (Type.function
                         [ Type.function
                             [ Type.var "a"
                             , Type.var "b"
                             , Type.var "c"
                             , Type.var "d"
                             ]
                             (Type.maybe (Type.var "value"))
                         , Type.maybe (Type.var "a")
                         , Type.maybe (Type.var "b")
                         , Type.maybe (Type.var "c")
                         , Type.maybe (Type.var "d")
                         ]
                         (Type.maybe (Type.var "value"))
                    )
            }
    , andMap =
        Elm.value
            { importFrom = [ "Maybe", "Extra" ]
            , name = "andMap"
            , annotation =
                Just
                    (Type.function
                         [ Type.maybe (Type.var "a")
                         , Type.maybe
                             (Type.function [ Type.var "a" ] (Type.var "b"))
                         ]
                         (Type.maybe (Type.var "b"))
                    )
            }
    , next =
        Elm.value
            { importFrom = [ "Maybe", "Extra" ]
            , name = "next"
            , annotation =
                Just
                    (Type.function
                         [ Type.maybe (Type.var "a")
                         , Type.maybe (Type.var "b")
                         ]
                         (Type.maybe (Type.var "b"))
                    )
            }
    , prev =
        Elm.value
            { importFrom = [ "Maybe", "Extra" ]
            , name = "prev"
            , annotation =
                Just
                    (Type.function
                         [ Type.maybe (Type.var "a")
                         , Type.maybe (Type.var "b")
                         ]
                         (Type.maybe (Type.var "a"))
                    )
            }
    }