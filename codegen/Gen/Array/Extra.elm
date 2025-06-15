module Gen.Array.Extra exposing
    ( moduleName_, all, any, member, reverse, intersperse
    , update, pop, removeAt, insertAt, removeWhen, filterMap, sliceFrom
    , sliceUntil, splitAt, unzip, last, interweave_, andMap, map2
    , map3, map4, map5, zip, zip3, resizelRepeat, resizerRepeat
    , resizelIndexed, resizerIndexed, mapToList, indexedMapToList, call_, values_
    )

{-|
# Generated bindings for Array.Extra

@docs moduleName_, all, any, member, reverse, intersperse
@docs update, pop, removeAt, insertAt, removeWhen, filterMap
@docs sliceFrom, sliceUntil, splitAt, unzip, last, interweave_
@docs andMap, map2, map3, map4, map5, zip
@docs zip3, resizelRepeat, resizerRepeat, resizelIndexed, resizerIndexed, mapToList
@docs indexedMapToList, call_, values_
-}


import Elm
import Elm.Annotation as Type


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Array", "Extra" ]


{-| Whether all elements satisfy a given test.

    import Array exposing (fromList, empty)

    fromList [ 2, 4 ] |> all (\x -> x < 5)
    --> True

    fromList [ 4, 16 ] |> all (\x -> x < 5)
    --> False

    empty |> all (\x -> x < 5)
    --> True

all: (a -> Bool) -> Array.Array a -> Bool
-}
all : (Elm.Expression -> Elm.Expression) -> Elm.Expression -> Elm.Expression
all allArg_ allArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Array", "Extra" ]
             , name = "all"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function [ Type.var "a" ] Type.bool
                          , Type.namedWith [ "Array" ] "Array" [ Type.var "a" ]
                          ]
                          Type.bool
                     )
             }
        )
        [ Elm.functionReduced "allUnpack" allArg_, allArg_0 ]


{-| Whether at least some elements satisfy a given test.

    import Array exposing (fromList, empty)

    fromList [ 6, 3 ] |> any (\x -> x < 5)
    --> True

    fromList [ 12, 33 ] |> any (\x -> x < 5)
    --> False

    empty |> any (\x -> x < 5)
    --> False

any: (a -> Bool) -> Array.Array a -> Bool
-}
any : (Elm.Expression -> Elm.Expression) -> Elm.Expression -> Elm.Expression
any anyArg_ anyArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Array", "Extra" ]
             , name = "any"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function [ Type.var "a" ] Type.bool
                          , Type.namedWith [ "Array" ] "Array" [ Type.var "a" ]
                          ]
                          Type.bool
                     )
             }
        )
        [ Elm.functionReduced "anyUnpack" anyArg_, anyArg_0 ]


{-| Whether a given value is contained.

    import Array exposing (fromList)

    fromList [ "Leonardo", "Michelangelo", "Donatello", "Raphael" ]
        |> member "Donatello"
    --> True

    fromList [ "Leonardo", "Michelangelo" ]
        |> member "Raphael"
    --> False

For checking if some aspect is present, use [`any`](#any).

member: a -> Array.Array a -> Bool
-}
member : Elm.Expression -> Elm.Expression -> Elm.Expression
member memberArg_ memberArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Array", "Extra" ]
             , name = "member"
             , annotation =
                 Just
                     (Type.function
                          [ Type.var "a"
                          , Type.namedWith [ "Array" ] "Array" [ Type.var "a" ]
                          ]
                          Type.bool
                     )
             }
        )
        [ memberArg_, memberArg_0 ]


{-| Flip the element order.

    import Array exposing (fromList)

    fromList [ 1, 2, 3, 4 ] |> reverse
    --> fromList [ 4, 3, 2, 1 ]

reverse: Array.Array a -> Array.Array a
-}
reverse : Elm.Expression -> Elm.Expression
reverse reverseArg_ =
    Elm.apply
        (Elm.value
             { importFrom = [ "Array", "Extra" ]
             , name = "reverse"
             , annotation =
                 Just
                     (Type.function
                          [ Type.namedWith [ "Array" ] "Array" [ Type.var "a" ]
                          ]
                          (Type.namedWith [ "Array" ] "Array" [ Type.var "a" ])
                     )
             }
        )
        [ reverseArg_ ]


{-| Place a value between all elements.

    import Array exposing (fromList)

    fromList [ "turtles", "turtles", "turtles" ]
        |> intersperse "on"
    --> fromList
    -->     [ "turtles", "on", "turtles", "on", "turtles" ]

To interlace an `Array`, [`interweave_`](#interweave_).

intersperse: a -> Array.Array a -> Array.Array a
-}
intersperse : Elm.Expression -> Elm.Expression -> Elm.Expression
intersperse intersperseArg_ intersperseArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Array", "Extra" ]
             , name = "intersperse"
             , annotation =
                 Just
                     (Type.function
                          [ Type.var "a"
                          , Type.namedWith [ "Array" ] "Array" [ Type.var "a" ]
                          ]
                          (Type.namedWith [ "Array" ] "Array" [ Type.var "a" ])
                     )
             }
        )
        [ intersperseArg_, intersperseArg_0 ]


{-| Update the element at a given index based on its current value.
If the index is out of bounds, nothing is changed.

    import Array exposing (fromList)

    fromList [ 1, 2, 3 ] |> update 1 (\n -> n + 10)
    --> fromList [ 1, 12, 3 ]

    fromList [ 1, 2, 3 ] |> update 4 (\n -> n + 10)
    --> fromList [ 1, 2, 3 ]

    fromList [ 1, 2, 3 ] |> update -1 (\n -> n + 10)
    --> fromList [ 1, 2, 3 ]

update: Int -> (a -> a) -> Array.Array a -> Array.Array a
-}
update :
    Int
    -> (Elm.Expression -> Elm.Expression)
    -> Elm.Expression
    -> Elm.Expression
update updateArg_ updateArg_0 updateArg_1 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Array", "Extra" ]
             , name = "update"
             , annotation =
                 Just
                     (Type.function
                          [ Type.int
                          , Type.function [ Type.var "a" ] (Type.var "a")
                          , Type.namedWith [ "Array" ] "Array" [ Type.var "a" ]
                          ]
                          (Type.namedWith [ "Array" ] "Array" [ Type.var "a" ])
                     )
             }
        )
        [ Elm.int updateArg_
        , Elm.functionReduced "updateUnpack" updateArg_0
        , updateArg_1
        ]


{-| Remove the last element.

    import Array exposing (fromList, empty)

    fromList [ 1, 2, 3 ] |> pop
    --> fromList [ 1, 2 ]

    empty |> pop
    --> empty

pop: Array.Array a -> Array.Array a
-}
pop : Elm.Expression -> Elm.Expression
pop popArg_ =
    Elm.apply
        (Elm.value
             { importFrom = [ "Array", "Extra" ]
             , name = "pop"
             , annotation =
                 Just
                     (Type.function
                          [ Type.namedWith [ "Array" ] "Array" [ Type.var "a" ]
                          ]
                          (Type.namedWith [ "Array" ] "Array" [ Type.var "a" ])
                     )
             }
        )
        [ popArg_ ]


{-| Remove the element at a given index.
If the index is out of bounds, nothing is changed.

    import Array exposing (fromList)

    fromList [ 1, 2, 3, 4 ] |> removeAt 2
    --> fromList [ 1, 2, 4 ]

    fromList [ 1, 2, 3, 4 ] |> removeAt -1
    --> fromList [ 1, 2, 3, 4 ]

    fromList [ 1, 2, 3, 4 ] |> removeAt 100
    --> fromList [ 1, 2, 3, 4 ]

removeAt: Int -> Array.Array a -> Array.Array a
-}
removeAt : Int -> Elm.Expression -> Elm.Expression
removeAt removeAtArg_ removeAtArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Array", "Extra" ]
             , name = "removeAt"
             , annotation =
                 Just
                     (Type.function
                          [ Type.int
                          , Type.namedWith [ "Array" ] "Array" [ Type.var "a" ]
                          ]
                          (Type.namedWith [ "Array" ] "Array" [ Type.var "a" ])
                     )
             }
        )
        [ Elm.int removeAtArg_, removeAtArg_0 ]


{-| Insert an element at a given index.
If the index is out of bounds, nothing is changed.

    import Array exposing (fromList)

    fromList [ 'a', 'c' ] |> insertAt 1 'b'
    --> fromList [ 'a', 'b', 'c' ]

    fromList [ 'a', 'c' ] |> insertAt -1 'b'
    --> fromList [ 'a', 'c' ]

    fromList [ 'a', 'c' ] |>  insertAt 100 'b'
    --> fromList [ 'a', 'c' ]

insertAt: Int -> a -> Array.Array a -> Array.Array a
-}
insertAt : Int -> Elm.Expression -> Elm.Expression -> Elm.Expression
insertAt insertAtArg_ insertAtArg_0 insertAtArg_1 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Array", "Extra" ]
             , name = "insertAt"
             , annotation =
                 Just
                     (Type.function
                          [ Type.int
                          , Type.var "a"
                          , Type.namedWith [ "Array" ] "Array" [ Type.var "a" ]
                          ]
                          (Type.namedWith [ "Array" ] "Array" [ Type.var "a" ])
                     )
             }
        )
        [ Elm.int insertAtArg_, insertAtArg_0, insertAtArg_1 ]


