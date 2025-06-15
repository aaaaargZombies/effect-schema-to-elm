module Gen.Result.Extra exposing
    ( moduleName_, isOk, isErr, extract, unwrap, unpack
    , error, mapBoth, merge, join, partition, filter, combine
    , combineMap, combineArray, combineMapArray, combineFirst, combineSecond, combineBoth, combineMapFirst
    , combineMapSecond, combineMapBoth, andMap, or, orLazy, orElseLazy, orElse
    , toTask, call_, values_
    )

{-|
# Generated bindings for Result.Extra

@docs moduleName_, isOk, isErr, extract, unwrap, unpack
@docs error, mapBoth, merge, join, partition, filter
@docs combine, combineMap, combineArray, combineMapArray, combineFirst, combineSecond
@docs combineBoth, combineMapFirst, combineMapSecond, combineMapBoth, andMap, or
@docs orLazy, orElseLazy, orElse, toTask, call_, values_
-}


import Elm
import Elm.Annotation as Type


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Result", "Extra" ]


{-| Check whether the result is `Ok` without unwrapping it.

isOk: Result.Result e a -> Bool
-}
isOk : Elm.Expression -> Elm.Expression
isOk isOkArg_ =
    Elm.apply
        (Elm.value
             { importFrom = [ "Result", "Extra" ]
             , name = "isOk"
             , annotation =
                 Just
                     (Type.function
                          [ Type.namedWith
                              [ "Result" ]
                              "Result"
                              [ Type.var "e", Type.var "a" ]
                          ]
                          Type.bool
                     )
             }
        )
        [ isOkArg_ ]


{-| Check whether the result is `Err` without unwrapping it.

isErr: Result.Result e a -> Bool
-}
isErr : Elm.Expression -> Elm.Expression
isErr isErrArg_ =
    Elm.apply
        (Elm.value
             { importFrom = [ "Result", "Extra" ]
             , name = "isErr"
             , annotation =
                 Just
                     (Type.function
                          [ Type.namedWith
                              [ "Result" ]
                              "Result"
                              [ Type.var "e", Type.var "a" ]
                          ]
                          Type.bool
                     )
             }
        )
        [ isErrArg_ ]


{-| Turn a `Result e a` to an `a`, by applying the conversion
function specified to the `e`.

extract: (e -> a) -> Result.Result e a -> a
-}
extract : (Elm.Expression -> Elm.Expression) -> Elm.Expression -> Elm.Expression
extract extractArg_ extractArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Result", "Extra" ]
             , name = "extract"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function [ Type.var "e" ] (Type.var "a")
                          , Type.namedWith
                              [ "Result" ]
                              "Result"
                              [ Type.var "e", Type.var "a" ]
                          ]
                          (Type.var "a")
                     )
             }
        )
        [ Elm.functionReduced "extractUnpack" extractArg_, extractArg_0 ]


{-| Convert a `Result e a` to a `b` by applying a function if
the `Result` is `Ok` or using the provided default value if it
is an `Err`.

unwrap: b -> (a -> b) -> Result.Result e a -> b
-}
unwrap :
    Elm.Expression
    -> (Elm.Expression -> Elm.Expression)
    -> Elm.Expression
    -> Elm.Expression
unwrap unwrapArg_ unwrapArg_0 unwrapArg_1 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Result", "Extra" ]
             , name = "unwrap"
             , annotation =
                 Just
                     (Type.function
                          [ Type.var "b"
                          , Type.function [ Type.var "a" ] (Type.var "b")
                          , Type.namedWith
                              [ "Result" ]
                              "Result"
                              [ Type.var "e", Type.var "a" ]
                          ]
                          (Type.var "b")
                     )
             }
        )
        [ unwrapArg_
        , Elm.functionReduced "unwrapUnpack" unwrapArg_0
        , unwrapArg_1
        ]


{-| Convert a `Result e a` to a `b` by applying either the first
function if the `Result` is an `Err` or the second function if the
`Result` is `Ok`. Both of these functions must return the same type.

unpack: (e -> b) -> (a -> b) -> Result.Result e a -> b
-}
unpack :
    (Elm.Expression -> Elm.Expression)
    -> (Elm.Expression -> Elm.Expression)
    -> Elm.Expression
    -> Elm.Expression
unpack unpackArg_ unpackArg_0 unpackArg_1 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Result", "Extra" ]
             , name = "unpack"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function [ Type.var "e" ] (Type.var "b")
                          , Type.function [ Type.var "a" ] (Type.var "b")
                          , Type.namedWith
                              [ "Result" ]
                              "Result"
                              [ Type.var "e", Type.var "a" ]
                          ]
                          (Type.var "b")
                     )
             }
        )
        [ Elm.functionReduced "unpackUnpack" unpackArg_
        , Elm.functionReduced "unpackUnpack" unpackArg_0
        , unpackArg_1
        ]


{-| Convert to a Maybe containing the error, if there is one.

    parseInt : String -> Result ParseError Int

    maybeParseError : String -> Maybe ParseError
    maybeParseError string =
        error (parseInt string)

error: Result.Result e a -> Maybe e
-}
error : Elm.Expression -> Elm.Expression
error errorArg_ =
    Elm.apply
        (Elm.value
             { importFrom = [ "Result", "Extra" ]
             , name = "error"
             , annotation =
                 Just
                     (Type.function
                          [ Type.namedWith
                              [ "Result" ]
                              "Result"
                              [ Type.var "e", Type.var "a" ]
                          ]
                          (Type.maybe (Type.var "e"))
                     )
             }
        )
        [ errorArg_ ]


{-| Apply the first argument function to an `Err` and the second
argument function to an `Ok` of a `Result`.

mapBoth: (e -> f) -> (a -> b) -> Result.Result e a -> Result.Result f b
-}
mapBoth :
    (Elm.Expression -> Elm.Expression)
    -> (Elm.Expression -> Elm.Expression)
    -> Elm.Expression
    -> Elm.Expression
mapBoth mapBothArg_ mapBothArg_0 mapBothArg_1 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Result", "Extra" ]
             , name = "mapBoth"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function [ Type.var "e" ] (Type.var "f")
                          , Type.function [ Type.var "a" ] (Type.var "b")
                          , Type.namedWith
                              [ "Result" ]
                              "Result"
                              [ Type.var "e", Type.var "a" ]
                          ]
                          (Type.namedWith
                               [ "Result" ]
                               "Result"
                               [ Type.var "f", Type.var "b" ]
                          )
                     )
             }
        )
        [ Elm.functionReduced "mapBothUnpack" mapBothArg_
        , Elm.functionReduced "mapBothUnpack" mapBothArg_0
        , mapBothArg_1
        ]


{-| Eliminate Result when error and success have been mapped to the same
type, such as a message type.

    merge (Ok 4) == 4

    merge (Err -1) == -1

More pragmatically:

    type Msg
        = UserTypedInt Int
        | UserInputError String

    msgFromInput : String -> Msg
    msgFromInput =
        String.toInt
            >> Result.mapError UserInputError
            >> Result.map UserTypedInt
            >> Result.Extra.merge

merge: Result.Result a a -> a
-}
merge : Elm.Expression -> Elm.Expression
merge mergeArg_ =
    Elm.apply
        (Elm.value
             { importFrom = [ "Result", "Extra" ]
             , name = "merge"
             , annotation =
                 Just
                     (Type.function
                          [ Type.namedWith
                              [ "Result" ]
                              "Result"
                              [ Type.var "a", Type.var "a" ]
                          ]
                          (Type.var "a")
                     )
             }
        )
        [ mergeArg_ ]