{-| Only keep elements which fail to satisfy a given predicate.
This is equivalent to `Array.filter (not << predicate)`.

    import Array exposing (fromList)

    fromList [ -1, 92, 0, 14, -3 ]
        |> removeWhen (\x -> x < 0)
    --> fromList [ 92, 0, 14 ]

removeWhen: (a -> Bool) -> Array.Array a -> Array.Array a
-}
removeWhen :
    (Elm.Expression -> Elm.Expression) -> Elm.Expression -> Elm.Expression
removeWhen removeWhenArg_ removeWhenArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Array", "Extra" ]
             , name = "removeWhen"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function [ Type.var "a" ] Type.bool
                          , Type.namedWith [ "Array" ] "Array" [ Type.var "a" ]
                          ]
                          (Type.namedWith [ "Array" ] "Array" [ Type.var "a" ])
                     )
             }
        )
        [ Elm.functionReduced "removeWhenUnpack" removeWhenArg_
        , removeWhenArg_0
        ]


{-| Try transforming all elements but only keep the successes.

    import Array exposing (fromList)

    fromList [ "3", "4.0", "5", "hats" ]
        |> filterMap String.toInt
    --> fromList [ 3, 5 ]

filterMap: (a -> Maybe b) -> Array.Array a -> Array.Array b
-}
filterMap :
    (Elm.Expression -> Elm.Expression) -> Elm.Expression -> Elm.Expression
filterMap filterMapArg_ filterMapArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Array", "Extra" ]
             , name = "filterMap"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function
                              [ Type.var "a" ]
                              (Type.maybe (Type.var "b"))
                          , Type.namedWith [ "Array" ] "Array" [ Type.var "a" ]
                          ]
                          (Type.namedWith [ "Array" ] "Array" [ Type.var "b" ])
                     )
             }
        )
        [ Elm.functionReduced "filterMapUnpack" filterMapArg_, filterMapArg_0 ]


{-| Drop a given number of elements from the start.
In other words, slice the `Array` from an index until the very end.
Given a negative argument, count the end of the slice from the end.

    import Array exposing (fromList)

    fromList (List.range 0 6) |> sliceFrom 3
    --> fromList [ 3, 4, 5, 6 ]

    fromList (List.range 0 6) |> sliceFrom -3
    --> fromList [ 4, 5, 6 ]

sliceFrom: Int -> Array.Array a -> Array.Array a
-}
sliceFrom : Int -> Elm.Expression -> Elm.Expression
sliceFrom sliceFromArg_ sliceFromArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Array", "Extra" ]
             , name = "sliceFrom"
             , annotation =
                 Just
                     (Type.function
                          [ Type.int
                          , Type.namedWith [ "Array" ] "Array" [ Type.var "a" ]
                          ]
                          (Type.namedWith [ "Array" ] "Array" [ Type.var "a" ])
                     )
             }
        )
        [ Elm.int sliceFromArg_, sliceFromArg_0 ]


{-| Take a number of elements from the start.
In other words, slice the `Array` from the very beginning until not including the index.
Given a negative argument, count the beginning of the slice from the end.

    import Array exposing (fromList)

    fromList (List.range 0 6) |> sliceUntil 3
    --> fromList [ 0, 1, 2 ]

    fromList (List.range 0 6) |> sliceUntil -3
    --> fromList [ 0, 1, 2, 3 ]

sliceUntil: Int -> Array.Array a -> Array.Array a
-}
sliceUntil : Int -> Elm.Expression -> Elm.Expression
sliceUntil sliceUntilArg_ sliceUntilArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Array", "Extra" ]
             , name = "sliceUntil"
             , annotation =
                 Just
                     (Type.function
                          [ Type.int
                          , Type.namedWith [ "Array" ] "Array" [ Type.var "a" ]
                          ]
                          (Type.namedWith [ "Array" ] "Array" [ Type.var "a" ])
                     )
             }
        )
        [ Elm.int sliceUntilArg_, sliceUntilArg_0 ]


{-| Split into two `Array`s, the first ending before and the second starting with a given index.

    import Array exposing (fromList, empty)

    fromList [ 1, 2, 3, 4 ] |> splitAt 2
    --> ( fromList [ 1, 2 ], fromList [ 3, 4 ] )

    fromList [ 1, 2, 3, 4 ] |> splitAt 100
    --> ( fromList [ 1, 2, 3, 4 ], empty )

    fromList [ 1, 2, 3, 4 ] |> splitAt -1
    --> ( empty, fromList [ 1, 2, 3, 4 ] )

splitAt: Int -> Array.Array a -> ( Array.Array a, Array.Array a )
-}
splitAt : Int -> Elm.Expression -> Elm.Expression
splitAt splitAtArg_ splitAtArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Array", "Extra" ]
             , name = "splitAt"
             , annotation =
                 Just
                     (Type.function
                          [ Type.int
                          , Type.namedWith [ "Array" ] "Array" [ Type.var "a" ]
                          ]
                          (Type.tuple
                               (Type.namedWith
                                    [ "Array" ]
                                    "Array"
                                    [ Type.var "a" ]
                               )
                               (Type.namedWith
                                    [ "Array" ]
                                    "Array"
                                    [ Type.var "a" ]
                               )
                          )
                     )
             }
        )
        [ Elm.int splitAtArg_, splitAtArg_0 ]


{-| Split all tuple elements into a tuple of one `Array` with the first and one with the second values.

    import Array exposing (fromList)

    unzip
        (fromList
            [ ( 1, 'a' ), ( 2, 'b' ), ( 3, 'c' ) ]
        )
    --> ( fromList [ 1, 2, 3 ]
    --> , fromList [ 'a', 'b', 'c' ]
    --> )

unzip: Array.Array ( a, b ) -> ( Array.Array a, Array.Array b )
-}
unzip : Elm.Expression -> Elm.Expression
unzip unzipArg_ =
    Elm.apply
        (Elm.value
             { importFrom = [ "Array", "Extra" ]
             , name = "unzip"
             , annotation =
                 Just
                     (Type.function
                          [ Type.namedWith
                              [ "Array" ]
                              "Array"
                              [ Type.tuple (Type.var "a") (Type.var "b") ]
                          ]
                          (Type.tuple
                               (Type.namedWith
                                    [ "Array" ]
                                    "Array"
                                    [ Type.var "a" ]
                               )
                               (Type.namedWith
                                    [ "Array" ]
                                    "Array"
                                    [ Type.var "b" ]
                               )
                          )
                     )
             }
        )
        [ unzipArg_ ]


{-| Get the last element in an `Array` if it exists.

    import Array exposing (fromList)

    last (fromList [ 'a', 'b', 'c' ])
    --> Just 'c'

    last (fromList [])
    --> Nothing

last: Array.Array a -> Maybe a
-}
last : Elm.Expression -> Elm.Expression
last lastArg_ =
    Elm.apply
        (Elm.value
             { importFrom = [ "Array", "Extra" ]
             , name = "last"
             , annotation =
                 Just
                     (Type.function
                          [ Type.namedWith [ "Array" ] "Array" [ Type.var "a" ]
                          ]
                          (Type.maybe (Type.var "a"))
                     )
             }
        )
        [ lastArg_ ]


{-| Return an array that contains elements from the two provided, in alternate order.
If one array runs out of items, append the items from the remaining array.

    import Array exposing (fromList, repeat)

    interweave_ (fromList [ "turtles", "turtles", "turtles" ]) (repeat 2 "on")
    --> fromList [ "turtles", "on", "turtles", "on", "turtles" ]

    interweave_ (fromList [ "turtles", "turtles", "turtles" ]) (repeat 5 "on")
    --> fromList [ "turtles", "on", "turtles", "on", "turtles", "on", "on", "on" ]

    interweave_ (fromList [ "turtles", "turtles", "turtles" ]) (repeat 1 "on")
    --> fromList [ "turtles", "on", "turtles", "turtles" ]

interweave_: Array.Array a -> Array.Array a -> Array.Array a
-}
interweave_ : Elm.Expression -> Elm.Expression -> Elm.Expression
interweave_ interweave_Arg_ interweave_Arg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Array", "Extra" ]
             , name = "interweave_"
             , annotation =
                 Just
                     (Type.function
                          [ Type.namedWith [ "Array" ] "Array" [ Type.var "a" ]
                          , Type.namedWith [ "Array" ] "Array" [ Type.var "a" ]
                          ]
                          (Type.namedWith [ "Array" ] "Array" [ Type.var "a" ])
                     )
             }
        )
        [ interweave_Arg_, interweave_Arg_0 ]


{-| Map functions taking multiple arguments over multiple arrays. Each array should be of the same length; extra elements are dropped.

    import Array exposing (Array)

    toIntFunctions : Array (Float -> Int)
    toIntFunctions =
        Array.fromList
            [ round
            , floor
            , ceiling
            , truncate
            ]

    toIntFunctions
        |> andMap (Array.fromList [ -1.5, -1.5, -1.5, -1.5 ])
        --> Array.fromList [ -1, -2, -1, -1 ]

andMap: Array.Array a -> Array.Array (a -> b) -> Array.Array b
-}
andMap : Elm.Expression -> Elm.Expression -> Elm.Expression
andMap andMapArg_ andMapArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Array", "Extra" ]
             , name = "andMap"
             , annotation =
                 Just
                     (Type.function
                          [ Type.namedWith [ "Array" ] "Array" [ Type.var "a" ]
                          , Type.namedWith
                              [ "Array" ]
                              "Array"
                              [ Type.function [ Type.var "a" ] (Type.var "b") ]
                          ]
                          (Type.namedWith [ "Array" ] "Array" [ Type.var "b" ])
                     )
             }
        )
        [ andMapArg_, andMapArg_0 ]


{-| Combine the elements of two `Array`s with a given function.
If one `Array` is longer, its extra elements are not used.

    import Array exposing (fromList)

    map2 (\a b -> a + b)
        (fromList [ 1, 2, 3 ])
        (fromList [ 1, 2, 3, 4 ])
    --> fromList [ 2, 4, 6 ]

    map2 Tuple.pair
        (fromList [ 1, 2, 3 ])
        (fromList [ 'a', 'b' ])
    --> fromList [ ( 1, 'a' ), ( 2, 'b' ) ]

Note: [`zip`](Array-Extra#zip) can be used instead of `map2 Tuple.pair`.

map2: (a -> b -> combined) -> Array.Array a -> Array.Array b -> Array.Array combined
-}
map2 :
    (Elm.Expression -> Elm.Expression -> Elm.Expression)
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
map2 map2Arg_ map2Arg_0 map2Arg_1 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Array", "Extra" ]
             , name = "map2"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function
                              [ Type.var "a", Type.var "b" ]
                              (Type.var "combined")
                          , Type.namedWith [ "Array" ] "Array" [ Type.var "a" ]
                          , Type.namedWith [ "Array" ] "Array" [ Type.var "b" ]
                          ]
                          (Type.namedWith
                               [ "Array" ]
                               "Array"
                               [ Type.var "combined" ]
                          )
                     )
             }
        )
        [ Elm.functionReduced
            "map2Unpack"
            (\functionReducedUnpack ->
               Elm.functionReduced "unpack" (map2Arg_ functionReducedUnpack)
            )
        , map2Arg_0
        , map2Arg_1
        ]


{-| Combine the elements of three `Array`s with the given function. See [`map2`](Array-Extra#map2).

Note: [`zip3`](Array-Extra#zip3) can be used instead of `map3 (\a b c -> ( a, b, c ))`.

map3: 
    (a -> b -> c -> combined)
    -> Array.Array a
    -> Array.Array b
    -> Array.Array c
    -> Array.Array combined
-}
map3 :
    (Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression)
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
map3 map3Arg_ map3Arg_0 map3Arg_1 map3Arg_2 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Array", "Extra" ]
             , name = "map3"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function
                              [ Type.var "a", Type.var "b", Type.var "c" ]
                              (Type.var "combined")
                          , Type.namedWith [ "Array" ] "Array" [ Type.var "a" ]
                          , Type.namedWith [ "Array" ] "Array" [ Type.var "b" ]
                          , Type.namedWith [ "Array" ] "Array" [ Type.var "c" ]
                          ]
                          (Type.namedWith
                               [ "Array" ]
                               "Array"
                               [ Type.var "combined" ]
                          )
                     )
             }
        )
        [ Elm.functionReduced
            "map3Unpack"
            (\functionReducedUnpack ->
               Elm.functionReduced
                   "unpack"
                   (\functionReducedUnpack0 ->
                        Elm.functionReduced
                            "unpack"
                            ((map3Arg_ functionReducedUnpack)
                                 functionReducedUnpack0
                            )
                   )
            )
        , map3Arg_0
        , map3Arg_1
        , map3Arg_2
        ]


{-| Combine the elements of four `Array`s with the given function. See [`map2`](Array-Extra#map2).

map4: 
    (a -> b -> c -> d -> combined)
    -> Array.Array a
    -> Array.Array b
    -> Array.Array c
    -> Array.Array d
    -> Array.Array combined
-}
map4 :
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
map4 map4Arg_ map4Arg_0 map4Arg_1 map4Arg_2 map4Arg_3 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Array", "Extra" ]
             , name = "map4"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function
                              [ Type.var "a"
                              , Type.var "b"
                              , Type.var "c"
                              , Type.var "d"
                              ]
                              (Type.var "combined")
                          , Type.namedWith [ "Array" ] "Array" [ Type.var "a" ]
                          , Type.namedWith [ "Array" ] "Array" [ Type.var "b" ]
                          , Type.namedWith [ "Array" ] "Array" [ Type.var "c" ]
                          , Type.namedWith [ "Array" ] "Array" [ Type.var "d" ]
                          ]
                          (Type.namedWith
                               [ "Array" ]
                               "Array"
                               [ Type.var "combined" ]
                          )
                     )
             }
        )
        [ Elm.functionReduced
            "map4Unpack"
            (\functionReducedUnpack ->
               Elm.functionReduced
                   "unpack"
                   (\functionReducedUnpack0 ->
                        Elm.functionReduced
                            "unpack"
                            (\functionReducedUnpack_2_1_2_0_2_0_2_0_0 ->
                                 Elm.functionReduced
                                     "unpack"
                                     (((map4Arg_ functionReducedUnpack)
                                           functionReducedUnpack0
                                      )
                                          functionReducedUnpack_2_1_2_0_2_0_2_0_0
                                     )
                            )
                   )
            )
        , map4Arg_0
        , map4Arg_1
        , map4Arg_2
        , map4Arg_3
        ]


{-| Combine the elements of five `Array`s with the given function. See [`map2`](Array-Extra#map2).

map5: 
    (a -> b -> c -> d -> e -> combined)
    -> Array.Array a
    -> Array.Array b
    -> Array.Array c
    -> Array.Array d
    -> Array.Array e
    -> Array.Array combined
-}
map5 :
    (Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression)
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
map5 map5Arg_ map5Arg_0 map5Arg_1 map5Arg_2 map5Arg_3 map5Arg_4 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Array", "Extra" ]
             , name = "map5"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function
                              [ Type.var "a"
                              , Type.var "b"
                              , Type.var "c"
                              , Type.var "d"
                              , Type.var "e"
                              ]
                              (Type.var "combined")
                          , Type.namedWith [ "Array" ] "Array" [ Type.var "a" ]
                          , Type.namedWith [ "Array" ] "Array" [ Type.var "b" ]
                          , Type.namedWith [ "Array" ] "Array" [ Type.var "c" ]
                          , Type.namedWith [ "Array" ] "Array" [ Type.var "d" ]
                          , Type.namedWith [ "Array" ] "Array" [ Type.var "e" ]
                          ]
                          (Type.namedWith
                               [ "Array" ]
                               "Array"
                               [ Type.var "combined" ]
                          )
                     )
             }
        )
        [ Elm.functionReduced
            "map5Unpack"
            (\functionReducedUnpack ->
               Elm.functionReduced
                   "unpack"
                   (\functionReducedUnpack0 ->
                        Elm.functionReduced
                            "unpack"
                            (\functionReducedUnpack_2_1_2_0_2_0_2_0_0 ->
                                 Elm.functionReduced
                                     "unpack"
                                     (\functionReducedUnpack_2_1_2_1_2_0_2_0_2_0_0 ->
                                          Elm.functionReduced
                                              "unpack"
                                              ((((map5Arg_ functionReducedUnpack
                                                 )
                                                     functionReducedUnpack0
                                                )
                                                    functionReducedUnpack_2_1_2_0_2_0_2_0_0
                                               )
                                                   functionReducedUnpack_2_1_2_1_2_0_2_0_2_0_0
                                              )
                                     )
                            )
                   )
            )
        , map5Arg_0
        , map5Arg_1
        , map5Arg_2
        , map5Arg_3
        , map5Arg_4
        ]