{-| Join contained results with the same error into one result.

Usefull if you have a "result in a result":

    join <| Ok (Ok 4) == Ok 4

    join <| Ok (Err "message") == Err "message"

join: Result.Result x (Result.Result x a) -> Result.Result x a
-}
join : Elm.Expression -> Elm.Expression
join joinArg_ =
    Elm.apply
        (Elm.value
             { importFrom = [ "Result", "Extra" ]
             , name = "join"
             , annotation =
                 Just
                     (Type.function
                          [ Type.namedWith
                              [ "Result" ]
                              "Result"
                              [ Type.var "x"
                              , Type.namedWith
                                    [ "Result" ]
                                    "Result"
                                    [ Type.var "x", Type.var "a" ]
                              ]
                          ]
                          (Type.namedWith
                               [ "Result" ]
                               "Result"
                               [ Type.var "x", Type.var "a" ]
                          )
                     )
             }
        )
        [ joinArg_ ]


{-| Partition a list of Results into two lists of values (successes
and failures), much as List.partition takes a predicate and splits
a list based on whether the predicate indicates success or failure.

    partition ( Ok 4, Err "no", Err "hi" ) == ( [ 4 ], [ "no", "hi" ] )

    partition ( Err 7.1, Ok 'k', Err 9.0, Ok 'p' ) == ( [ 'k', 'p' ], [ 7.1, 9.0 ] )

partition: List (Result.Result e a) -> ( List a, List e )
-}
partition : List Elm.Expression -> Elm.Expression
partition partitionArg_ =
    Elm.apply
        (Elm.value
             { importFrom = [ "Result", "Extra" ]
             , name = "partition"
             , annotation =
                 Just
                     (Type.function
                          [ Type.list
                              (Type.namedWith
                                 [ "Result" ]
                                 "Result"
                                 [ Type.var "e", Type.var "a" ]
                              )
                          ]
                          (Type.tuple
                               (Type.list (Type.var "a"))
                               (Type.list (Type.var "e"))
                          )
                     )
             }
        )
        [ Elm.list partitionArg_ ]


{-| Take a `Result` and a predicate function and return a `Result` with the
original value when a predicate matches.

    filter "is not 1" (\v -> v == 1) (Ok 1) == Ok 1

    filter "is not 2" (\v -> v == 2) (Ok 1) == Err "is not 2"

filter: e -> (a -> Bool) -> Result.Result e a -> Result.Result e a
-}
filter :
    Elm.Expression
    -> (Elm.Expression -> Elm.Expression)
    -> Elm.Expression
    -> Elm.Expression
filter filterArg_ filterArg_0 filterArg_1 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Result", "Extra" ]
             , name = "filter"
             , annotation =
                 Just
                     (Type.function
                          [ Type.var "e"
                          , Type.function [ Type.var "a" ] Type.bool
                          , Type.namedWith
                              [ "Result" ]
                              "Result"
                              [ Type.var "e", Type.var "a" ]
                          ]
                          (Type.namedWith
                               [ "Result" ]
                               "Result"
                               [ Type.var "e", Type.var "a" ]
                          )
                     )
             }
        )
        [ filterArg_
        , Elm.functionReduced "filterUnpack" filterArg_0
        , filterArg_1
        ]


{-| Combine a list of results into a single result (holding a list).
Also known as `sequence` on lists.

combine: List (Result.Result x a) -> Result.Result x (List a)
-}
combine : List Elm.Expression -> Elm.Expression
combine combineArg_ =
    Elm.apply
        (Elm.value
             { importFrom = [ "Result", "Extra" ]
             , name = "combine"
             , annotation =
                 Just
                     (Type.function
                          [ Type.list
                              (Type.namedWith
                                 [ "Result" ]
                                 "Result"
                                 [ Type.var "x", Type.var "a" ]
                              )
                          ]
                          (Type.namedWith
                               [ "Result" ]
                               "Result"
                               [ Type.var "x", Type.list (Type.var "a") ]
                          )
                     )
             }
        )
        [ Elm.list combineArg_ ]


{-| Map a function producing results on a list
and combine those into a single result (holding a list).
Also known as `traverse` on lists.

    combineMap f xs == combine (List.map f xs)

combineMap: (a -> Result.Result x b) -> List a -> Result.Result x (List b)
-}
combineMap :
    (Elm.Expression -> Elm.Expression) -> List Elm.Expression -> Elm.Expression
combineMap combineMapArg_ combineMapArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Result", "Extra" ]
             , name = "combineMap"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function
                              [ Type.var "a" ]
                              (Type.namedWith
                                 [ "Result" ]
                                 "Result"
                                 [ Type.var "x", Type.var "b" ]
                              )
                          , Type.list (Type.var "a")
                          ]
                          (Type.namedWith
                               [ "Result" ]
                               "Result"
                               [ Type.var "x", Type.list (Type.var "b") ]
                          )
                     )
             }
        )
        [ Elm.functionReduced "combineMapUnpack" combineMapArg_
        , Elm.list combineMapArg_0
        ]


{-| Like [`combine`](#combine),
but works on [`Array`](https://package.elm-lang.org/packages/elm/core/latest/Array) instead of `List`.

combineArray: Array.Array (Result.Result x a) -> Result.Result x (Array.Array a)
-}
combineArray : Elm.Expression -> Elm.Expression
combineArray combineArrayArg_ =
    Elm.apply
        (Elm.value
             { importFrom = [ "Result", "Extra" ]
             , name = "combineArray"
             , annotation =
                 Just
                     (Type.function
                          [ Type.namedWith
                              [ "Array" ]
                              "Array"
                              [ Type.namedWith
                                    [ "Result" ]
                                    "Result"
                                    [ Type.var "x", Type.var "a" ]
                              ]
                          ]
                          (Type.namedWith
                               [ "Result" ]
                               "Result"
                               [ Type.var "x"
                               , Type.namedWith
                                   [ "Array" ]
                                   "Array"
                                   [ Type.var "a" ]
                               ]
                          )
                     )
             }
        )
        [ combineArrayArg_ ]


{-| Like [`combineMap`](#combineMap),
but works on [`Array`](https://package.elm-lang.org/packages/elm/core/latest/Array) instead of `List`.

combineMapArray: (a -> Result.Result x b) -> Array.Array a -> Result.Result x (Array.Array b)
-}
combineMapArray :
    (Elm.Expression -> Elm.Expression) -> Elm.Expression -> Elm.Expression
combineMapArray combineMapArrayArg_ combineMapArrayArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Result", "Extra" ]
             , name = "combineMapArray"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function
                              [ Type.var "a" ]
                              (Type.namedWith
                                 [ "Result" ]
                                 "Result"
                                 [ Type.var "x", Type.var "b" ]
                              )
                          , Type.namedWith [ "Array" ] "Array" [ Type.var "a" ]
                          ]
                          (Type.namedWith
                               [ "Result" ]
                               "Result"
                               [ Type.var "x"
                               , Type.namedWith
                                   [ "Array" ]
                                   "Array"
                                   [ Type.var "b" ]
                               ]
                          )
                     )
             }
        )
        [ Elm.functionReduced "combineMapArrayUnpack" combineMapArrayArg_
        , combineMapArrayArg_0
        ]


{-| Pull a result out of the _first_ element of a tuple
and combine it into a result holding the tuple's values.

combineFirst: ( Result.Result x a, c ) -> Result.Result x ( a, c )
-}
combineFirst : Elm.Expression -> Elm.Expression
combineFirst combineFirstArg_ =
    Elm.apply
        (Elm.value
             { importFrom = [ "Result", "Extra" ]
             , name = "combineFirst"
             , annotation =
                 Just
                     (Type.function
                          [ Type.tuple
                              (Type.namedWith
                                 [ "Result" ]
                                 "Result"
                                 [ Type.var "x", Type.var "a" ]
                              )
                              (Type.var "c")
                          ]
                          (Type.namedWith
                               [ "Result" ]
                               "Result"
                               [ Type.var "x"
                               , Type.tuple (Type.var "a") (Type.var "c")
                               ]
                          )
                     )
             }
        )
        [ combineFirstArg_ ]


{-| Pull a result out of the _second_ element of a tuple
and combine it into a result holding the tuple's values.
Also known as `sequence` on tuples.

combineSecond: ( c, Result.Result x a ) -> Result.Result x ( c, a )
-}
combineSecond : Elm.Expression -> Elm.Expression
combineSecond combineSecondArg_ =
    Elm.apply
        (Elm.value
             { importFrom = [ "Result", "Extra" ]
             , name = "combineSecond"
             , annotation =
                 Just
                     (Type.function
                          [ Type.tuple
                              (Type.var "c")
                              (Type.namedWith
                                 [ "Result" ]
                                 "Result"
                                 [ Type.var "x", Type.var "a" ]
                              )
                          ]
                          (Type.namedWith
                               [ "Result" ]
                               "Result"
                               [ Type.var "x"
                               , Type.tuple (Type.var "c") (Type.var "a")
                               ]
                          )
                     )
             }
        )
        [ combineSecondArg_ ]


{-| Combine all results in a tuple
into a single result holding the tuple's values.
Also know as `bisequence` on tuples.

combineBoth: ( Result.Result x a, Result.Result x b ) -> Result.Result x ( a, b )
-}
combineBoth : Elm.Expression -> Elm.Expression
combineBoth combineBothArg_ =
    Elm.apply
        (Elm.value
             { importFrom = [ "Result", "Extra" ]
             , name = "combineBoth"
             , annotation =
                 Just
                     (Type.function
                          [ Type.tuple
                              (Type.namedWith
                                 [ "Result" ]
                                 "Result"
                                 [ Type.var "x", Type.var "a" ]
                              )
                              (Type.namedWith
                                 [ "Result" ]
                                 "Result"
                                 [ Type.var "x", Type.var "b" ]
                              )
                          ]
                          (Type.namedWith
                               [ "Result" ]
                               "Result"
                               [ Type.var "x"
                               , Type.tuple (Type.var "a") (Type.var "b")
                               ]
                          )
                     )
             }
        )
        [ combineBothArg_ ]


{-| Map a function producing results on the _first_ element of a tuple
and then pull it out using `combineFirst`.
Also know as `sequence` on tuples.

    combineMapFirst f ( x, y )
        == combineFirst (Tuple.mapFirst f ( x, y ))
        == Result.map (\newX -> ( newX, y )) (f x)

combineMapFirst: (a -> Result.Result x b) -> ( a, c ) -> Result.Result x ( b, c )
-}
combineMapFirst :
    (Elm.Expression -> Elm.Expression) -> Elm.Expression -> Elm.Expression
combineMapFirst combineMapFirstArg_ combineMapFirstArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Result", "Extra" ]
             , name = "combineMapFirst"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function
                              [ Type.var "a" ]
                              (Type.namedWith
                                 [ "Result" ]
                                 "Result"
                                 [ Type.var "x", Type.var "b" ]
                              )
                          , Type.tuple (Type.var "a") (Type.var "c")
                          ]
                          (Type.namedWith
                               [ "Result" ]
                               "Result"
                               [ Type.var "x"
                               , Type.tuple (Type.var "b") (Type.var "c")
                               ]
                          )
                     )
             }
        )
        [ Elm.functionReduced "combineMapFirstUnpack" combineMapFirstArg_
        , combineMapFirstArg_0
        ]


{-| Map a function producing results on the _second_ element of a tuple
and then pull it out using `combineSecond`.
Also know as `traverse` on tuples.

    combineMapSecond f ( x, y )
        == combineSecond (Tuple.mapSecond f ( x, y ))
        == Result.map (Tuple.pair x) (f y)

combineMapSecond: (a -> Result.Result x b) -> ( c, a ) -> Result.Result x ( c, b )
-}
combineMapSecond :
    (Elm.Expression -> Elm.Expression) -> Elm.Expression -> Elm.Expression
combineMapSecond combineMapSecondArg_ combineMapSecondArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Result", "Extra" ]
             , name = "combineMapSecond"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function
                              [ Type.var "a" ]
                              (Type.namedWith
                                 [ "Result" ]
                                 "Result"
                                 [ Type.var "x", Type.var "b" ]
                              )
                          , Type.tuple (Type.var "c") (Type.var "a")
                          ]
                          (Type.namedWith
                               [ "Result" ]
                               "Result"
                               [ Type.var "x"
                               , Type.tuple (Type.var "c") (Type.var "b")
                               ]
                          )
                     )
             }
        )
        [ Elm.functionReduced "combineMapSecondUnpack" combineMapSecondArg_
        , combineMapSecondArg_0
        ]


{-| Map a function producing results on the _both_ elements of a tuple
and then pull them out using `combineBoth`.
Also know as `bitraverse` on tuples.

    combineMapBoth f g ( x, y )
        == combineBoth (Tuple.mapBoth f g ( x, y ))
        == Result.map2 Tuple.pair (f x) (g y)

combineMapBoth: 
    (a -> Result.Result x c)
    -> (b -> Result.Result x d)
    -> ( a, b )
    -> Result.Result x ( c, d )
-}
combineMapBoth :
    (Elm.Expression -> Elm.Expression)
    -> (Elm.Expression -> Elm.Expression)
    -> Elm.Expression
    -> Elm.Expression
combineMapBoth combineMapBothArg_ combineMapBothArg_0 combineMapBothArg_1 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Result", "Extra" ]
             , name = "combineMapBoth"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function
                              [ Type.var "a" ]
                              (Type.namedWith
                                 [ "Result" ]
                                 "Result"
                                 [ Type.var "x", Type.var "c" ]
                              )
                          , Type.function
                              [ Type.var "b" ]
                              (Type.namedWith
                                 [ "Result" ]
                                 "Result"
                                 [ Type.var "x", Type.var "d" ]
                              )
                          , Type.tuple (Type.var "a") (Type.var "b")
                          ]
                          (Type.namedWith
                               [ "Result" ]
                               "Result"
                               [ Type.var "x"
                               , Type.tuple (Type.var "c") (Type.var "d")
                               ]
                          )
                     )
             }
        )
        [ Elm.functionReduced "combineMapBothUnpack" combineMapBothArg_
        , Elm.functionReduced "combineMapBothUnpack" combineMapBothArg_0
        , combineMapBothArg_1
        ]


{-| Apply the function that is inside `Result` to a value that is inside
`Result`. Return the result inside `Result`. If one of the `Result`
arguments is `Err e`, return `Err e`. Also known as `apply`.

    Err "Oh" |> andMap (Err "No!") == Err "Oh"

    Err "Oh" |> andMap (Ok 2) == Err "Oh"

    Ok ((+) 1) |> andMap (Err "No!") == Err "No!"

    Ok ((+) 1) |> andMap (Ok 2) == Ok 3

andMap: Result.Result e a -> Result.Result e (a -> b) -> Result.Result e b
-}
andMap : Elm.Expression -> Elm.Expression -> Elm.Expression
andMap andMapArg_ andMapArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Result", "Extra" ]
             , name = "andMap"
             , annotation =
                 Just
                     (Type.function
                          [ Type.namedWith
                              [ "Result" ]
                              "Result"
                              [ Type.var "e", Type.var "a" ]
                          , Type.namedWith
                              [ "Result" ]
                              "Result"
                              [ Type.var "e"
                              , Type.function [ Type.var "a" ] (Type.var "b")
                              ]
                          ]
                          (Type.namedWith
                               [ "Result" ]
                               "Result"
                               [ Type.var "e", Type.var "b" ]
                          )
                     )
             }
        )
        [ andMapArg_, andMapArg_0 ]