{-| Combine the elements of two `Array`s into tuples.
If one is longer, its extra elements are not used.

    import Array exposing (fromList)

    zip
        (fromList [ 1, 2, 3 ])
        (fromList [ 'a', 'b' ])
    --> fromList [ ( 1, 'a' ), ( 2, 'b' ) ]

zip: Array.Array a -> Array.Array b -> Array.Array ( a, b )
-}
zip : Elm.Expression -> Elm.Expression -> Elm.Expression
zip zipArg_ zipArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Array", "Extra" ]
             , name = "zip"
             , annotation =
                 Just
                     (Type.function
                          [ Type.namedWith [ "Array" ] "Array" [ Type.var "a" ]
                          , Type.namedWith [ "Array" ] "Array" [ Type.var "b" ]
                          ]
                          (Type.namedWith
                               [ "Array" ]
                               "Array"
                               [ Type.tuple (Type.var "a") (Type.var "b") ]
                          )
                     )
             }
        )
        [ zipArg_, zipArg_0 ]


{-| Zip the elements of three `Array`s into 3-tuples.
Only the indexes of the shortest `Array` are used.

    import Array exposing (fromList)

    zip3
        (fromList [ 1, 2, 3 ])
        (fromList [ 'a', 'b' ])
        (fromList [ "a", "b", "c", "d" ])
    --> fromList
    -->     [ ( 1, 'a', "a" )
    -->     , ( 2, 'b', "b" )
    -->     ]

zip3: Array.Array a -> Array.Array b -> Array.Array c -> Array.Array ( a, b, c )
-}
zip3 : Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
zip3 zip3Arg_ zip3Arg_0 zip3Arg_1 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Array", "Extra" ]
             , name = "zip3"
             , annotation =
                 Just
                     (Type.function
                          [ Type.namedWith [ "Array" ] "Array" [ Type.var "a" ]
                          , Type.namedWith [ "Array" ] "Array" [ Type.var "b" ]
                          , Type.namedWith [ "Array" ] "Array" [ Type.var "c" ]
                          ]
                          (Type.namedWith
                               [ "Array" ]
                               "Array"
                               [ Type.triple
                                   (Type.var "a")
                                   (Type.var "b")
                                   (Type.var "c")
                               ]
                          )
                     )
             }
        )
        [ zip3Arg_, zip3Arg_0, zip3Arg_1 ]


{-| Resize from the left, padding the right-hand side with a given value.

    import Array exposing (fromList, empty)

    fromList [ 1, 2 ] |> resizelRepeat 4 0
    --> fromList [ 1, 2, 0, 0 ]

    fromList [ 1, 2, 3 ] |> resizelRepeat 2 0
    --> fromList [ 1, 2 ]

    fromList [ 1, 2 ] |> resizelRepeat -1 0
    --> empty

resizelRepeat: Int -> a -> Array.Array a -> Array.Array a
-}
resizelRepeat : Int -> Elm.Expression -> Elm.Expression -> Elm.Expression
resizelRepeat resizelRepeatArg_ resizelRepeatArg_0 resizelRepeatArg_1 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Array", "Extra" ]
             , name = "resizelRepeat"
             , annotation =
                 Just
                     (Type.function
                          [ Type.int
                          , Type.var "a"
                          , Type.namedWith [ "Array" ] "Array" [ Type.var "a" ]
                          ]
                          (Type.namedWith [ "Array" ] "Array" [ Type.var "a" ])
                     )
             }
        )
        [ Elm.int resizelRepeatArg_, resizelRepeatArg_0, resizelRepeatArg_1 ]


{-| Resize from the right, padding the left-hand side with a given value.

    import Array exposing (fromList, empty)

    fromList [ 1, 2 ] |> resizerRepeat 4 0
    --> fromList [ 0, 0, 1, 2 ]

    fromList [ 1, 2, 3 ] |> resizerRepeat 2 0
    --> fromList [ 2, 3 ]

    fromList [ 1, 2 ] |> resizerRepeat -1 0
    --> empty

resizerRepeat: Int -> a -> Array.Array a -> Array.Array a
-}
resizerRepeat : Int -> Elm.Expression -> Elm.Expression -> Elm.Expression
resizerRepeat resizerRepeatArg_ resizerRepeatArg_0 resizerRepeatArg_1 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Array", "Extra" ]
             , name = "resizerRepeat"
             , annotation =
                 Just
                     (Type.function
                          [ Type.int
                          , Type.var "a"
                          , Type.namedWith [ "Array" ] "Array" [ Type.var "a" ]
                          ]
                          (Type.namedWith [ "Array" ] "Array" [ Type.var "a" ])
                     )
             }
        )
        [ Elm.int resizerRepeatArg_, resizerRepeatArg_0, resizerRepeatArg_1 ]


{-| Resize from the left, padding the right-hand side with a given value based on index.

    import Array exposing (fromList, empty)

    fromList [ 'a', 'b', 'c' ]
        |> resizelIndexed 5 toLetterInAlphabet
    --> fromList [ 'a', 'b', 'c', 'd', 'e' ]

    fromList [ 'a', 'b', 'c' ]
        |> resizelIndexed 2 toLetterInAlphabet
    --> fromList [ 'a', 'b' ]

    fromList [ 'a', 'b', 'c' ]
        |> resizelIndexed -1 toLetterInAlphabet
    --> empty

    toLetterInAlphabet : Int -> Char
    toLetterInAlphabet inAlphabet =
        Char.fromCode ((Char.toCode 'a') + inAlphabet)

resizelIndexed: Int -> (Int -> a) -> Array.Array a -> Array.Array a
-}
resizelIndexed :
    Int
    -> (Elm.Expression -> Elm.Expression)
    -> Elm.Expression
    -> Elm.Expression
resizelIndexed resizelIndexedArg_ resizelIndexedArg_0 resizelIndexedArg_1 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Array", "Extra" ]
             , name = "resizelIndexed"
             , annotation =
                 Just
                     (Type.function
                          [ Type.int
                          , Type.function [ Type.int ] (Type.var "a")
                          , Type.namedWith [ "Array" ] "Array" [ Type.var "a" ]
                          ]
                          (Type.namedWith [ "Array" ] "Array" [ Type.var "a" ])
                     )
             }
        )
        [ Elm.int resizelIndexedArg_
        , Elm.functionReduced "resizelIndexedUnpack" resizelIndexedArg_0
        , resizelIndexedArg_1
        ]


{-| Resize from the right, padding the left-hand side with a given value based on index.

    import Array exposing (fromList, empty)

    fromList [ 10, 25, 36 ]
        |> resizerIndexed 5 (\n -> n * 5)
    --> fromList [ 0, 5, 10, 25, 36 ]

    fromList [ 10, 25, 36 ]
        |> resizerIndexed 2 (\n -> n * 5)
    --> fromList [ 25, 36 ]

    fromList [ 10, 25, 36 ]
        |> resizerIndexed -1 (\n -> n * 5)
    --> empty

resizerIndexed: Int -> (Int -> a) -> Array.Array a -> Array.Array a
-}
resizerIndexed :
    Int
    -> (Elm.Expression -> Elm.Expression)
    -> Elm.Expression
    -> Elm.Expression
resizerIndexed resizerIndexedArg_ resizerIndexedArg_0 resizerIndexedArg_1 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Array", "Extra" ]
             , name = "resizerIndexed"
             , annotation =
                 Just
                     (Type.function
                          [ Type.int
                          , Type.function [ Type.int ] (Type.var "a")
                          , Type.namedWith [ "Array" ] "Array" [ Type.var "a" ]
                          ]
                          (Type.namedWith [ "Array" ] "Array" [ Type.var "a" ])
                     )
             }
        )
        [ Elm.int resizerIndexedArg_
        , Elm.functionReduced "resizerIndexedUnpack" resizerIndexedArg_0
        , resizerIndexedArg_1
        ]


{-| Apply a function to the elements in the array and collect the result in a List.

    import Array exposing (fromList)
    import Html

    fromList [ "a", "b", "c" ]
        |> mapToList Html.text
    --> [ Html.text "a", Html.text "b", Html.text "c" ]

mapToList: (a -> b) -> Array.Array a -> List b
-}
mapToList :
    (Elm.Expression -> Elm.Expression) -> Elm.Expression -> Elm.Expression
mapToList mapToListArg_ mapToListArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Array", "Extra" ]
             , name = "mapToList"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function [ Type.var "a" ] (Type.var "b")
                          , Type.namedWith [ "Array" ] "Array" [ Type.var "a" ]
                          ]
                          (Type.list (Type.var "b"))
                     )
             }
        )
        [ Elm.functionReduced "mapToListUnpack" mapToListArg_, mapToListArg_0 ]


{-| Transform all elements with their indexes as the first argument
and collect the result in a `List`.

    import Array exposing (Array, fromList)
    import Html exposing (Html)

    type alias Exercise =
        { name : String }

    exerciseRender : Int -> Exercise -> Html msg
    exerciseRender index =
        \exercise ->
            String.concat
                [ "Exercise #"
                , String.fromInt (index + 1)
                , " - "
                , exercise.name
                ]
                |> Html.text

    exercisesRender : Array Exercise -> Html msg
    exercisesRender =
        indexedMapToList renderExercise
            >> Html.div []

indexedMapToList: (Int -> a -> b) -> Array.Array a -> List b
-}
indexedMapToList :
    (Elm.Expression -> Elm.Expression -> Elm.Expression)
    -> Elm.Expression
    -> Elm.Expression