{-| Like the Boolean `||` this will return the first value that is
positive (`Ok`). However, unlike with `||`, both values will be
computed anyway (there is no short-circuiting).

    or (Ok 4) (Ok 5) == Ok 4

    or (Err "Oh!") (Ok 5) == Ok 5

    or (Ok 4) (Err "No!") == Ok 4

    or (Err "Oh!") (Err "No!") == Err "No!"

As the last example line shows, the second error is returned if both
results are erroneous.

or: Result.Result e a -> Result.Result e a -> Result.Result e a
-}
or : Elm.Expression -> Elm.Expression -> Elm.Expression
or orArg_ orArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Result", "Extra" ]
             , name = "or"
             , annotation =
                 Just
                     (Type.function
                          [ Type.namedWith
                              [ "Result" ]
                              "Result"
                              [ Type.var "e", Type.var "a" ]
                          , Type.namedWith
                              [ "Result" ]
                              "Result"
                              [ Type.var "e", Type.var "a" ]
                          ]
                          (Type.namedWith
                               [ "Result" ]
                               "Result"
                               [ Type.var "e", Type.var "a" ]
                          )
                     )
             }
        )
        [ orArg_, orArg_0 ]


{-| Non-strict version of `or`. The second argument will only be
evaluated if the first argument is an `Err`.

orLazy: Result.Result e a -> (() -> Result.Result e a) -> Result.Result e a
-}
orLazy : Elm.Expression -> (Elm.Expression -> Elm.Expression) -> Elm.Expression
orLazy orLazyArg_ orLazyArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Result", "Extra" ]
             , name = "orLazy"
             , annotation =
                 Just
                     (Type.function
                          [ Type.namedWith
                              [ "Result" ]
                              "Result"
                              [ Type.var "e", Type.var "a" ]
                          , Type.function
                              [ Type.unit ]
                              (Type.namedWith
                                 [ "Result" ]
                                 "Result"
                                 [ Type.var "e", Type.var "a" ]
                              )
                          ]
                          (Type.namedWith
                               [ "Result" ]
                               "Result"
                               [ Type.var "e", Type.var "a" ]
                          )
                     )
             }
        )
        [ orLazyArg_, Elm.functionReduced "orLazyUnpack" orLazyArg_0 ]


{-| Piping-friendly version of `orLazy`. The first argument will only
be evaluated if the second argument is an `Err`. Example use:

    String.toInt "Hello"
        |> orElseLazy (\() -> String.toInt "42")

orElseLazy: (() -> Result.Result e a) -> Result.Result e a -> Result.Result e a
-}
orElseLazy :
    (Elm.Expression -> Elm.Expression) -> Elm.Expression -> Elm.Expression
orElseLazy orElseLazyArg_ orElseLazyArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Result", "Extra" ]
             , name = "orElseLazy"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function
                              [ Type.unit ]
                              (Type.namedWith
                                 [ "Result" ]
                                 "Result"
                                 [ Type.var "e", Type.var "a" ]
                              )
                          , Type.namedWith
                              [ "Result" ]
                              "Result"
                              [ Type.var "e", Type.var "a" ]
                          ]
                          (Type.namedWith
                               [ "Result" ]
                               "Result"
                               [ Type.var "e", Type.var "a" ]
                          )
                     )
             }
        )
        [ Elm.functionReduced "orElseLazyUnpack" orElseLazyArg_
        , orElseLazyArg_0
        ]


{-| Strict version of `orElseLazy` (and at the same time,
piping-friendly version of `or`).

    orElse (Ok 4) (Ok 5) == Ok 5 -- crucial difference from `or`

    orElse (Err "Oh!") (Ok 5) == Ok 5

    orElse (Ok 4) (Err "No!") == Ok 4

    orElse (Err "Oh!") (Err "No!") == Err "Oh!" -- also different from `or`

Also:

    String.toInt "Hello"
        |> orElse (String.toInt "42")

orElse: Result.Result e a -> Result.Result e a -> Result.Result e a
-}
orElse : Elm.Expression -> Elm.Expression -> Elm.Expression
orElse orElseArg_ orElseArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Result", "Extra" ]
             , name = "orElse"
             , annotation =
                 Just
                     (Type.function
                          [ Type.namedWith
                              [ "Result" ]
                              "Result"
                              [ Type.var "e", Type.var "a" ]
                          , Type.namedWith
                              [ "Result" ]
                              "Result"
                              [ Type.var "e", Type.var "a" ]
                          ]
                          (Type.namedWith
                               [ "Result" ]
                               "Result"
                               [ Type.var "e", Type.var "a" ]
                          )
                     )
             }
        )
        [ orElseArg_, orElseArg_0 ]


{-| Convert a `Result` to a `Task` that will fail or succeed immediately.

    toTask (Ok 4) == Task.succeed 4

    toTask (Err "msg") == Task.fail "msg"

This can be helpful when the value of a succeeding Task needs to be decoded, but
a failure to decode should result in a failing `Task`, not a succeeding Task
containing a `Result.Err`:

    andThenDecode : (a -> Result x b) -> Task x a -> Task x b
    andThenDecode decode =
        Task.andThen (decode >> Result.Extra.toTask)

toTask: Result.Result x a -> Task.Task x a
-}
toTask : Elm.Expression -> Elm.Expression
toTask toTaskArg_ =
    Elm.apply
        (Elm.value
             { importFrom = [ "Result", "Extra" ]
             , name = "toTask"
             , annotation =
                 Just
                     (Type.function
                          [ Type.namedWith
                              [ "Result" ]
                              "Result"
                              [ Type.var "x", Type.var "a" ]
                          ]
                          (Type.namedWith
                               [ "Task" ]
                               "Task"
                               [ Type.var "x", Type.var "a" ]
                          )
                     )
             }
        )
        [ toTaskArg_ ]


call_ :
    { isOk : Elm.Expression -> Elm.Expression
    , isErr : Elm.Expression -> Elm.Expression
    , extract : Elm.Expression -> Elm.Expression -> Elm.Expression
    , unwrap :
        Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
    , unpack :
        Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
    , error : Elm.Expression -> Elm.Expression
    , mapBoth :
        Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
    , merge : Elm.Expression -> Elm.Expression
    , join : Elm.Expression -> Elm.Expression
    , partition : Elm.Expression -> Elm.Expression
    , filter :
        Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
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
    , andMap : Elm.Expression -> Elm.Expression -> Elm.Expression
    , or : Elm.Expression -> Elm.Expression -> Elm.Expression
    , orLazy : Elm.Expression -> Elm.Expression -> Elm.Expression
    , orElseLazy : Elm.Expression -> Elm.Expression -> Elm.Expression
    , orElse : Elm.Expression -> Elm.Expression -> Elm.Expression
    , toTask : Elm.Expression -> Elm.Expression
    }
call_ =
    { isOk =
        \isOkArg_ ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Result", "Extra" ]
                     , name = "isOk"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.namedWith
                                      [ "Result" ]
                                      "Result"
                                      [ Type.var "e", Type.var "a" ]
                                  ]
                                  Type.bool
                             )
                     }
                )
                [ isOkArg_ ]
    , isErr =
        \isErrArg_ ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Result", "Extra" ]
                     , name = "isErr"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.namedWith
                                      [ "Result" ]
                                      "Result"
                                      [ Type.var "e", Type.var "a" ]
                                  ]
                                  Type.bool
                             )
                     }
                )
                [ isErrArg_ ]
    , extract =
        \extractArg_ extractArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Result", "Extra" ]
                     , name = "extract"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function
                                      [ Type.var "e" ]
                                      (Type.var "a")
                                  , Type.namedWith
                                      [ "Result" ]
                                      "Result"
                                      [ Type.var "e", Type.var "a" ]
                                  ]
                                  (Type.var "a")
                             )
                     }
                )
                [ extractArg_, extractArg_0 ]
    , unwrap =
        \unwrapArg_ unwrapArg_0 unwrapArg_1 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Result", "Extra" ]
                     , name = "unwrap"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.var "b"
                                  , Type.function
                                      [ Type.var "a" ]
                                      (Type.var "b")
                                  , Type.namedWith
                                      [ "Result" ]
                                      "Result"
                                      [ Type.var "e", Type.var "a" ]
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
                     { importFrom = [ "Result", "Extra" ]
                     , name = "unpack"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function
                                      [ Type.var "e" ]
                                      (Type.var "b")
                                  , Type.function
                                      [ Type.var "a" ]
                                      (Type.var "b")
                                  , Type.namedWith
                                      [ "Result" ]
                                      "Result"
                                      [ Type.var "e", Type.var "a" ]
                                  ]
                                  (Type.var "b")
                             )
                     }
                )
                [ unpackArg_, unpackArg_0, unpackArg_1 ]
    , error =
        \errorArg_ ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Result", "Extra" ]
                     , name = "error"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.namedWith
                                      [ "Result" ]
                                      "Result"
                                      [ Type.var "e", Type.var "a" ]
                                  ]
                                  (Type.maybe (Type.var "e"))
                             )
                     }
                )
                [ errorArg_ ]
    , mapBoth =
        \mapBothArg_ mapBothArg_0 mapBothArg_1 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Result", "Extra" ]
                     , name = "mapBoth"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function
                                      [ Type.var "e" ]
                                      (Type.var "f")
                                  , Type.function
                                      [ Type.var "a" ]
                                      (Type.var "b")
                                  , Type.namedWith
                                      [ "Result" ]
                                      "Result"
                                      [ Type.var "e", Type.var "a" ]
                                  ]
                                  (Type.namedWith
                                       [ "Result" ]
                                       "Result"
                                       [ Type.var "f", Type.var "b" ]
                                  )
                             )
                     }
                )
                [ mapBothArg_, mapBothArg_0, mapBothArg_1 ]
    , merge =
        \mergeArg_ ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Result", "Extra" ]
                     , name = "merge"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.namedWith
                                      [ "Result" ]
                                      "Result"
                                      [ Type.var "a", Type.var "a" ]
                                  ]
                                  (Type.var "a")
                             )
                     }
                )
                [ mergeArg_ ]
    , join =
        \joinArg_ ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Result", "Extra" ]
                     , name = "join"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.namedWith
                                      [ "Result" ]
                                      "Result"
                                      [ Type.var "x"
                                      , Type.namedWith
                                            [ "Result" ]
                                            "Result"
                                            [ Type.var "x", Type.var "a" ]
                                      ]
                                  ]
                                  (Type.namedWith
                                       [ "Result" ]
                                       "Result"
                                       [ Type.var "x", Type.var "a" ]
                                  )
                             )
                     }
                )
                [ joinArg_ ]
    , partition =
        \partitionArg_ ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Result", "Extra" ]
                     , name = "partition"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.list
                                      (Type.namedWith
                                         [ "Result" ]
                                         "Result"
                                         [ Type.var "e", Type.var "a" ]
                                      )
                                  ]
                                  (Type.tuple
                                       (Type.list (Type.var "a"))
                                       (Type.list (Type.var "e"))
                                  )
                             )
                     }
                )
                [ partitionArg_ ]
    , filter =
        \filterArg_ filterArg_0 filterArg_1 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Result", "Extra" ]
                     , name = "filter"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.var "e"
                                  , Type.function [ Type.var "a" ] Type.bool
                                  , Type.namedWith
                                      [ "Result" ]
                                      "Result"
                                      [ Type.var "e", Type.var "a" ]
                                  ]
                                  (Type.namedWith
                                       [ "Result" ]
                                       "Result"
                                       [ Type.var "e", Type.var "a" ]
                                  )
                             )
                     }
                )
                [ filterArg_, filterArg_0, filterArg_1 ]
    , combine =
        \combineArg_ ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Result", "Extra" ]
                     , name = "combine"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.list
                                      (Type.namedWith
                                         [ "Result" ]
                                         "Result"
                                         [ Type.var "x", Type.var "a" ]
                                      )
                                  ]
                                  (Type.namedWith
                                       [ "Result" ]
                                       "Result"
                                       [ Type.var "x"
                                       , Type.list (Type.var "a")
                                       ]
                                  )
                             )
                     }
                )
                [ combineArg_ ]
    , combineMap =
        \combineMapArg_ combineMapArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Result", "Extra" ]
                     , name = "combineMap"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function
                                      [ Type.var "a" ]
                                      (Type.namedWith
                                         [ "Result" ]
                                         "Result"
                                         [ Type.var "x", Type.var "b" ]
                                      )
                                  , Type.list (Type.var "a")
                                  ]
                                  (Type.namedWith
                                       [ "Result" ]
                                       "Result"
                                       [ Type.var "x"
                                       , Type.list (Type.var "b")
                                       ]
                                  )
                             )
                     }
                )
                [ combineMapArg_, combineMapArg_0 ]
    , combineArray =
        \combineArrayArg_ ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Result", "Extra" ]
                     , name = "combineArray"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.namedWith
                                      [ "Array" ]
                                      "Array"
                                      [ Type.namedWith
                                            [ "Result" ]
                                            "Result"
                                            [ Type.var "x", Type.var "a" ]
                                      ]
                                  ]
                                  (Type.namedWith
                                       [ "Result" ]
                                       "Result"
                                       [ Type.var "x"
                                       , Type.namedWith
                                           [ "Array" ]
                                           "Array"
                                           [ Type.var "a" ]
                                       ]
                                  )
                             )
                     }
                )
                [ combineArrayArg_ ]
    , combineMapArray =
        \combineMapArrayArg_ combineMapArrayArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Result", "Extra" ]
                     , name = "combineMapArray"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function
                                      [ Type.var "a" ]
                                      (Type.namedWith
                                         [ "Result" ]
                                         "Result"
                                         [ Type.var "x", Type.var "b" ]
                                      )
                                  , Type.namedWith
                                      [ "Array" ]
                                      "Array"
                                      [ Type.var "a" ]
                                  ]
                                  (Type.namedWith
                                       [ "Result" ]
                                       "Result"
                                       [ Type.var "x"
                                       , Type.namedWith
                                           [ "Array" ]
                                           "Array"
                                           [ Type.var "b" ]
                                       ]
                                  )
                             )
                     }
                )
                [ combineMapArrayArg_, combineMapArrayArg_0 ]
    , combineFirst =
        \combineFirstArg_ ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Result", "Extra" ]
                     , name = "combineFirst"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.tuple
                                      (Type.namedWith
                                         [ "Result" ]
                                         "Result"
                                         [ Type.var "x", Type.var "a" ]
                                      )
                                      (Type.var "c")
                                  ]
                                  (Type.namedWith
                                       [ "Result" ]
                                       "Result"
                                       [ Type.var "x"
                                       , Type.tuple
                                           (Type.var "a")
                                           (Type.var "c")
                                       ]
                                  )
                             )
                     }
                )
                [ combineFirstArg_ ]
    , combineSecond =
        \combineSecondArg_ ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Result", "Extra" ]
                     , name = "combineSecond"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.tuple
                                      (Type.var "c")
                                      (Type.namedWith
                                         [ "Result" ]
                                         "Result"
                                         [ Type.var "x", Type.var "a" ]
                                      )
                                  ]
                                  (Type.namedWith
                                       [ "Result" ]
                                       "Result"
                                       [ Type.var "x"
                                       , Type.tuple
                                           (Type.var "c")
                                           (Type.var "a")
                                       ]
                                  )
                             )
                     }
                )
                [ combineSecondArg_ ]
    , combineBoth =
        \combineBothArg_ ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Result", "Extra" ]
                     , name = "combineBoth"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.tuple
                                      (Type.namedWith
                                         [ "Result" ]
                                         "Result"
                                         [ Type.var "x", Type.var "a" ]
                                      )
                                      (Type.namedWith
                                         [ "Result" ]
                                         "Result"
                                         [ Type.var "x", Type.var "b" ]
                                      )
                                  ]
                                  (Type.namedWith
                                       [ "Result" ]
                                       "Result"
                                       [ Type.var "x"
                                       , Type.tuple
                                           (Type.var "a")
                                           (Type.var "b")
                                       ]
                                  )
                             )
                     }
                )
                [ combineBothArg_ ]
    , combineMapFirst =
        \combineMapFirstArg_ combineMapFirstArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Result", "Extra" ]
                     , name = "combineMapFirst"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function
                                      [ Type.var "a" ]
                                      (Type.namedWith
                                         [ "Result" ]
                                         "Result"
                                         [ Type.var "x", Type.var "b" ]
                                      )
                                  , Type.tuple (Type.var "a") (Type.var "c")
                                  ]
                                  (Type.namedWith
                                       [ "Result" ]
                                       "Result"
                                       [ Type.var "x"
                                       , Type.tuple
                                           (Type.var "b")
                                           (Type.var "c")
                                       ]
                                  )
                             )
                     }
                )
                [ combineMapFirstArg_, combineMapFirstArg_0 ]
    , combineMapSecond =
        \combineMapSecondArg_ combineMapSecondArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Result", "Extra" ]
                     , name = "combineMapSecond"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function
                                      [ Type.var "a" ]
                                      (Type.namedWith
                                         [ "Result" ]
                                         "Result"
                                         [ Type.var "x", Type.var "b" ]
                                      )
                                  , Type.tuple (Type.var "c") (Type.var "a")
                                  ]
                                  (Type.namedWith
                                       [ "Result" ]
                                       "Result"
                                       [ Type.var "x"
                                       , Type.tuple
                                           (Type.var "c")
                                           (Type.var "b")
                                       ]
                                  )
                             )
                     }
                )
                [ combineMapSecondArg_, combineMapSecondArg_0 ]
    , combineMapBoth =
        \combineMapBothArg_ combineMapBothArg_0 combineMapBothArg_1 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Result", "Extra" ]
                     , name = "combineMapBoth"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function
                                      [ Type.var "a" ]
                                      (Type.namedWith
                                         [ "Result" ]
                                         "Result"
                                         [ Type.var "x", Type.var "c" ]
                                      )
                                  , Type.function
                                      [ Type.var "b" ]
                                      (Type.namedWith
                                         [ "Result" ]
                                         "Result"
                                         [ Type.var "x", Type.var "d" ]
                                      )
                                  , Type.tuple (Type.var "a") (Type.var "b")
                                  ]
                                  (Type.namedWith
                                       [ "Result" ]
                                       "Result"
                                       [ Type.var "x"
                                       , Type.tuple
                                           (Type.var "c")
                                           (Type.var "d")
                                       ]
                                  )
                             )
                     }
                )
                [ combineMapBothArg_, combineMapBothArg_0, combineMapBothArg_1 ]
    , andMap =
        \andMapArg_ andMapArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Result", "Extra" ]
                     , name = "andMap"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.namedWith
                                      [ "Result" ]
                                      "Result"
                                      [ Type.var "e", Type.var "a" ]
                                  , Type.namedWith
                                      [ "Result" ]
                                      "Result"
                                      [ Type.var "e"
                                      , Type.function
                                            [ Type.var "a" ]
                                            (Type.var "b")
                                      ]
                                  ]
                                  (Type.namedWith
                                       [ "Result" ]
                                       "Result"
                                       [ Type.var "e", Type.var "b" ]
                                  )
                             )
                     }
                )
                [ andMapArg_, andMapArg_0 ]
    , or =
        \orArg_ orArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Result", "Extra" ]
                     , name = "or"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.namedWith
                                      [ "Result" ]
                                      "Result"
                                      [ Type.var "e", Type.var "a" ]
                                  , Type.namedWith
                                      [ "Result" ]
                                      "Result"
                                      [ Type.var "e", Type.var "a" ]
                                  ]
                                  (Type.namedWith
                                       [ "Result" ]
                                       "Result"
                                       [ Type.var "e", Type.var "a" ]
                                  )
                             )
                     }
                )
                [ orArg_, orArg_0 ]
    , orLazy =
        \orLazyArg_ orLazyArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Result", "Extra" ]
                     , name = "orLazy"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.namedWith
                                      [ "Result" ]
                                      "Result"
                                      [ Type.var "e", Type.var "a" ]
                                  , Type.function
                                      [ Type.unit ]
                                      (Type.namedWith
                                         [ "Result" ]
                                         "Result"
                                         [ Type.var "e", Type.var "a" ]
                                      )
                                  ]
                                  (Type.namedWith
                                       [ "Result" ]
                                       "Result"
                                       [ Type.var "e", Type.var "a" ]
                                  )
                             )
                     }
                )
                [ orLazyArg_, orLazyArg_0 ]
    , orElseLazy =
        \orElseLazyArg_ orElseLazyArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Result", "Extra" ]
                     , name = "orElseLazy"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function
                                      [ Type.unit ]
                                      (Type.namedWith
                                         [ "Result" ]
                                         "Result"
                                         [ Type.var "e", Type.var "a" ]
                                      )
                                  , Type.namedWith
                                      [ "Result" ]
                                      "Result"
                                      [ Type.var "e", Type.var "a" ]
                                  ]
                                  (Type.namedWith
                                       [ "Result" ]
                                       "Result"
                                       [ Type.var "e", Type.var "a" ]
                                  )
                             )
                     }
                )
                [ orElseLazyArg_, orElseLazyArg_0 ]
    , orElse =
        \orElseArg_ orElseArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Result", "Extra" ]
                     , name = "orElse"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.namedWith
                                      [ "Result" ]
                                      "Result"
                                      [ Type.var "e", Type.var "a" ]
                                  , Type.namedWith
                                      [ "Result" ]
                                      "Result"
                                      [ Type.var "e", Type.var "a" ]
                                  ]
                                  (Type.namedWith
                                       [ "Result" ]
                                       "Result"
                                       [ Type.var "e", Type.var "a" ]
                                  )
                             )
                     }
                )
                [ orElseArg_, orElseArg_0 ]
    , toTask =
        \toTaskArg_ ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Result", "Extra" ]
                     , name = "toTask"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.namedWith
                                      [ "Result" ]
                                      "Result"
                                      [ Type.var "x", Type.var "a" ]
                                  ]
                                  (Type.namedWith
                                       [ "Task" ]
                                       "Task"
                                       [ Type.var "x", Type.var "a" ]
                                  )
                             )
                     }
                )
                [ toTaskArg_ ]
    }