indexedMapToList indexedMapToListArg_ indexedMapToListArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Array", "Extra" ]
             , name = "indexedMapToList"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function
                              [ Type.int, Type.var "a" ]
                              (Type.var "b")
                          , Type.namedWith [ "Array" ] "Array" [ Type.var "a" ]
                          ]
                          (Type.list (Type.var "b"))
                     )
             }
        )
        [ Elm.functionReduced
            "indexedMapToListUnpack"
            (\functionReducedUnpack ->
               Elm.functionReduced
                   "unpack"
                   (indexedMapToListArg_ functionReducedUnpack)
            )
        , indexedMapToListArg_0
        ]


call_ :
    { all : Elm.Expression -> Elm.Expression -> Elm.Expression
    , any : Elm.Expression -> Elm.Expression -> Elm.Expression
    , member : Elm.Expression -> Elm.Expression -> Elm.Expression
    , reverse : Elm.Expression -> Elm.Expression
    , intersperse : Elm.Expression -> Elm.Expression -> Elm.Expression
    , update :
        Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
    , pop : Elm.Expression -> Elm.Expression
    , removeAt : Elm.Expression -> Elm.Expression -> Elm.Expression
    , insertAt :
        Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
    , removeWhen : Elm.Expression -> Elm.Expression -> Elm.Expression
    , filterMap : Elm.Expression -> Elm.Expression -> Elm.Expression
    , sliceFrom : Elm.Expression -> Elm.Expression -> Elm.Expression
    , sliceUntil : Elm.Expression -> Elm.Expression -> Elm.Expression
    , splitAt : Elm.Expression -> Elm.Expression -> Elm.Expression
    , unzip : Elm.Expression -> Elm.Expression
    , last : Elm.Expression -> Elm.Expression
    , interweave_ : Elm.Expression -> Elm.Expression -> Elm.Expression
    , andMap : Elm.Expression -> Elm.Expression -> Elm.Expression
    , map2 :
        Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
    , map3 :
        Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
    , map4 :
        Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
    , map5 :
        Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
    , zip : Elm.Expression -> Elm.Expression -> Elm.Expression
    , zip3 :
        Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
    , resizelRepeat :
        Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
    , resizerRepeat :
        Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
    , resizelIndexed :
        Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
    , resizerIndexed :
        Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
    , mapToList : Elm.Expression -> Elm.Expression -> Elm.Expression
    , indexedMapToList : Elm.Expression -> Elm.Expression -> Elm.Expression
    }
call_ =
    { all =
        \allArg_ allArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Array", "Extra" ]
                     , name = "all"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function [ Type.var "a" ] Type.bool
                                  , Type.namedWith
                                      [ "Array" ]
                                      "Array"
                                      [ Type.var "a" ]
                                  ]
                                  Type.bool
                             )
                     }
                )
                [ allArg_, allArg_0 ]
    , any =
        \anyArg_ anyArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Array", "Extra" ]
                     , name = "any"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function [ Type.var "a" ] Type.bool
                                  , Type.namedWith
                                      [ "Array" ]
                                      "Array"
                                      [ Type.var "a" ]
                                  ]
                                  Type.bool
                             )
                     }
                )
                [ anyArg_, anyArg_0 ]
    , member =
        \memberArg_ memberArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Array", "Extra" ]
                     , name = "member"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.var "a"
                                  , Type.namedWith
                                      [ "Array" ]
                                      "Array"
                                      [ Type.var "a" ]
                                  ]
                                  Type.bool
                             )
                     }
                )
                [ memberArg_, memberArg_0 ]
    , reverse =
        \reverseArg_ ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Array", "Extra" ]
                     , name = "reverse"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.namedWith
                                      [ "Array" ]
                                      "Array"
                                      [ Type.var "a" ]
                                  ]
                                  (Type.namedWith
                                       [ "Array" ]
                                       "Array"
                                       [ Type.var "a" ]
                                  )
                             )
                     }
                )
                [ reverseArg_ ]
    , intersperse =
        \intersperseArg_ intersperseArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Array", "Extra" ]
                     , name = "intersperse"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.var "a"
                                  , Type.namedWith
                                      [ "Array" ]
                                      "Array"
                                      [ Type.var "a" ]
                                  ]
                                  (Type.namedWith
                                       [ "Array" ]
                                       "Array"
                                       [ Type.var "a" ]
                                  )
                             )
                     }
                )
                [ intersperseArg_, intersperseArg_0 ]
    , update =
        \updateArg_ updateArg_0 updateArg_1 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Array", "Extra" ]
                     , name = "update"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.int
                                  , Type.function
                                      [ Type.var "a" ]
                                      (Type.var "a")
                                  , Type.namedWith
                                      [ "Array" ]
                                      "Array"
                                      [ Type.var "a" ]
                                  ]
                                  (Type.namedWith
                                       [ "Array" ]
                                       "Array"
                                       [ Type.var "a" ]
                                  )
                             )
                     }
                )
                [ updateArg_, updateArg_0, updateArg_1 ]
    , pop =
        \popArg_ ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Array", "Extra" ]
                     , name = "pop"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.namedWith
                                      [ "Array" ]
                                      "Array"
                                      [ Type.var "a" ]
                                  ]
                                  (Type.namedWith
                                       [ "Array" ]
                                       "Array"
                                       [ Type.var "a" ]
                                  )
                             )
                     }
                )
                [ popArg_ ]
    , removeAt =
        \removeAtArg_ removeAtArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Array", "Extra" ]
                     , name = "removeAt"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.int
                                  , Type.namedWith
                                      [ "Array" ]
                                      "Array"
                                      [ Type.var "a" ]
                                  ]
                                  (Type.namedWith
                                       [ "Array" ]
                                       "Array"
                                       [ Type.var "a" ]
                                  )
                             )
                     }
                )
                [ removeAtArg_, removeAtArg_0 ]
    , insertAt =
        \insertAtArg_ insertAtArg_0 insertAtArg_1 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Array", "Extra" ]
                     , name = "insertAt"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.int
                                  , Type.var "a"
                                  , Type.namedWith
                                      [ "Array" ]
                                      "Array"
                                      [ Type.var "a" ]
                                  ]
                                  (Type.namedWith
                                       [ "Array" ]
                                       "Array"
                                       [ Type.var "a" ]
                                  )
                             )
                     }
                )
                [ insertAtArg_, insertAtArg_0, insertAtArg_1 ]
    , removeWhen =
        \removeWhenArg_ removeWhenArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Array", "Extra" ]
                     , name = "removeWhen"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function [ Type.var "a" ] Type.bool
                                  , Type.namedWith
                                      [ "Array" ]
                                      "Array"
                                      [ Type.var "a" ]
                                  ]
                                  (Type.namedWith
                                       [ "Array" ]
                                       "Array"
                                       [ Type.var "a" ]
                                  )
                             )
                     }
                )
                [ removeWhenArg_, removeWhenArg_0 ]
    , filterMap =
        \filterMapArg_ filterMapArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Array", "Extra" ]
                     , name = "filterMap"
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
                                  (Type.namedWith
                                       [ "Array" ]
                                       "Array"
                                       [ Type.var "b" ]
                                  )
                             )
                     }
                )
                [ filterMapArg_, filterMapArg_0 ]
    , sliceFrom =
        \sliceFromArg_ sliceFromArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Array", "Extra" ]
                     , name = "sliceFrom"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.int
                                  , Type.namedWith
                                      [ "Array" ]
                                      "Array"
                                      [ Type.var "a" ]
                                  ]
                                  (Type.namedWith
                                       [ "Array" ]
                                       "Array"
                                       [ Type.var "a" ]
                                  )
                             )
                     }
                )
                [ sliceFromArg_, sliceFromArg_0 ]
    , sliceUntil =
        \sliceUntilArg_ sliceUntilArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Array", "Extra" ]
                     , name = "sliceUntil"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.int
                                  , Type.namedWith
                                      [ "Array" ]
                                      "Array"
                                      [ Type.var "a" ]
                                  ]
                                  (Type.namedWith
                                       [ "Array" ]
                                       "Array"
                                       [ Type.var "a" ]
                                  )
                             )
                     }
                )
                [ sliceUntilArg_, sliceUntilArg_0 ]
    , splitAt =
        \splitAtArg_ splitAtArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Array", "Extra" ]
                     , name = "splitAt"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.int
                                  , Type.namedWith
                                      [ "Array" ]
                                      "Array"
                                      [ Type.var "a" ]
                                  ]
                                  (Type.tuple
                                       (Type.namedWith
                                            [ "Array" ]
                                            "Array"
                                            [ Type.var "a" ]
                                       )
                                       (Type.namedWith
                                            [ "Array" ]
                                            "Array"
                                            [ Type.var "a" ]
                                       )
                                  )
                             )
                     }
                )
                [ splitAtArg_, splitAtArg_0 ]
    , unzip =
        \unzipArg_ ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Array", "Extra" ]
                     , name = "unzip"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.namedWith
                                      [ "Array" ]
                                      "Array"
                                      [ Type.tuple (Type.var "a") (Type.var "b")
                                      ]
                                  ]
                                  (Type.tuple
                                       (Type.namedWith
                                            [ "Array" ]
                                            "Array"
                                            [ Type.var "a" ]
                                       )
                                       (Type.namedWith
                                            [ "Array" ]
                                            "Array"
                                            [ Type.var "b" ]
                                       )
                                  )
                             )
                     }
                )
                [ unzipArg_ ]
    , last =
        \lastArg_ ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Array", "Extra" ]
                     , name = "last"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.namedWith
                                      [ "Array" ]
                                      "Array"
                                      [ Type.var "a" ]
                                  ]
                                  (Type.maybe (Type.var "a"))
                             )
                     }
                )
                [ lastArg_ ]
    , interweave_ =
        \interweave_Arg_ interweave_Arg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Array", "Extra" ]
                     , name = "interweave_"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.namedWith
                                      [ "Array" ]
                                      "Array"
                                      [ Type.var "a" ]
                                  , Type.namedWith
                                      [ "Array" ]
                                      "Array"
                                      [ Type.var "a" ]
                                  ]
                                  (Type.namedWith
                                       [ "Array" ]
                                       "Array"
                                       [ Type.var "a" ]
                                  )
                             )
                     }
                )
                [ interweave_Arg_, interweave_Arg_0 ]
    , andMap =
        \andMapArg_ andMapArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Array", "Extra" ]
                     , name = "andMap"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.namedWith
                                      [ "Array" ]
                                      "Array"
                                      [ Type.var "a" ]
                                  , Type.namedWith
                                      [ "Array" ]
                                      "Array"
                                      [ Type.function
                                            [ Type.var "a" ]
                                            (Type.var "b")
                                      ]
                                  ]
                                  (Type.namedWith
                                       [ "Array" ]
                                       "Array"
                                       [ Type.var "b" ]
                                  )
                             )
                     }
                )
                [ andMapArg_, andMapArg_0 ]
    , map2 =
        \map2Arg_ map2Arg_0 map2Arg_1 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Array", "Extra" ]
                     , name = "map2"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function
                                      [ Type.var "a", Type.var "b" ]
                                      (Type.var "combined")
                                  , Type.namedWith
                                      [ "Array" ]
                                      "Array"
                                      [ Type.var "a" ]
                                  , Type.namedWith
                                      [ "Array" ]
                                      "Array"
                                      [ Type.var "b" ]
                                  ]
                                  (Type.namedWith
                                       [ "Array" ]
                                       "Array"
                                       [ Type.var "combined" ]
                                  )
                             )
                     }
                )
                [ map2Arg_, map2Arg_0, map2Arg_1 ]
    , map3 =
        \map3Arg_ map3Arg_0 map3Arg_1 map3Arg_2 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Array", "Extra" ]
                     , name = "map3"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function
                                      [ Type.var "a"
                                      , Type.var "b"
                                      , Type.var "c"
                                      ]
                                      (Type.var "combined")
                                  , Type.namedWith
                                      [ "Array" ]
                                      "Array"
                                      [ Type.var "a" ]
                                  , Type.namedWith
                                      [ "Array" ]
                                      "Array"
                                      [ Type.var "b" ]
                                  , Type.namedWith
                                      [ "Array" ]
                                      "Array"
                                      [ Type.var "c" ]
                                  ]
                                  (Type.namedWith
                                       [ "Array" ]
                                       "Array"
                                       [ Type.var "combined" ]
                                  )
                             )
                     }
                )
                [ map3Arg_, map3Arg_0, map3Arg_1, map3Arg_2 ]
    , map4 =
        \map4Arg_ map4Arg_0 map4Arg_1 map4Arg_2 map4Arg_3 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Array", "Extra" ]
                     , name = "map4"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function
                                      [ Type.var "a"
                                      , Type.var "b"
                                      , Type.var "c"
                                      , Type.var "d"
                                      ]
                                      (Type.var "combined")
                                  , Type.namedWith
                                      [ "Array" ]
                                      "Array"
                                      [ Type.var "a" ]
                                  , Type.namedWith
                                      [ "Array" ]
                                      "Array"
                                      [ Type.var "b" ]
                                  , Type.namedWith
                                      [ "Array" ]
                                      "Array"
                                      [ Type.var "c" ]
                                  , Type.namedWith
                                      [ "Array" ]
                                      "Array"
                                      [ Type.var "d" ]
                                  ]
                                  (Type.namedWith
                                       [ "Array" ]
                                       "Array"
                                       [ Type.var "combined" ]
                                  )
                             )
                     }
                )
                [ map4Arg_, map4Arg_0, map4Arg_1, map4Arg_2, map4Arg_3 ]
    , map5 =
        \map5Arg_ map5Arg_0 map5Arg_1 map5Arg_2 map5Arg_3 map5Arg_4 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Array", "Extra" ]
                     , name = "map5"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function
                                      [ Type.var "a"
                                      , Type.var "b"
                                      , Type.var "c"
                                      , Type.var "d"
                                      , Type.var "e"
                                      ]
                                      (Type.var "combined")
                                  , Type.namedWith
                                      [ "Array" ]
                                      "Array"
                                      [ Type.var "a" ]
                                  , Type.namedWith
                                      [ "Array" ]
                                      "Array"
                                      [ Type.var "b" ]
                                  , Type.namedWith
                                      [ "Array" ]
                                      "Array"
                                      [ Type.var "c" ]
                                  , Type.namedWith
                                      [ "Array" ]
                                      "Array"
                                      [ Type.var "d" ]
                                  , Type.namedWith
                                      [ "Array" ]
                                      "Array"
                                      [ Type.var "e" ]
                                  ]
                                  (Type.namedWith
                                       [ "Array" ]
                                       "Array"
                                       [ Type.var "combined" ]
                                  )
                             )
                     }
                )
                [ map5Arg_
                , map5Arg_0
                , map5Arg_1
                , map5Arg_2
                , map5Arg_3
                , map5Arg_4
                ]
    , zip =
        \zipArg_ zipArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Array", "Extra" ]
                     , name = "zip"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.namedWith
                                      [ "Array" ]
                                      "Array"
                                      [ Type.var "a" ]
                                  , Type.namedWith
                                      [ "Array" ]
                                      "Array"
                                      [ Type.var "b" ]
                                  ]
                                  (Type.namedWith
                                       [ "Array" ]
                                       "Array"
                                       [ Type.tuple
                                           (Type.var "a")
                                           (Type.var "b")
                                       ]
                                  )
                             )
                     }
                )
                [ zipArg_, zipArg_0 ]
    , zip3 =
        \zip3Arg_ zip3Arg_0 zip3Arg_1 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Array", "Extra" ]
                     , name = "zip3"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.namedWith
                                      [ "Array" ]
                                      "Array"
                                      [ Type.var "a" ]
                                  , Type.namedWith
                                      [ "Array" ]
                                      "Array"
                                      [ Type.var "b" ]
                                  , Type.namedWith
                                      [ "Array" ]
                                      "Array"
                                      [ Type.var "c" ]
                                  ]
                                  (Type.namedWith
                                       [ "Array" ]
                                       "Array"
                                       [ Type.triple
                                           (Type.var "a")
                                           (Type.var "b")
                                           (Type.var "c")
                                       ]
                                  )
                             )
                     }
                )
                [ zip3Arg_, zip3Arg_0, zip3Arg_1 ]
    , resizelRepeat =
        \resizelRepeatArg_ resizelRepeatArg_0 resizelRepeatArg_1 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Array", "Extra" ]
                     , name = "resizelRepeat"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.int
                                  , Type.var "a"
                                  , Type.namedWith
                                      [ "Array" ]
                                      "Array"
                                      [ Type.var "a" ]
                                  ]
                                  (Type.namedWith
                                       [ "Array" ]
                                       "Array"
                                       [ Type.var "a" ]
                                  )
                             )
                     }
                )
                [ resizelRepeatArg_, resizelRepeatArg_0, resizelRepeatArg_1 ]
    , resizerRepeat =
        \resizerRepeatArg_ resizerRepeatArg_0 resizerRepeatArg_1 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Array", "Extra" ]
                     , name = "resizerRepeat"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.int
                                  , Type.var "a"
                                  , Type.namedWith
                                      [ "Array" ]
                                      "Array"
                                      [ Type.var "a" ]
                                  ]
                                  (Type.namedWith
                                       [ "Array" ]
                                       "Array"
                                       [ Type.var "a" ]
                                  )
                             )
                     }
                )
                [ resizerRepeatArg_, resizerRepeatArg_0, resizerRepeatArg_1 ]
    , resizelIndexed =
        \resizelIndexedArg_ resizelIndexedArg_0 resizelIndexedArg_1 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Array", "Extra" ]
                     , name = "resizelIndexed"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.int
                                  , Type.function [ Type.int ] (Type.var "a")
                                  , Type.namedWith
                                      [ "Array" ]
                                      "Array"
                                      [ Type.var "a" ]
                                  ]
                                  (Type.namedWith
                                       [ "Array" ]
                                       "Array"
                                       [ Type.var "a" ]
                                  )
                             )
                     }
                )
                [ resizelIndexedArg_, resizelIndexedArg_0, resizelIndexedArg_1 ]
    , resizerIndexed =
        \resizerIndexedArg_ resizerIndexedArg_0 resizerIndexedArg_1 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Array", "Extra" ]
                     , name = "resizerIndexed"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.int
                                  , Type.function [ Type.int ] (Type.var "a")
                                  , Type.namedWith
                                      [ "Array" ]
                                      "Array"
                                      [ Type.var "a" ]
                                  ]
                                  (Type.namedWith
                                       [ "Array" ]
                                       "Array"
                                       [ Type.var "a" ]
                                  )
                             )
                     }
                )
                [ resizerIndexedArg_, resizerIndexedArg_0, resizerIndexedArg_1 ]
    , mapToList =
        \mapToListArg_ mapToListArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Array", "Extra" ]
                     , name = "mapToList"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function
                                      [ Type.var "a" ]
                                      (Type.var "b")
                                  , Type.namedWith
                                      [ "Array" ]
                                      "Array"
                                      [ Type.var "a" ]
                                  ]
                                  (Type.list (Type.var "b"))
                             )
                     }
                )
                [ mapToListArg_, mapToListArg_0 ]
    , indexedMapToList =
        \indexedMapToListArg_ indexedMapToListArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Array", "Extra" ]
                     , name = "indexedMapToList"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function
                                      [ Type.int, Type.var "a" ]
                                      (Type.var "b")
                                  , Type.namedWith
                                      [ "Array" ]
                                      "Array"
                                      [ Type.var "a" ]
                                  ]
                                  (Type.list (Type.var "b"))
                             )
                     }
                )
                [ indexedMapToListArg_, indexedMapToListArg_0 ]
    }