values_ :
    { isOk : Elm.Expression
    , isErr : Elm.Expression
    , extract : Elm.Expression
    , unwrap : Elm.Expression
    , unpack : Elm.Expression
    , error : Elm.Expression
    , mapBoth : Elm.Expression
    , merge : Elm.Expression
    , join : Elm.Expression
    , partition : Elm.Expression
    , filter : Elm.Expression
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
    , andMap : Elm.Expression
    , or : Elm.Expression
    , orLazy : Elm.Expression
    , orElseLazy : Elm.Expression
    , orElse : Elm.Expression
    , toTask : Elm.Expression
    }
values_ =
    { isOk =
        Elm.value
            { importFrom = [ "Result", "Extra" ]
            , name = "isOk"
            , annotation =
                Just
                    (Type.function
                         [ Type.namedWith
                             [ "Result" ]
                             "Result"
                             [ Type.var "e", Type.var "a" ]
                         ]
                         Type.bool
                    )
            }
    , isErr =
        Elm.value
            { importFrom = [ "Result", "Extra" ]
            , name = "isErr"
            , annotation =
                Just
                    (Type.function
                         [ Type.namedWith
                             [ "Result" ]
                             "Result"
                             [ Type.var "e", Type.var "a" ]
                         ]
                         Type.bool
                    )
            }
    , extract =
        Elm.value
            { importFrom = [ "Result", "Extra" ]
            , name = "extract"
            , annotation =
                Just
                    (Type.function
                         [ Type.function [ Type.var "e" ] (Type.var "a")
                         , Type.namedWith
                             [ "Result" ]
                             "Result"
                             [ Type.var "e", Type.var "a" ]
                         ]
                         (Type.var "a")
                    )
            }
    , unwrap =
        Elm.value
            { importFrom = [ "Result", "Extra" ]
            , name = "unwrap"
            , annotation =
                Just
                    (Type.function
                         [ Type.var "b"
                         , Type.function [ Type.var "a" ] (Type.var "b")
                         , Type.namedWith
                             [ "Result" ]
                             "Result"
                             [ Type.var "e", Type.var "a" ]
                         ]
                         (Type.var "b")
                    )
            }
    , unpack =
        Elm.value
            { importFrom = [ "Result", "Extra" ]
            , name = "unpack"
            , annotation =
                Just
                    (Type.function
                         [ Type.function [ Type.var "e" ] (Type.var "b")
                         , Type.function [ Type.var "a" ] (Type.var "b")
                         , Type.namedWith
                             [ "Result" ]
                             "Result"
                             [ Type.var "e", Type.var "a" ]
                         ]
                         (Type.var "b")
                    )
            }
    , error =
        Elm.value
            { importFrom = [ "Result", "Extra" ]
            , name = "error"
            , annotation =
                Just
                    (Type.function
                         [ Type.namedWith
                             [ "Result" ]
                             "Result"
                             [ Type.var "e", Type.var "a" ]
                         ]
                         (Type.maybe (Type.var "e"))
                    )
            }
    , mapBoth =
        Elm.value
            { importFrom = [ "Result", "Extra" ]
            , name = "mapBoth"
            , annotation =
                Just
                    (Type.function
                         [ Type.function [ Type.var "e" ] (Type.var "f")
                         , Type.function [ Type.var "a" ] (Type.var "b")
                         , Type.namedWith
                             [ "Result" ]
                             "Result"
                             [ Type.var "e", Type.var "a" ]
                         ]
                         (Type.namedWith
                              [ "Result" ]
                              "Result"
                              [ Type.var "f", Type.var "b" ]
                         )
                    )
            }
    , merge =
        Elm.value
            { importFrom = [ "Result", "Extra" ]
            , name = "merge"
            , annotation =
                Just
                    (Type.function
                         [ Type.namedWith
                             [ "Result" ]
                             "Result"
                             [ Type.var "a", Type.var "a" ]
                         ]
                         (Type.var "a")
                    )
            }
    , join =
        Elm.value
            { importFrom = [ "Result", "Extra" ]
            , name = "join"
            , annotation =
                Just
                    (Type.function
                         [ Type.namedWith
                             [ "Result" ]
                             "Result"
                             [ Type.var "x"
                             , Type.namedWith
                                   [ "Result" ]
                                   "Result"
                                   [ Type.var "x", Type.var "a" ]
                             ]
                         ]
                         (Type.namedWith
                              [ "Result" ]
                              "Result"
                              [ Type.var "x", Type.var "a" ]
                         )
                    )
            }
    , partition =
        Elm.value
            { importFrom = [ "Result", "Extra" ]
            , name = "partition"
            , annotation =
                Just
                    (Type.function
                         [ Type.list
                             (Type.namedWith
                                [ "Result" ]
                                "Result"
                                [ Type.var "e", Type.var "a" ]
                             )
                         ]
                         (Type.tuple
                              (Type.list (Type.var "a"))
                              (Type.list (Type.var "e"))
                         )
                    )
            }
    , filter =
        Elm.value
            { importFrom = [ "Result", "Extra" ]
            , name = "filter"
            , annotation =
                Just
                    (Type.function
                         [ Type.var "e"
                         , Type.function [ Type.var "a" ] Type.bool
                         , Type.namedWith
                             [ "Result" ]
                             "Result"
                             [ Type.var "e", Type.var "a" ]
                         ]
                         (Type.namedWith
                              [ "Result" ]
                              "Result"
                              [ Type.var "e", Type.var "a" ]
                         )
                    )
            }
    , combine =
        Elm.value
            { importFrom = [ "Result", "Extra" ]
            , name = "combine"
            , annotation =
                Just
                    (Type.function
                         [ Type.list
                             (Type.namedWith
                                [ "Result" ]
                                "Result"
                                [ Type.var "x", Type.var "a" ]
                             )
                         ]
                         (Type.namedWith
                              [ "Result" ]
                              "Result"
                              [ Type.var "x", Type.list (Type.var "a") ]
                         )
                    )
            }
    , combineMap =
        Elm.value
            { importFrom = [ "Result", "Extra" ]
            , name = "combineMap"
            , annotation =
                Just
                    (Type.function
                         [ Type.function
                             [ Type.var "a" ]
                             (Type.namedWith
                                [ "Result" ]
                                "Result"
                                [ Type.var "x", Type.var "b" ]
                             )
                         , Type.list (Type.var "a")
                         ]
                         (Type.namedWith
                              [ "Result" ]
                              "Result"
                              [ Type.var "x", Type.list (Type.var "b") ]
                         )
                    )
            }
    , combineArray =
        Elm.value
            { importFrom = [ "Result", "Extra" ]
            , name = "combineArray"
            , annotation =
                Just
                    (Type.function
                         [ Type.namedWith
                             [ "Array" ]
                             "Array"
                             [ Type.namedWith
                                   [ "Result" ]
                                   "Result"
                                   [ Type.var "x", Type.var "a" ]
                             ]
                         ]
                         (Type.namedWith
                              [ "Result" ]
                              "Result"
                              [ Type.var "x"
                              , Type.namedWith
                                  [ "Array" ]
                                  "Array"
                                  [ Type.var "a" ]
                              ]
                         )
                    )
            }
    , combineMapArray =
        Elm.value
            { importFrom = [ "Result", "Extra" ]
            , name = "combineMapArray"
            , annotation =
                Just
                    (Type.function
                         [ Type.function
                             [ Type.var "a" ]
                             (Type.namedWith
                                [ "Result" ]
                                "Result"
                                [ Type.var "x", Type.var "b" ]
                             )
                         , Type.namedWith [ "Array" ] "Array" [ Type.var "a" ]
                         ]
                         (Type.namedWith
                              [ "Result" ]
                              "Result"
                              [ Type.var "x"
                              , Type.namedWith
                                  [ "Array" ]
                                  "Array"
                                  [ Type.var "b" ]
                              ]
                         )
                    )
            }
    , combineFirst =
        Elm.value
            { importFrom = [ "Result", "Extra" ]
            , name = "combineFirst"
            , annotation =
                Just
                    (Type.function
                         [ Type.tuple
                             (Type.namedWith
                                [ "Result" ]
                                "Result"
                                [ Type.var "x", Type.var "a" ]
                             )
                             (Type.var "c")
                         ]
                         (Type.namedWith
                              [ "Result" ]
                              "Result"
                              [ Type.var "x"
                              , Type.tuple (Type.var "a") (Type.var "c")
                              ]
                         )
                    )
            }
    , combineSecond =
        Elm.value
            { importFrom = [ "Result", "Extra" ]
            , name = "combineSecond"
            , annotation =
                Just
                    (Type.function
                         [ Type.tuple
                             (Type.var "c")
                             (Type.namedWith
                                [ "Result" ]
                                "Result"
                                [ Type.var "x", Type.var "a" ]
                             )
                         ]
                         (Type.namedWith
                              [ "Result" ]
                              "Result"
                              [ Type.var "x"
                              , Type.tuple (Type.var "c") (Type.var "a")
                              ]
                         )
                    )
            }
    , combineBoth =
        Elm.value
            { importFrom = [ "Result", "Extra" ]
            , name = "combineBoth"
            , annotation =
                Just
                    (Type.function
                         [ Type.tuple
                             (Type.namedWith
                                [ "Result" ]
                                "Result"
                                [ Type.var "x", Type.var "a" ]
                             )
                             (Type.namedWith
                                [ "Result" ]
                                "Result"
                                [ Type.var "x", Type.var "b" ]
                             )
                         ]
                         (Type.namedWith
                              [ "Result" ]
                              "Result"
                              [ Type.var "x"
                              , Type.tuple (Type.var "a") (Type.var "b")
                              ]
                         )
                    )
            }
    , combineMapFirst =
        Elm.value
            { importFrom = [ "Result", "Extra" ]
            , name = "combineMapFirst"
            , annotation =
                Just
                    (Type.function
                         [ Type.function
                             [ Type.var "a" ]
                             (Type.namedWith
                                [ "Result" ]
                                "Result"
                                [ Type.var "x", Type.var "b" ]
                             )
                         , Type.tuple (Type.var "a") (Type.var "c")
                         ]
                         (Type.namedWith
                              [ "Result" ]
                              "Result"
                              [ Type.var "x"
                              , Type.tuple (Type.var "b") (Type.var "c")
                              ]
                         )
                    )
            }
    , combineMapSecond =
        Elm.value
            { importFrom = [ "Result", "Extra" ]
            , name = "combineMapSecond"
            , annotation =
                Just
                    (Type.function
                         [ Type.function
                             [ Type.var "a" ]
                             (Type.namedWith
                                [ "Result" ]
                                "Result"
                                [ Type.var "x", Type.var "b" ]
                             )
                         , Type.tuple (Type.var "c") (Type.var "a")
                         ]
                         (Type.namedWith
                              [ "Result" ]
                              "Result"
                              [ Type.var "x"
                              , Type.tuple (Type.var "c") (Type.var "b")
                              ]
                         )
                    )
            }
    , combineMapBoth =
        Elm.value
            { importFrom = [ "Result", "Extra" ]
            , name = "combineMapBoth"
            , annotation =
                Just
                    (Type.function
                         [ Type.function
                             [ Type.var "a" ]
                             (Type.namedWith
                                [ "Result" ]
                                "Result"
                                [ Type.var "x", Type.var "c" ]
                             )
                         , Type.function
                             [ Type.var "b" ]
                             (Type.namedWith
                                [ "Result" ]
                                "Result"
                                [ Type.var "x", Type.var "d" ]
                             )
                         , Type.tuple (Type.var "a") (Type.var "b")
                         ]
                         (Type.namedWith
                              [ "Result" ]
                              "Result"
                              [ Type.var "x"
                              , Type.tuple (Type.var "c") (Type.var "d")
                              ]
                         )
                    )
            }
    , andMap =
        Elm.value
            { importFrom = [ "Result", "Extra" ]
            , name = "andMap"
            , annotation =
                Just
                    (Type.function
                         [ Type.namedWith
                             [ "Result" ]
                             "Result"
                             [ Type.var "e", Type.var "a" ]
                         , Type.namedWith
                             [ "Result" ]
                             "Result"
                             [ Type.var "e"
                             , Type.function [ Type.var "a" ] (Type.var "b")
                             ]
                         ]
                         (Type.namedWith
                              [ "Result" ]
                              "Result"
                              [ Type.var "e", Type.var "b" ]
                         )
                    )
            }
    , or =
        Elm.value
            { importFrom = [ "Result", "Extra" ]
            , name = "or"
            , annotation =
                Just
                    (Type.function
                         [ Type.namedWith
                             [ "Result" ]
                             "Result"
                             [ Type.var "e", Type.var "a" ]
                         , Type.namedWith
                             [ "Result" ]
                             "Result"
                             [ Type.var "e", Type.var "a" ]
                         ]
                         (Type.namedWith
                              [ "Result" ]
                              "Result"
                              [ Type.var "e", Type.var "a" ]
                         )
                    )
            }
    , orLazy =
        Elm.value
            { importFrom = [ "Result", "Extra" ]
            , name = "orLazy"
            , annotation =
                Just
                    (Type.function
                         [ Type.namedWith
                             [ "Result" ]
                             "Result"
                             [ Type.var "e", Type.var "a" ]
                         , Type.function
                             [ Type.unit ]
                             (Type.namedWith
                                [ "Result" ]
                                "Result"
                                [ Type.var "e", Type.var "a" ]
                             )
                         ]
                         (Type.namedWith
                              [ "Result" ]
                              "Result"
                              [ Type.var "e", Type.var "a" ]
                         )
                    )
            }
    , orElseLazy =
        Elm.value
            { importFrom = [ "Result", "Extra" ]
            , name = "orElseLazy"
            , annotation =
                Just
                    (Type.function
                         [ Type.function
                             [ Type.unit ]
                             (Type.namedWith
                                [ "Result" ]
                                "Result"
                                [ Type.var "e", Type.var "a" ]
                             )
                         , Type.namedWith
                             [ "Result" ]
                             "Result"
                             [ Type.var "e", Type.var "a" ]
                         ]
                         (Type.namedWith
                              [ "Result" ]
                              "Result"
                              [ Type.var "e", Type.var "a" ]
                         )
                    )
            }
    , orElse =
        Elm.value
            { importFrom = [ "Result", "Extra" ]
            , name = "orElse"
            , annotation =
                Just
                    (Type.function
                         [ Type.namedWith
                             [ "Result" ]
                             "Result"
                             [ Type.var "e", Type.var "a" ]
                         , Type.namedWith
                             [ "Result" ]
                             "Result"
                             [ Type.var "e", Type.var "a" ]
                         ]
                         (Type.namedWith
                              [ "Result" ]
                              "Result"
                              [ Type.var "e", Type.var "a" ]
                         )
                    )
            }
    , toTask =
        Elm.value
            { importFrom = [ "Result", "Extra" ]
            , name = "toTask"
            , annotation =
                Just
                    (Type.function
                         [ Type.namedWith
                             [ "Result" ]
                             "Result"
                             [ Type.var "x", Type.var "a" ]
                         ]
                         (Type.namedWith
                              [ "Task" ]
                              "Task"
                              [ Type.var "x", Type.var "a" ]
                         )
                    )
            }
    }