values_ :
    { all : Elm.Expression
    , any : Elm.Expression
    , member : Elm.Expression
    , reverse : Elm.Expression
    , intersperse : Elm.Expression
    , update : Elm.Expression
    , pop : Elm.Expression
    , removeAt : Elm.Expression
    , insertAt : Elm.Expression
    , removeWhen : Elm.Expression
    , filterMap : Elm.Expression
    , sliceFrom : Elm.Expression
    , sliceUntil : Elm.Expression
    , splitAt : Elm.Expression
    , unzip : Elm.Expression
    , last : Elm.Expression
    , interweave_ : Elm.Expression
    , andMap : Elm.Expression
    , map2 : Elm.Expression
    , map3 : Elm.Expression
    , map4 : Elm.Expression
    , map5 : Elm.Expression
    , zip : Elm.Expression
    , zip3 : Elm.Expression
    , resizelRepeat : Elm.Expression
    , resizerRepeat : Elm.Expression
    , resizelIndexed : Elm.Expression
    , resizerIndexed : Elm.Expression
    , mapToList : Elm.Expression
    , indexedMapToList : Elm.Expression
    }
values_ =
    { all =
        Elm.value
            { importFrom = [ "Array", "Extra" ]
            , name = "all"
            , annotation =
                Just
                    (Type.function
                         [ Type.function [ Type.var "a" ] Type.bool
                         , Type.namedWith [ "Array" ] "Array" [ Type.var "a" ]
                         ]
                         Type.bool
                    )
            }
    , any =
        Elm.value
            { importFrom = [ "Array", "Extra" ]
            , name = "any"
            , annotation =
                Just
                    (Type.function
                         [ Type.function [ Type.var "a" ] Type.bool
                         , Type.namedWith [ "Array" ] "Array" [ Type.var "a" ]
                         ]
                         Type.bool
                    )
            }
    , member =
        Elm.value
            { importFrom = [ "Array", "Extra" ]
            , name = "member"
            , annotation =
                Just
                    (Type.function
                         [ Type.var "a"
                         , Type.namedWith [ "Array" ] "Array" [ Type.var "a" ]
                         ]
                         Type.bool
                    )
            }
    , reverse =
        Elm.value
            { importFrom = [ "Array", "Extra" ]
            , name = "reverse"
            , annotation =
                Just
                    (Type.function
                         [ Type.namedWith [ "Array" ] "Array" [ Type.var "a" ] ]
                         (Type.namedWith [ "Array" ] "Array" [ Type.var "a" ])
                    )
            }
    , intersperse =
        Elm.value
            { importFrom = [ "Array", "Extra" ]
            , name = "intersperse"
            , annotation =
                Just
                    (Type.function
                         [ Type.var "a"
                         , Type.namedWith [ "Array" ] "Array" [ Type.var "a" ]
                         ]
                         (Type.namedWith [ "Array" ] "Array" [ Type.var "a" ])
                    )
            }
    , update =
        Elm.value
            { importFrom = [ "Array", "Extra" ]
            , name = "update"
            , annotation =
                Just
                    (Type.function
                         [ Type.int
                         , Type.function [ Type.var "a" ] (Type.var "a")
                         , Type.namedWith [ "Array" ] "Array" [ Type.var "a" ]
                         ]
                         (Type.namedWith [ "Array" ] "Array" [ Type.var "a" ])
                    )
            }
    , pop =
        Elm.value
            { importFrom = [ "Array", "Extra" ]
            , name = "pop"
            , annotation =
                Just
                    (Type.function
                         [ Type.namedWith [ "Array" ] "Array" [ Type.var "a" ] ]
                         (Type.namedWith [ "Array" ] "Array" [ Type.var "a" ])
                    )
            }
    , removeAt =
        Elm.value
            { importFrom = [ "Array", "Extra" ]
            , name = "removeAt"
            , annotation =
                Just
                    (Type.function
                         [ Type.int
                         , Type.namedWith [ "Array" ] "Array" [ Type.var "a" ]
                         ]
                         (Type.namedWith [ "Array" ] "Array" [ Type.var "a" ])
                    )
            }
    , insertAt =
        Elm.value
            { importFrom = [ "Array", "Extra" ]
            , name = "insertAt"
            , annotation =
                Just
                    (Type.function
                         [ Type.int
                         , Type.var "a"
                         , Type.namedWith [ "Array" ] "Array" [ Type.var "a" ]
                         ]
                         (Type.namedWith [ "Array" ] "Array" [ Type.var "a" ])
                    )
            }
    , removeWhen =
        Elm.value
            { importFrom = [ "Array", "Extra" ]
            , name = "removeWhen"
            , annotation =
                Just
                    (Type.function
                         [ Type.function [ Type.var "a" ] Type.bool
                         , Type.namedWith [ "Array" ] "Array" [ Type.var "a" ]
                         ]
                         (Type.namedWith [ "Array" ] "Array" [ Type.var "a" ])
                    )
            }
    , filterMap =
        Elm.value
            { importFrom = [ "Array", "Extra" ]
            , name = "filterMap"
            , annotation =
                Just
                    (Type.function
                         [ Type.function
                             [ Type.var "a" ]
                             (Type.maybe (Type.var "b"))
                         , Type.namedWith [ "Array" ] "Array" [ Type.var "a" ]
                         ]
                         (Type.namedWith [ "Array" ] "Array" [ Type.var "b" ])
                    )
            }
    , sliceFrom =
        Elm.value
            { importFrom = [ "Array", "Extra" ]
            , name = "sliceFrom"
            , annotation =
                Just
                    (Type.function
                         [ Type.int
                         , Type.namedWith [ "Array" ] "Array" [ Type.var "a" ]
                         ]
                         (Type.namedWith [ "Array" ] "Array" [ Type.var "a" ])
                    )
            }
    , sliceUntil =
        Elm.value
            { importFrom = [ "Array", "Extra" ]
            , name = "sliceUntil"
            , annotation =
                Just
                    (Type.function
                         [ Type.int
                         , Type.namedWith [ "Array" ] "Array" [ Type.var "a" ]
                         ]
                         (Type.namedWith [ "Array" ] "Array" [ Type.var "a" ])
                    )
            }
    , splitAt =
        Elm.value
            { importFrom = [ "Array", "Extra" ]
            , name = "splitAt"
            , annotation =
                Just
                    (Type.function
                         [ Type.int
                         , Type.namedWith [ "Array" ] "Array" [ Type.var "a" ]
                         ]
                         (Type.tuple
                              (Type.namedWith
                                   [ "Array" ]
                                   "Array"
                                   [ Type.var "a" ]
                              )
                              (Type.namedWith
                                   [ "Array" ]
                                   "Array"
                                   [ Type.var "a" ]
                              )
                         )
                    )
            }
    , unzip =
        Elm.value
            { importFrom = [ "Array", "Extra" ]
            , name = "unzip"
            , annotation =
                Just
                    (Type.function
                         [ Type.namedWith
                             [ "Array" ]
                             "Array"
                             [ Type.tuple (Type.var "a") (Type.var "b") ]
                         ]
                         (Type.tuple
                              (Type.namedWith
                                   [ "Array" ]
                                   "Array"
                                   [ Type.var "a" ]
                              )
                              (Type.namedWith
                                   [ "Array" ]
                                   "Array"
                                   [ Type.var "b" ]
                              )
                         )
                    )
            }
    , last =
        Elm.value
            { importFrom = [ "Array", "Extra" ]
            , name = "last"
            , annotation =
                Just
                    (Type.function
                         [ Type.namedWith [ "Array" ] "Array" [ Type.var "a" ] ]
                         (Type.maybe (Type.var "a"))
                    )
            }
    , interweave_ =
        Elm.value
            { importFrom = [ "Array", "Extra" ]
            , name = "interweave_"
            , annotation =
                Just
                    (Type.function
                         [ Type.namedWith [ "Array" ] "Array" [ Type.var "a" ]
                         , Type.namedWith [ "Array" ] "Array" [ Type.var "a" ]
                         ]
                         (Type.namedWith [ "Array" ] "Array" [ Type.var "a" ])
                    )
            }
    , andMap =
        Elm.value
            { importFrom = [ "Array", "Extra" ]
            , name = "andMap"
            , annotation =
                Just
                    (Type.function
                         [ Type.namedWith [ "Array" ] "Array" [ Type.var "a" ]
                         , Type.namedWith
                             [ "Array" ]
                             "Array"
                             [ Type.function [ Type.var "a" ] (Type.var "b") ]
                         ]
                         (Type.namedWith [ "Array" ] "Array" [ Type.var "b" ])
                    )
            }
    , map2 =
        Elm.value
            { importFrom = [ "Array", "Extra" ]
            , name = "map2"
            , annotation =
                Just
                    (Type.function
                         [ Type.function
                             [ Type.var "a", Type.var "b" ]
                             (Type.var "combined")
                         , Type.namedWith [ "Array" ] "Array" [ Type.var "a" ]
                         , Type.namedWith [ "Array" ] "Array" [ Type.var "b" ]
                         ]
                         (Type.namedWith
                              [ "Array" ]
                              "Array"
                              [ Type.var "combined" ]
                         )
                    )
            }
    , map3 =
        Elm.value
            { importFrom = [ "Array", "Extra" ]
            , name = "map3"
            , annotation =
                Just
                    (Type.function
                         [ Type.function
                             [ Type.var "a", Type.var "b", Type.var "c" ]
                             (Type.var "combined")
                         , Type.namedWith [ "Array" ] "Array" [ Type.var "a" ]
                         , Type.namedWith [ "Array" ] "Array" [ Type.var "b" ]
                         , Type.namedWith [ "Array" ] "Array" [ Type.var "c" ]
                         ]
                         (Type.namedWith
                              [ "Array" ]
                              "Array"
                              [ Type.var "combined" ]
                         )
                    )
            }
    , map4 =
        Elm.value
            { importFrom = [ "Array", "Extra" ]
            , name = "map4"
            , annotation =
                Just
                    (Type.function
                         [ Type.function
                             [ Type.var "a"
                             , Type.var "b"
                             , Type.var "c"
                             , Type.var "d"
                             ]
                             (Type.var "combined")
                         , Type.namedWith [ "Array" ] "Array" [ Type.var "a" ]
                         , Type.namedWith [ "Array" ] "Array" [ Type.var "b" ]
                         , Type.namedWith [ "Array" ] "Array" [ Type.var "c" ]
                         , Type.namedWith [ "Array" ] "Array" [ Type.var "d" ]
                         ]
                         (Type.namedWith
                              [ "Array" ]
                              "Array"
                              [ Type.var "combined" ]
                         )
                    )
            }
    , map5 =
        Elm.value
            { importFrom = [ "Array", "Extra" ]
            , name = "map5"
            , annotation =
                Just
                    (Type.function
                         [ Type.function
                             [ Type.var "a"
                             , Type.var "b"
                             , Type.var "c"
                             , Type.var "d"
                             , Type.var "e"
                             ]
                             (Type.var "combined")
                         , Type.namedWith [ "Array" ] "Array" [ Type.var "a" ]
                         , Type.namedWith [ "Array" ] "Array" [ Type.var "b" ]
                         , Type.namedWith [ "Array" ] "Array" [ Type.var "c" ]
                         , Type.namedWith [ "Array" ] "Array" [ Type.var "d" ]
                         , Type.namedWith [ "Array" ] "Array" [ Type.var "e" ]
                         ]
                         (Type.namedWith
                              [ "Array" ]
                              "Array"
                              [ Type.var "combined" ]
                         )
                    )
            }
    , zip =
        Elm.value
            { importFrom = [ "Array", "Extra" ]
            , name = "zip"
            , annotation =
                Just
                    (Type.function
                         [ Type.namedWith [ "Array" ] "Array" [ Type.var "a" ]
                         , Type.namedWith [ "Array" ] "Array" [ Type.var "b" ]
                         ]
                         (Type.namedWith
                              [ "Array" ]
                              "Array"
                              [ Type.tuple (Type.var "a") (Type.var "b") ]
                         )
                    )
            }
    , zip3 =
        Elm.value
            { importFrom = [ "Array", "Extra" ]
            , name = "zip3"
            , annotation =
                Just
                    (Type.function
                         [ Type.namedWith [ "Array" ] "Array" [ Type.var "a" ]
                         , Type.namedWith [ "Array" ] "Array" [ Type.var "b" ]
                         , Type.namedWith [ "Array" ] "Array" [ Type.var "c" ]
                         ]
                         (Type.namedWith
                              [ "Array" ]
                              "Array"
                              [ Type.triple
                                  (Type.var "a")
                                  (Type.var "b")
                                  (Type.var "c")
                              ]
                         )
                    )
            }
    , resizelRepeat =
        Elm.value
            { importFrom = [ "Array", "Extra" ]
            , name = "resizelRepeat"
            , annotation =
                Just
                    (Type.function
                         [ Type.int
                         , Type.var "a"
                         , Type.namedWith [ "Array" ] "Array" [ Type.var "a" ]
                         ]
                         (Type.namedWith [ "Array" ] "Array" [ Type.var "a" ])
                    )
            }
    , resizerRepeat =
        Elm.value
            { importFrom = [ "Array", "Extra" ]
            , name = "resizerRepeat"
            , annotation =
                Just
                    (Type.function
                         [ Type.int
                         , Type.var "a"
                         , Type.namedWith [ "Array" ] "Array" [ Type.var "a" ]
                         ]
                         (Type.namedWith [ "Array" ] "Array" [ Type.var "a" ])
                    )
            }
    , resizelIndexed =
        Elm.value
            { importFrom = [ "Array", "Extra" ]
            , name = "resizelIndexed"
            , annotation =
                Just
                    (Type.function
                         [ Type.int
                         , Type.function [ Type.int ] (Type.var "a")
                         , Type.namedWith [ "Array" ] "Array" [ Type.var "a" ]
                         ]
                         (Type.namedWith [ "Array" ] "Array" [ Type.var "a" ])
                    )
            }
    , resizerIndexed =
        Elm.value
            { importFrom = [ "Array", "Extra" ]
            , name = "resizerIndexed"
            , annotation =
                Just
                    (Type.function
                         [ Type.int
                         , Type.function [ Type.int ] (Type.var "a")
                         , Type.namedWith [ "Array" ] "Array" [ Type.var "a" ]
                         ]
                         (Type.namedWith [ "Array" ] "Array" [ Type.var "a" ])
                    )
            }
    , mapToList =
        Elm.value
            { importFrom = [ "Array", "Extra" ]
            , name = "mapToList"
            , annotation =
                Just
                    (Type.function
                         [ Type.function [ Type.var "a" ] (Type.var "b")
                         , Type.namedWith [ "Array" ] "Array" [ Type.var "a" ]
                         ]
                         (Type.list (Type.var "b"))
                    )
            }
    , indexedMapToList =
        Elm.value
            { importFrom = [ "Array", "Extra" ]
            , name = "indexedMapToList"
            , annotation =
                Just
                    (Type.function
                         [ Type.function
                             [ Type.int, Type.var "a" ]
                             (Type.var "b")
                         , Type.namedWith [ "Array" ] "Array" [ Type.var "a" ]
                         ]
                         (Type.list (Type.var "b"))
                    )
            }
    }