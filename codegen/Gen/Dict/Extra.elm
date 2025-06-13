module Gen.Dict.Extra exposing
    ( moduleName_, groupBy, filterGroupBy, fromListBy, fromListCombining, fromListByCombining
    , frequencies, removeWhen, removeMany, keepOnly, insertCombining, updateIfExists, upsert
    , invert, invertAll, mapKeys, filterMap, any, all, find
    , unionWith, call_, values_
    )

{-|
# Generated bindings for Dict.Extra

@docs moduleName_, groupBy, filterGroupBy, fromListBy, fromListCombining, fromListByCombining
@docs frequencies, removeWhen, removeMany, keepOnly, insertCombining, updateIfExists
@docs upsert, invert, invertAll, mapKeys, filterMap, any
@docs all, find, unionWith, call_, values_
-}


import Elm
import Elm.Annotation as Type


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Dict", "Extra" ]


{-| Takes a key-fn and a list.
Creates a `Dict` which maps the key to a list of matching elements.

    import Dict

    groupBy String.length [ "tree" , "apple" , "leaf" ]
    --> Dict.fromList [ ( 4, [ "tree", "leaf" ] ), ( 5, [ "apple" ] ) ]

**See also:** [`List.Extra.gatherEqualsBy`](./List-Extra#gatherEqualsBy).

groupBy: (a -> comparable) -> List a -> Dict.Dict comparable (List a)
-}
groupBy :
    (Elm.Expression -> Elm.Expression) -> List Elm.Expression -> Elm.Expression
groupBy groupByArg_ groupByArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Dict", "Extra" ]
             , name = "groupBy"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function
                              [ Type.var "a" ]
                              (Type.var "comparable")
                          , Type.list (Type.var "a")
                          ]
                          (Type.namedWith
                               [ "Dict" ]
                               "Dict"
                               [ Type.var "comparable"
                               , Type.list (Type.var "a")
                               ]
                          )
                     )
             }
        )
        [ Elm.functionReduced "groupByUnpack" groupByArg_
        , Elm.list groupByArg_0
        ]


{-| Takes a key-fn and a list.
Creates a `Dict` which maps the key to a list of matching elements, skipping elements
where key-fn returns `Nothing`

    import Dict

    filterGroupBy (String.uncons >> Maybe.map Tuple.first) [ "tree" , "", "tweet", "apple" , "leaf", "" ]
    --> Dict.fromList [ ( 't', [ "tree", "tweet" ] ), ( 'a', [ "apple" ] ), ( 'l', [ "leaf" ] ) ]

    filterGroupBy
        .car
        [ { name = "Mary"
          , car = Just "Ford"
          }
        , { name = "Jack"
          , car = Nothing
          }
        , { name = "Jill"
          , car = Just "Tesla"
          }
        , { name = "John"
          , car = Just "Tesla"
          }
        ]
    --> Dict.fromList
    --> [ ( "Ford"
    -->   , [ { name = "Mary" , car = Just "Ford" } ]
    -->   )
    --> , ( "Tesla"
    -->   , [ { name = "Jill" , car = Just "Tesla" }
    -->     , { name = "John" , car = Just "Tesla" }
    -->     ]
    -->   )
    --> ]

filterGroupBy: (a -> Maybe comparable) -> List a -> Dict.Dict comparable (List a)
-}
filterGroupBy :
    (Elm.Expression -> Elm.Expression) -> List Elm.Expression -> Elm.Expression
filterGroupBy filterGroupByArg_ filterGroupByArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Dict", "Extra" ]
             , name = "filterGroupBy"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function
                              [ Type.var "a" ]
                              (Type.maybe (Type.var "comparable"))
                          , Type.list (Type.var "a")
                          ]
                          (Type.namedWith
                               [ "Dict" ]
                               "Dict"
                               [ Type.var "comparable"
                               , Type.list (Type.var "a")
                               ]
                          )
                     )
             }
        )
        [ Elm.functionReduced "filterGroupByUnpack" filterGroupByArg_
        , Elm.list filterGroupByArg_0
        ]


{-| Create a dictionary from a list of values, by passing a function that can get a key from any such value.
If the function does not return unique keys, earlier values are discarded.

    import Dict

    fromListBy String.length [ "tree" , "apple" , "leaf" ]
    --> Dict.fromList [ ( 4, "leaf" ), ( 5, "apple" ) ]

fromListBy: (a -> comparable) -> List a -> Dict.Dict comparable a
-}
fromListBy :
    (Elm.Expression -> Elm.Expression) -> List Elm.Expression -> Elm.Expression
fromListBy fromListByArg_ fromListByArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Dict", "Extra" ]
             , name = "fromListBy"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function
                              [ Type.var "a" ]
                              (Type.var "comparable")
                          , Type.list (Type.var "a")
                          ]
                          (Type.namedWith
                               [ "Dict" ]
                               "Dict"
                               [ Type.var "comparable", Type.var "a" ]
                          )
                     )
             }
        )
        [ Elm.functionReduced "fromListByUnpack" fromListByArg_
        , Elm.list fromListByArg_0
        ]


{-| Like `Dict.fromList`, but you provide a way to deal with
duplicate keys. Create a dictionary from a list of pairs of keys and
values, providing a function that is used to combine multiple values
paired with the same key.

    import Dict

    fromListCombining
        (\a b -> a ++ " " ++ b)
        [ ( "class", "menu" ), ( "width", "100%" ), ( "class", "big" ) ]
    --> Dict.fromList [ ( "class", "menu big" ), ( "width", "100%" ) ]

fromListCombining: (a -> a -> a) -> List ( comparable, a ) -> Dict.Dict comparable a
-}
fromListCombining :
    (Elm.Expression -> Elm.Expression -> Elm.Expression)
    -> List Elm.Expression
    -> Elm.Expression
fromListCombining fromListCombiningArg_ fromListCombiningArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Dict", "Extra" ]
             , name = "fromListCombining"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function
                              [ Type.var "a", Type.var "a" ]
                              (Type.var "a")
                          , Type.list
                              (Type.tuple (Type.var "comparable") (Type.var "a")
                              )
                          ]
                          (Type.namedWith
                               [ "Dict" ]
                               "Dict"
                               [ Type.var "comparable", Type.var "a" ]
                          )
                     )
             }
        )
        [ Elm.functionReduced
            "fromListCombiningUnpack"
            (\functionReducedUnpack ->
               Elm.functionReduced
                   "unpack"
                   (fromListCombiningArg_ functionReducedUnpack)
            )
        , Elm.list fromListCombiningArg_0
        ]


{-| `fromListBy` and `fromListCombining` rolled into one.

    import Dict

    fromListByCombining (\first second -> first) String.length [ "tree" , "apple" , "leaf" ]
    --> Dict.fromList [ ( 4, "tree" ), ( 5, "apple" ) ]

fromListByCombining: (a -> a -> a) -> (a -> comparable) -> List a -> Dict.Dict comparable a
-}
fromListByCombining :
    (Elm.Expression -> Elm.Expression -> Elm.Expression)
    -> (Elm.Expression -> Elm.Expression)
    -> List Elm.Expression
    -> Elm.Expression
fromListByCombining fromListByCombiningArg_ fromListByCombiningArg_0 fromListByCombiningArg_1 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Dict", "Extra" ]
             , name = "fromListByCombining"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function
                              [ Type.var "a", Type.var "a" ]
                              (Type.var "a")
                          , Type.function
                              [ Type.var "a" ]
                              (Type.var "comparable")
                          , Type.list (Type.var "a")
                          ]
                          (Type.namedWith
                               [ "Dict" ]
                               "Dict"
                               [ Type.var "comparable", Type.var "a" ]
                          )
                     )
             }
        )
        [ Elm.functionReduced
            "fromListByCombiningUnpack"
            (\functionReducedUnpack ->
               Elm.functionReduced
                   "unpack"
                   (fromListByCombiningArg_ functionReducedUnpack)
            )
        , Elm.functionReduced
            "fromListByCombiningUnpack"
            fromListByCombiningArg_0
        , Elm.list fromListByCombiningArg_1
        ]


{-| Count the number of occurrences for each of the elements in the list.

    import Dict

    frequencies [ "A", "B", "C", "B", "C", "B" ]
    --> Dict.fromList [ ( "A", 1 ), ( "B", 3 ), ( "C", 2 ) ]

frequencies: List comparable -> Dict.Dict comparable Int
-}
frequencies : List Elm.Expression -> Elm.Expression
frequencies frequenciesArg_ =
    Elm.apply
        (Elm.value
             { importFrom = [ "Dict", "Extra" ]
             , name = "frequencies"
             , annotation =
                 Just
                     (Type.function
                          [ Type.list (Type.var "comparable") ]
                          (Type.namedWith
                               [ "Dict" ]
                               "Dict"
                               [ Type.var "comparable", Type.int ]
                          )
                     )
             }
        )
        [ Elm.list frequenciesArg_ ]


{-| Remove elements which satisfies the predicate.

    import Dict

    Dict.fromList [ ( "Mary", 1 ), ( "Jack", 2 ), ( "Jill", 1 ) ]
        |> removeWhen (\_ value -> value == 1 )
    --> Dict.fromList [ ( "Jack", 2 ) ]

removeWhen: (comparable -> v -> Bool) -> Dict.Dict comparable v -> Dict.Dict comparable v
-}
removeWhen :
    (Elm.Expression -> Elm.Expression -> Elm.Expression)
    -> Elm.Expression
    -> Elm.Expression
removeWhen removeWhenArg_ removeWhenArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Dict", "Extra" ]
             , name = "removeWhen"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function
                              [ Type.var "comparable", Type.var "v" ]
                              Type.bool
                          , Type.namedWith
                              [ "Dict" ]
                              "Dict"
                              [ Type.var "comparable", Type.var "v" ]
                          ]
                          (Type.namedWith
                               [ "Dict" ]
                               "Dict"
                               [ Type.var "comparable", Type.var "v" ]
                          )
                     )
             }
        )
        [ Elm.functionReduced
            "removeWhenUnpack"
            (\functionReducedUnpack ->
               Elm.functionReduced
                   "unpack"
                   (removeWhenArg_ functionReducedUnpack)
            )
        , removeWhenArg_0
        ]


{-| Remove a key-value pair if its key appears in the set.

    import Dict
    import Set

    Dict.fromList [ ( "Mary", 1 ), ( "Jack", 2 ), ( "Jill", 1 ) ]
        |> removeMany (Set.fromList [ "Mary", "Jill" ])
    --> Dict.fromList [ ( "Jack", 2 ) ]

removeMany: Set.Set comparable -> Dict.Dict comparable v -> Dict.Dict comparable v
-}
removeMany : Elm.Expression -> Elm.Expression -> Elm.Expression
removeMany removeManyArg_ removeManyArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Dict", "Extra" ]
             , name = "removeMany"
             , annotation =
                 Just
                     (Type.function
                          [ Type.namedWith
                              [ "Set" ]
                              "Set"
                              [ Type.var "comparable" ]
                          , Type.namedWith
                              [ "Dict" ]
                              "Dict"
                              [ Type.var "comparable", Type.var "v" ]
                          ]
                          (Type.namedWith
                               [ "Dict" ]
                               "Dict"
                               [ Type.var "comparable", Type.var "v" ]
                          )
                     )
             }
        )
        [ removeManyArg_, removeManyArg_0 ]


{-| Keep a key-value pair if its key appears in the set.

    import Dict
    import Set

    Dict.fromList [ ( "Mary", 1 ), ( "Jack", 2 ), ( "Jill", 1 ) ]
        |> keepOnly (Set.fromList [ "Jack", "Jill" ])
    --> Dict.fromList [ ( "Jack", 2 ), ( "Jill", 1 ) ]

keepOnly: Set.Set comparable -> Dict.Dict comparable v -> Dict.Dict comparable v
-}
keepOnly : Elm.Expression -> Elm.Expression -> Elm.Expression
keepOnly keepOnlyArg_ keepOnlyArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Dict", "Extra" ]
             , name = "keepOnly"
             , annotation =
                 Just
                     (Type.function
                          [ Type.namedWith
                              [ "Set" ]
                              "Set"
                              [ Type.var "comparable" ]
                          , Type.namedWith
                              [ "Dict" ]
                              "Dict"
                              [ Type.var "comparable", Type.var "v" ]
                          ]
                          (Type.namedWith
                               [ "Dict" ]
                               "Dict"
                               [ Type.var "comparable", Type.var "v" ]
                          )
                     )
             }
        )
        [ keepOnlyArg_, keepOnlyArg_0 ]


{-| Insert an element at the given key, providing a combining
function that used in the case that there is already an
element at that key. The combining function is called with
original element and the new element as arguments and
returns the element to be inserted.

    import Dict

    Dict.fromList [ ( "expenses", 38.25 ), ( "assets", 100.85 ) ]
        |> insertCombining (+) "expenses" 2.50
        |> insertCombining (+) "liabilities" -2.50
    --> Dict.fromList [ ( "expenses", 40.75 ), ( "assets", 100.85 ), ( "liabilities", -2.50 ) ]

insertCombining: 
    (v -> v -> v)
    -> comparable
    -> v
    -> Dict.Dict comparable v
    -> Dict.Dict comparable v
-}
insertCombining :
    (Elm.Expression -> Elm.Expression -> Elm.Expression)
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
insertCombining insertCombiningArg_ insertCombiningArg_0 insertCombiningArg_1 insertCombiningArg_2 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Dict", "Extra" ]
             , name = "insertCombining"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function
                              [ Type.var "v", Type.var "v" ]
                              (Type.var "v")
                          , Type.var "comparable"
                          , Type.var "v"
                          , Type.namedWith
                              [ "Dict" ]
                              "Dict"
                              [ Type.var "comparable", Type.var "v" ]
                          ]
                          (Type.namedWith
                               [ "Dict" ]
                               "Dict"
                               [ Type.var "comparable", Type.var "v" ]
                          )
                     )
             }
        )
        [ Elm.functionReduced
            "insertCombiningUnpack"
            (\functionReducedUnpack ->
               Elm.functionReduced
                   "unpack"
                   (insertCombiningArg_ functionReducedUnpack)
            )
        , insertCombiningArg_0
        , insertCombiningArg_1
        , insertCombiningArg_2
        ]


{-| Updates a value if the key is present in the dictionary, leaves the dictionary untouched otherwise.

    import Dict

    Dict.fromList [ ( "expenses", 38.25 ), ( "assets", 100.85 ) ]
        |> updateIfExists "expenses" (\amount -> amount + 2.50)
        |> updateIfExists "liabilities" (\amount -> amount - 2.50)
        --> Dict.fromList [ ( "expenses", 40.75 ), ( "assets", 100.85 ) ]

updateIfExists: comparable -> (a -> a) -> Dict.Dict comparable a -> Dict.Dict comparable a
-}
updateIfExists :
    Elm.Expression
    -> (Elm.Expression -> Elm.Expression)
    -> Elm.Expression
    -> Elm.Expression
updateIfExists updateIfExistsArg_ updateIfExistsArg_0 updateIfExistsArg_1 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Dict", "Extra" ]
             , name = "updateIfExists"
             , annotation =
                 Just
                     (Type.function
                          [ Type.var "comparable"
                          , Type.function [ Type.var "a" ] (Type.var "a")
                          , Type.namedWith
                              [ "Dict" ]
                              "Dict"
                              [ Type.var "comparable", Type.var "a" ]
                          ]
                          (Type.namedWith
                               [ "Dict" ]
                               "Dict"
                               [ Type.var "comparable", Type.var "a" ]
                          )
                     )
             }
        )
        [ updateIfExistsArg_
        , Elm.functionReduced "updateIfExistsUnpack" updateIfExistsArg_0
        , updateIfExistsArg_1
        ]


{-| Updates a value if the key is present in the dictionary, inserts a new key-value pair otherwise.

    import Dict

    Dict.fromList [ ( "expenses", 38.25 ), ( "assets", 100.85 ) ]
        |> upsert "expenses" 4.50 (\amount -> amount + 2.50)
        |> upsert "liabilities" 2.50 (\amount -> amount - 2.50)
        --> Dict.fromList [ ( "expenses", 40.75 ), ( "assets", 100.85 ), ( "liabilities", 2.50 ) ]

upsert: comparable -> a -> (a -> a) -> Dict.Dict comparable a -> Dict.Dict comparable a
-}
upsert :
    Elm.Expression
    -> Elm.Expression
    -> (Elm.Expression -> Elm.Expression)
    -> Elm.Expression
    -> Elm.Expression
upsert upsertArg_ upsertArg_0 upsertArg_1 upsertArg_2 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Dict", "Extra" ]
             , name = "upsert"
             , annotation =
                 Just
                     (Type.function
                          [ Type.var "comparable"
                          , Type.var "a"
                          , Type.function [ Type.var "a" ] (Type.var "a")
                          , Type.namedWith
                              [ "Dict" ]
                              "Dict"
                              [ Type.var "comparable", Type.var "a" ]
                          ]
                          (Type.namedWith
                               [ "Dict" ]
                               "Dict"
                               [ Type.var "comparable", Type.var "a" ]
                          )
                     )
             }
        )
        [ upsertArg_
        , upsertArg_0
        , Elm.functionReduced "upsertUnpack" upsertArg_1
        , upsertArg_2
        ]


{-| Inverts the keys and values of an array.

    import Dict

    Dict.fromList [ ("key", "value")  ]
        |> invert
    --> Dict.fromList [ ( "value", "key" ) ]

invert: Dict.Dict comparable1 comparable2 -> Dict.Dict comparable2 comparable1
-}
invert : Elm.Expression -> Elm.Expression
invert invertArg_ =
    Elm.apply
        (Elm.value
             { importFrom = [ "Dict", "Extra" ]
             , name = "invert"
             , annotation =
                 Just
                     (Type.function
                          [ Type.namedWith
                              [ "Dict" ]
                              "Dict"
                              [ Type.var "comparable1", Type.var "comparable2" ]
                          ]
                          (Type.namedWith
                               [ "Dict" ]
                               "Dict"
                               [ Type.var "comparable2"
                               , Type.var "comparable1"
                               ]
                          )
                     )
             }
        )
        [ invertArg_ ]


{-| Like `invert`, it changes the keys and values. However, if one value maps to multiple keys, then all of the keys will be retained.

    import Dict
    import Set

    Dict.fromList [ ( 1, "Jill" ), ( 2, "Jill" ), ( 3, "Jack" ) ]
        |> invertAll
    --> Dict.fromList [ ( "Jill", Set.fromList [ 1, 2 ] ), ( "Jack", Set.singleton 3 ) ]

invertAll: Dict.Dict comparable1 comparable2 -> Dict.Dict comparable2 (Set.Set comparable1)
-}
invertAll : Elm.Expression -> Elm.Expression
invertAll invertAllArg_ =
    Elm.apply
        (Elm.value
             { importFrom = [ "Dict", "Extra" ]
             , name = "invertAll"
             , annotation =
                 Just
                     (Type.function
                          [ Type.namedWith
                              [ "Dict" ]
                              "Dict"
                              [ Type.var "comparable1", Type.var "comparable2" ]
                          ]
                          (Type.namedWith
                               [ "Dict" ]
                               "Dict"
                               [ Type.var "comparable2"
                               , Type.namedWith
                                   [ "Set" ]
                                   "Set"
                                   [ Type.var "comparable1" ]
                               ]
                          )
                     )
             }
        )
        [ invertAllArg_ ]


{-| Apply a function to all keys in a dictionary.

    import Dict

    Dict.fromList [ ( 5, "Jack" ), ( 10, "Jill" ) ]
        |> mapKeys (\x -> x + 1)
    --> Dict.fromList [ ( 6, "Jack" ), ( 11, "Jill" ) ]

    Dict.fromList [ ( 5, "Jack" ), ( 10, "Jill" ) ]
        |> mapKeys String.fromInt
    --> Dict.fromList [ ( "5", "Jack" ), ( "10", "Jill" ) ]

mapKeys: (comparable -> comparable1) -> Dict.Dict comparable v -> Dict.Dict comparable1 v
-}
mapKeys : (Elm.Expression -> Elm.Expression) -> Elm.Expression -> Elm.Expression
mapKeys mapKeysArg_ mapKeysArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Dict", "Extra" ]
             , name = "mapKeys"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function
                              [ Type.var "comparable" ]
                              (Type.var "comparable1")
                          , Type.namedWith
                              [ "Dict" ]
                              "Dict"
                              [ Type.var "comparable", Type.var "v" ]
                          ]
                          (Type.namedWith
                               [ "Dict" ]
                               "Dict"
                               [ Type.var "comparable1", Type.var "v" ]
                          )
                     )
             }
        )
        [ Elm.functionReduced "mapKeysUnpack" mapKeysArg_, mapKeysArg_0 ]


{-| Apply a function that may or may not succeed to all entries in a dictionary,
but only keep the successes.

    import Dict

    let
        isTeen n a =
            if 13 <= n && n <= 19 then
                Just <| String.toUpper a
            else
                Nothing
    in
    Dict.fromList [ ( 5, "Jack" ), ( 15, "Jill" ), ( 20, "Jones" ) ]
        |> filterMap isTeen
    --> Dict.fromList [ ( 15, "JILL" ) ]

filterMap: (comparable -> a -> Maybe b) -> Dict.Dict comparable a -> Dict.Dict comparable b
-}
filterMap :
    (Elm.Expression -> Elm.Expression -> Elm.Expression)
    -> Elm.Expression
    -> Elm.Expression
filterMap filterMapArg_ filterMapArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Dict", "Extra" ]
             , name = "filterMap"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function
                              [ Type.var "comparable", Type.var "a" ]
                              (Type.maybe (Type.var "b"))
                          , Type.namedWith
                              [ "Dict" ]
                              "Dict"
                              [ Type.var "comparable", Type.var "a" ]
                          ]
                          (Type.namedWith
                               [ "Dict" ]
                               "Dict"
                               [ Type.var "comparable", Type.var "b" ]
                          )
                     )
             }
        )
        [ Elm.functionReduced
            "filterMapUnpack"
            (\functionReducedUnpack ->
               Elm.functionReduced
                   "unpack"
                   (filterMapArg_ functionReducedUnpack)
            )
        , filterMapArg_0
        ]


{-| Determine if any key/value pair satisfies some test.

    import Dict

    Dict.fromList [ ( 9, "Jill" ), ( 7, "Jill" ) ]
        |> any (\_ value -> value == "Jill")
    --> True

    Dict.fromList [ ( 9, "Jill" ), ( 7, "Jill" ) ]
        |> any (\key _ -> key == 5)
    --> False

any: (comparable -> a -> Bool) -> Dict.Dict comparable a -> Bool
-}
any :
    (Elm.Expression -> Elm.Expression -> Elm.Expression)
    -> Elm.Expression
    -> Elm.Expression
any anyArg_ anyArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Dict", "Extra" ]
             , name = "any"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function
                              [ Type.var "comparable", Type.var "a" ]
                              Type.bool
                          , Type.namedWith
                              [ "Dict" ]
                              "Dict"
                              [ Type.var "comparable", Type.var "a" ]
                          ]
                          Type.bool
                     )
             }
        )
        [ Elm.functionReduced
            "anyUnpack"
            (\functionReducedUnpack ->
               Elm.functionReduced "unpack" (anyArg_ functionReducedUnpack)
            )
        , anyArg_0
        ]


{-| Determine if all key/value pairs satisfies some test.

    import Dict

    Dict.fromList [ ( 9, "Jill" ), ( 7, "Jill" ) ]
        |> all (\_ value -> value == "Jill")
    --> True

    Dict.fromList [ ( 9, "Jill" ), ( 7, "Jill" ) ]
        |> all (\key _ -> key == 9)
    --> False

all: (comparable -> a -> Bool) -> Dict.Dict comparable a -> Bool
-}
all :
    (Elm.Expression -> Elm.Expression -> Elm.Expression)
    -> Elm.Expression
    -> Elm.Expression
all allArg_ allArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Dict", "Extra" ]
             , name = "all"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function
                              [ Type.var "comparable", Type.var "a" ]
                              Type.bool
                          , Type.namedWith
                              [ "Dict" ]
                              "Dict"
                              [ Type.var "comparable", Type.var "a" ]
                          ]
                          Type.bool
                     )
             }
        )
        [ Elm.functionReduced
            "allUnpack"
            (\functionReducedUnpack ->
               Elm.functionReduced "unpack" (allArg_ functionReducedUnpack)
            )
        , allArg_0
        ]


{-| Find the first key/value pair that matches a predicate.

    import Dict

    Dict.fromList [ ( 9, "Jill" ), ( 7, "Jill" ) ]
        |> find (\_ value -> value == "Jill")
    --> Just ( 7, "Jill" )

    Dict.fromList [ ( 9, "Jill" ), ( 7, "Jill" ) ]
        |> find (\key _ -> key == 5)
    --> Nothing

find: (comparable -> a -> Bool) -> Dict.Dict comparable a -> Maybe ( comparable, a )
-}
find :
    (Elm.Expression -> Elm.Expression -> Elm.Expression)
    -> Elm.Expression
    -> Elm.Expression
find findArg_ findArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Dict", "Extra" ]
             , name = "find"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function
                              [ Type.var "comparable", Type.var "a" ]
                              Type.bool
                          , Type.namedWith
                              [ "Dict" ]
                              "Dict"
                              [ Type.var "comparable", Type.var "a" ]
                          ]
                          (Type.maybe
                               (Type.tuple
                                    (Type.var "comparable")
                                    (Type.var "a")
                               )
                          )
                     )
             }
        )
        [ Elm.functionReduced
            "findUnpack"
            (\functionReducedUnpack ->
               Elm.functionReduced "unpack" (findArg_ functionReducedUnpack)
            )
        , findArg_0
        ]


{-| Combine two dictionaries. If there is a collision, a combining function is
used to combine the two values.

    import Dict

    unionWith (\k v1 v2 -> String.fromInt k ++ v1 ++ v2 )
        (Dict.fromList [ ( 1, "123" ), ( 2, "abc" ) ])
        (Dict.fromList [ ( 2, "def" ), ( 3, "xyz" ) ])
        --> Dict.fromList [ ( 1, "123" ), ( 2, "2abcdef" ), ( 3, "xyz" ) ]

Note that, like `Dict.union`, it is more efficient to have the larger `Dict` as
the second argument, i.e. when possible, you should use `unionWith f new old`,
if `old` has more keys than `new`.

unionWith: 
    (comparable -> a -> a -> a)
    -> Dict.Dict comparable a
    -> Dict.Dict comparable a
    -> Dict.Dict comparable a
-}
unionWith :
    (Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression)
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
unionWith unionWithArg_ unionWithArg_0 unionWithArg_1 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Dict", "Extra" ]
             , name = "unionWith"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function
                              [ Type.var "comparable"
                              , Type.var "a"
                              , Type.var "a"
                              ]
                              (Type.var "a")
                          , Type.namedWith
                              [ "Dict" ]
                              "Dict"
                              [ Type.var "comparable", Type.var "a" ]
                          , Type.namedWith
                              [ "Dict" ]
                              "Dict"
                              [ Type.var "comparable", Type.var "a" ]
                          ]
                          (Type.namedWith
                               [ "Dict" ]
                               "Dict"
                               [ Type.var "comparable", Type.var "a" ]
                          )
                     )
             }
        )
        [ Elm.functionReduced
            "unionWithUnpack"
            (\functionReducedUnpack ->
               Elm.functionReduced
                   "unpack"
                   (\functionReducedUnpack0 ->
                        Elm.functionReduced
                            "unpack"
                            ((unionWithArg_ functionReducedUnpack)
                                 functionReducedUnpack0
                            )
                   )
            )
        , unionWithArg_0
        , unionWithArg_1
        ]


call_ :
    { groupBy : Elm.Expression -> Elm.Expression -> Elm.Expression
    , filterGroupBy : Elm.Expression -> Elm.Expression -> Elm.Expression
    , fromListBy : Elm.Expression -> Elm.Expression -> Elm.Expression
    , fromListCombining : Elm.Expression -> Elm.Expression -> Elm.Expression
    , fromListByCombining :
        Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
    , frequencies : Elm.Expression -> Elm.Expression
    , removeWhen : Elm.Expression -> Elm.Expression -> Elm.Expression
    , removeMany : Elm.Expression -> Elm.Expression -> Elm.Expression
    , keepOnly : Elm.Expression -> Elm.Expression -> Elm.Expression
    , insertCombining :
        Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
    , updateIfExists :
        Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
    , upsert :
        Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
    , invert : Elm.Expression -> Elm.Expression
    , invertAll : Elm.Expression -> Elm.Expression
    , mapKeys : Elm.Expression -> Elm.Expression -> Elm.Expression
    , filterMap : Elm.Expression -> Elm.Expression -> Elm.Expression
    , any : Elm.Expression -> Elm.Expression -> Elm.Expression
    , all : Elm.Expression -> Elm.Expression -> Elm.Expression
    , find : Elm.Expression -> Elm.Expression -> Elm.Expression
    , unionWith :
        Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
    }
call_ =
    { groupBy =
        \groupByArg_ groupByArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Dict", "Extra" ]
                     , name = "groupBy"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function
                                      [ Type.var "a" ]
                                      (Type.var "comparable")
                                  , Type.list (Type.var "a")
                                  ]
                                  (Type.namedWith
                                       [ "Dict" ]
                                       "Dict"
                                       [ Type.var "comparable"
                                       , Type.list (Type.var "a")
                                       ]
                                  )
                             )
                     }
                )
                [ groupByArg_, groupByArg_0 ]
    , filterGroupBy =
        \filterGroupByArg_ filterGroupByArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Dict", "Extra" ]
                     , name = "filterGroupBy"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function
                                      [ Type.var "a" ]
                                      (Type.maybe (Type.var "comparable"))
                                  , Type.list (Type.var "a")
                                  ]
                                  (Type.namedWith
                                       [ "Dict" ]
                                       "Dict"
                                       [ Type.var "comparable"
                                       , Type.list (Type.var "a")
                                       ]
                                  )
                             )
                     }
                )
                [ filterGroupByArg_, filterGroupByArg_0 ]
    , fromListBy =
        \fromListByArg_ fromListByArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Dict", "Extra" ]
                     , name = "fromListBy"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function
                                      [ Type.var "a" ]
                                      (Type.var "comparable")
                                  , Type.list (Type.var "a")
                                  ]
                                  (Type.namedWith
                                       [ "Dict" ]
                                       "Dict"
                                       [ Type.var "comparable", Type.var "a" ]
                                  )
                             )
                     }
                )
                [ fromListByArg_, fromListByArg_0 ]
    , fromListCombining =
        \fromListCombiningArg_ fromListCombiningArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Dict", "Extra" ]
                     , name = "fromListCombining"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function
                                      [ Type.var "a", Type.var "a" ]
                                      (Type.var "a")
                                  , Type.list
                                      (Type.tuple
                                         (Type.var "comparable")
                                         (Type.var "a")
                                      )
                                  ]
                                  (Type.namedWith
                                       [ "Dict" ]
                                       "Dict"
                                       [ Type.var "comparable", Type.var "a" ]
                                  )
                             )
                     }
                )
                [ fromListCombiningArg_, fromListCombiningArg_0 ]
    , fromListByCombining =
        \fromListByCombiningArg_ fromListByCombiningArg_0 fromListByCombiningArg_1 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Dict", "Extra" ]
                     , name = "fromListByCombining"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function
                                      [ Type.var "a", Type.var "a" ]
                                      (Type.var "a")
                                  , Type.function
                                      [ Type.var "a" ]
                                      (Type.var "comparable")
                                  , Type.list (Type.var "a")
                                  ]
                                  (Type.namedWith
                                       [ "Dict" ]
                                       "Dict"
                                       [ Type.var "comparable", Type.var "a" ]
                                  )
                             )
                     }
                )
                [ fromListByCombiningArg_
                , fromListByCombiningArg_0
                , fromListByCombiningArg_1
                ]
    , frequencies =
        \frequenciesArg_ ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Dict", "Extra" ]
                     , name = "frequencies"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.list (Type.var "comparable") ]
                                  (Type.namedWith
                                       [ "Dict" ]
                                       "Dict"
                                       [ Type.var "comparable", Type.int ]
                                  )
                             )
                     }
                )
                [ frequenciesArg_ ]
    , removeWhen =
        \removeWhenArg_ removeWhenArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Dict", "Extra" ]
                     , name = "removeWhen"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function
                                      [ Type.var "comparable", Type.var "v" ]
                                      Type.bool
                                  , Type.namedWith
                                      [ "Dict" ]
                                      "Dict"
                                      [ Type.var "comparable", Type.var "v" ]
                                  ]
                                  (Type.namedWith
                                       [ "Dict" ]
                                       "Dict"
                                       [ Type.var "comparable", Type.var "v" ]
                                  )
                             )
                     }
                )
                [ removeWhenArg_, removeWhenArg_0 ]
    , removeMany =
        \removeManyArg_ removeManyArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Dict", "Extra" ]
                     , name = "removeMany"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.namedWith
                                      [ "Set" ]
                                      "Set"
                                      [ Type.var "comparable" ]
                                  , Type.namedWith
                                      [ "Dict" ]
                                      "Dict"
                                      [ Type.var "comparable", Type.var "v" ]
                                  ]
                                  (Type.namedWith
                                       [ "Dict" ]
                                       "Dict"
                                       [ Type.var "comparable", Type.var "v" ]
                                  )
                             )
                     }
                )
                [ removeManyArg_, removeManyArg_0 ]
    , keepOnly =
        \keepOnlyArg_ keepOnlyArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Dict", "Extra" ]
                     , name = "keepOnly"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.namedWith
                                      [ "Set" ]
                                      "Set"
                                      [ Type.var "comparable" ]
                                  , Type.namedWith
                                      [ "Dict" ]
                                      "Dict"
                                      [ Type.var "comparable", Type.var "v" ]
                                  ]
                                  (Type.namedWith
                                       [ "Dict" ]
                                       "Dict"
                                       [ Type.var "comparable", Type.var "v" ]
                                  )
                             )
                     }
                )
                [ keepOnlyArg_, keepOnlyArg_0 ]
    , insertCombining =
        \insertCombiningArg_ insertCombiningArg_0 insertCombiningArg_1 insertCombiningArg_2 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Dict", "Extra" ]
                     , name = "insertCombining"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function
                                      [ Type.var "v", Type.var "v" ]
                                      (Type.var "v")
                                  , Type.var "comparable"
                                  , Type.var "v"
                                  , Type.namedWith
                                      [ "Dict" ]
                                      "Dict"
                                      [ Type.var "comparable", Type.var "v" ]
                                  ]
                                  (Type.namedWith
                                       [ "Dict" ]
                                       "Dict"
                                       [ Type.var "comparable", Type.var "v" ]
                                  )
                             )
                     }
                )
                [ insertCombiningArg_
                , insertCombiningArg_0
                , insertCombiningArg_1
                , insertCombiningArg_2
                ]
    , updateIfExists =
        \updateIfExistsArg_ updateIfExistsArg_0 updateIfExistsArg_1 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Dict", "Extra" ]
                     , name = "updateIfExists"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.var "comparable"
                                  , Type.function
                                      [ Type.var "a" ]
                                      (Type.var "a")
                                  , Type.namedWith
                                      [ "Dict" ]
                                      "Dict"
                                      [ Type.var "comparable", Type.var "a" ]
                                  ]
                                  (Type.namedWith
                                       [ "Dict" ]
                                       "Dict"
                                       [ Type.var "comparable", Type.var "a" ]
                                  )
                             )
                     }
                )
                [ updateIfExistsArg_, updateIfExistsArg_0, updateIfExistsArg_1 ]
    , upsert =
        \upsertArg_ upsertArg_0 upsertArg_1 upsertArg_2 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Dict", "Extra" ]
                     , name = "upsert"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.var "comparable"
                                  , Type.var "a"
                                  , Type.function
                                      [ Type.var "a" ]
                                      (Type.var "a")
                                  , Type.namedWith
                                      [ "Dict" ]
                                      "Dict"
                                      [ Type.var "comparable", Type.var "a" ]
                                  ]
                                  (Type.namedWith
                                       [ "Dict" ]
                                       "Dict"
                                       [ Type.var "comparable", Type.var "a" ]
                                  )
                             )
                     }
                )
                [ upsertArg_, upsertArg_0, upsertArg_1, upsertArg_2 ]
    , invert =
        \invertArg_ ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Dict", "Extra" ]
                     , name = "invert"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.namedWith
                                      [ "Dict" ]
                                      "Dict"
                                      [ Type.var "comparable1"
                                      , Type.var "comparable2"
                                      ]
                                  ]
                                  (Type.namedWith
                                       [ "Dict" ]
                                       "Dict"
                                       [ Type.var "comparable2"
                                       , Type.var "comparable1"
                                       ]
                                  )
                             )
                     }
                )
                [ invertArg_ ]
    , invertAll =
        \invertAllArg_ ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Dict", "Extra" ]
                     , name = "invertAll"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.namedWith
                                      [ "Dict" ]
                                      "Dict"
                                      [ Type.var "comparable1"
                                      , Type.var "comparable2"
                                      ]
                                  ]
                                  (Type.namedWith
                                       [ "Dict" ]
                                       "Dict"
                                       [ Type.var "comparable2"
                                       , Type.namedWith
                                           [ "Set" ]
                                           "Set"
                                           [ Type.var "comparable1" ]
                                       ]
                                  )
                             )
                     }
                )
                [ invertAllArg_ ]
    , mapKeys =
        \mapKeysArg_ mapKeysArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Dict", "Extra" ]
                     , name = "mapKeys"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function
                                      [ Type.var "comparable" ]
                                      (Type.var "comparable1")
                                  , Type.namedWith
                                      [ "Dict" ]
                                      "Dict"
                                      [ Type.var "comparable", Type.var "v" ]
                                  ]
                                  (Type.namedWith
                                       [ "Dict" ]
                                       "Dict"
                                       [ Type.var "comparable1", Type.var "v" ]
                                  )
                             )
                     }
                )
                [ mapKeysArg_, mapKeysArg_0 ]
    , filterMap =
        \filterMapArg_ filterMapArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Dict", "Extra" ]
                     , name = "filterMap"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function
                                      [ Type.var "comparable", Type.var "a" ]
                                      (Type.maybe (Type.var "b"))
                                  , Type.namedWith
                                      [ "Dict" ]
                                      "Dict"
                                      [ Type.var "comparable", Type.var "a" ]
                                  ]
                                  (Type.namedWith
                                       [ "Dict" ]
                                       "Dict"
                                       [ Type.var "comparable", Type.var "b" ]
                                  )
                             )
                     }
                )
                [ filterMapArg_, filterMapArg_0 ]
    , any =
        \anyArg_ anyArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Dict", "Extra" ]
                     , name = "any"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function
                                      [ Type.var "comparable", Type.var "a" ]
                                      Type.bool
                                  , Type.namedWith
                                      [ "Dict" ]
                                      "Dict"
                                      [ Type.var "comparable", Type.var "a" ]
                                  ]
                                  Type.bool
                             )
                     }
                )
                [ anyArg_, anyArg_0 ]
    , all =
        \allArg_ allArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Dict", "Extra" ]
                     , name = "all"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function
                                      [ Type.var "comparable", Type.var "a" ]
                                      Type.bool
                                  , Type.namedWith
                                      [ "Dict" ]
                                      "Dict"
                                      [ Type.var "comparable", Type.var "a" ]
                                  ]
                                  Type.bool
                             )
                     }
                )
                [ allArg_, allArg_0 ]
    , find =
        \findArg_ findArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Dict", "Extra" ]
                     , name = "find"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function
                                      [ Type.var "comparable", Type.var "a" ]
                                      Type.bool
                                  , Type.namedWith
                                      [ "Dict" ]
                                      "Dict"
                                      [ Type.var "comparable", Type.var "a" ]
                                  ]
                                  (Type.maybe
                                       (Type.tuple
                                            (Type.var "comparable")
                                            (Type.var "a")
                                       )
                                  )
                             )
                     }
                )
                [ findArg_, findArg_0 ]
    , unionWith =
        \unionWithArg_ unionWithArg_0 unionWithArg_1 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Dict", "Extra" ]
                     , name = "unionWith"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function
                                      [ Type.var "comparable"
                                      , Type.var "a"
                                      , Type.var "a"
                                      ]
                                      (Type.var "a")
                                  , Type.namedWith
                                      [ "Dict" ]
                                      "Dict"
                                      [ Type.var "comparable", Type.var "a" ]
                                  , Type.namedWith
                                      [ "Dict" ]
                                      "Dict"
                                      [ Type.var "comparable", Type.var "a" ]
                                  ]
                                  (Type.namedWith
                                       [ "Dict" ]
                                       "Dict"
                                       [ Type.var "comparable", Type.var "a" ]
                                  )
                             )
                     }
                )
                [ unionWithArg_, unionWithArg_0, unionWithArg_1 ]
    }


values_ :
    { groupBy : Elm.Expression
    , filterGroupBy : Elm.Expression
    , fromListBy : Elm.Expression
    , fromListCombining : Elm.Expression
    , fromListByCombining : Elm.Expression
    , frequencies : Elm.Expression
    , removeWhen : Elm.Expression
    , removeMany : Elm.Expression
    , keepOnly : Elm.Expression
    , insertCombining : Elm.Expression
    , updateIfExists : Elm.Expression
    , upsert : Elm.Expression
    , invert : Elm.Expression
    , invertAll : Elm.Expression
    , mapKeys : Elm.Expression
    , filterMap : Elm.Expression
    , any : Elm.Expression
    , all : Elm.Expression
    , find : Elm.Expression
    , unionWith : Elm.Expression
    }
values_ =
    { groupBy =
        Elm.value
            { importFrom = [ "Dict", "Extra" ]
            , name = "groupBy"
            , annotation =
                Just
                    (Type.function
                         [ Type.function
                             [ Type.var "a" ]
                             (Type.var "comparable")
                         , Type.list (Type.var "a")
                         ]
                         (Type.namedWith
                              [ "Dict" ]
                              "Dict"
                              [ Type.var "comparable"
                              , Type.list (Type.var "a")
                              ]
                         )
                    )
            }
    , filterGroupBy =
        Elm.value
            { importFrom = [ "Dict", "Extra" ]
            , name = "filterGroupBy"
            , annotation =
                Just
                    (Type.function
                         [ Type.function
                             [ Type.var "a" ]
                             (Type.maybe (Type.var "comparable"))
                         , Type.list (Type.var "a")
                         ]
                         (Type.namedWith
                              [ "Dict" ]
                              "Dict"
                              [ Type.var "comparable"
                              , Type.list (Type.var "a")
                              ]
                         )
                    )
            }
    , fromListBy =
        Elm.value
            { importFrom = [ "Dict", "Extra" ]
            , name = "fromListBy"
            , annotation =
                Just
                    (Type.function
                         [ Type.function
                             [ Type.var "a" ]
                             (Type.var "comparable")
                         , Type.list (Type.var "a")
                         ]
                         (Type.namedWith
                              [ "Dict" ]
                              "Dict"
                              [ Type.var "comparable", Type.var "a" ]
                         )
                    )
            }
    , fromListCombining =
        Elm.value
            { importFrom = [ "Dict", "Extra" ]
            , name = "fromListCombining"
            , annotation =
                Just
                    (Type.function
                         [ Type.function
                             [ Type.var "a", Type.var "a" ]
                             (Type.var "a")
                         , Type.list
                             (Type.tuple (Type.var "comparable") (Type.var "a"))
                         ]
                         (Type.namedWith
                              [ "Dict" ]
                              "Dict"
                              [ Type.var "comparable", Type.var "a" ]
                         )
                    )
            }
    , fromListByCombining =
        Elm.value
            { importFrom = [ "Dict", "Extra" ]
            , name = "fromListByCombining"
            , annotation =
                Just
                    (Type.function
                         [ Type.function
                             [ Type.var "a", Type.var "a" ]
                             (Type.var "a")
                         , Type.function
                             [ Type.var "a" ]
                             (Type.var "comparable")
                         , Type.list (Type.var "a")
                         ]
                         (Type.namedWith
                              [ "Dict" ]
                              "Dict"
                              [ Type.var "comparable", Type.var "a" ]
                         )
                    )
            }
    , frequencies =
        Elm.value
            { importFrom = [ "Dict", "Extra" ]
            , name = "frequencies"
            , annotation =
                Just
                    (Type.function
                         [ Type.list (Type.var "comparable") ]
                         (Type.namedWith
                              [ "Dict" ]
                              "Dict"
                              [ Type.var "comparable", Type.int ]
                         )
                    )
            }
    , removeWhen =
        Elm.value
            { importFrom = [ "Dict", "Extra" ]
            , name = "removeWhen"
            , annotation =
                Just
                    (Type.function
                         [ Type.function
                             [ Type.var "comparable", Type.var "v" ]
                             Type.bool
                         , Type.namedWith
                             [ "Dict" ]
                             "Dict"
                             [ Type.var "comparable", Type.var "v" ]
                         ]
                         (Type.namedWith
                              [ "Dict" ]
                              "Dict"
                              [ Type.var "comparable", Type.var "v" ]
                         )
                    )
            }
    , removeMany =
        Elm.value
            { importFrom = [ "Dict", "Extra" ]
            , name = "removeMany"
            , annotation =
                Just
                    (Type.function
                         [ Type.namedWith
                             [ "Set" ]
                             "Set"
                             [ Type.var "comparable" ]
                         , Type.namedWith
                             [ "Dict" ]
                             "Dict"
                             [ Type.var "comparable", Type.var "v" ]
                         ]
                         (Type.namedWith
                              [ "Dict" ]
                              "Dict"
                              [ Type.var "comparable", Type.var "v" ]
                         )
                    )
            }
    , keepOnly =
        Elm.value
            { importFrom = [ "Dict", "Extra" ]
            , name = "keepOnly"
            , annotation =
                Just
                    (Type.function
                         [ Type.namedWith
                             [ "Set" ]
                             "Set"
                             [ Type.var "comparable" ]
                         , Type.namedWith
                             [ "Dict" ]
                             "Dict"
                             [ Type.var "comparable", Type.var "v" ]
                         ]
                         (Type.namedWith
                              [ "Dict" ]
                              "Dict"
                              [ Type.var "comparable", Type.var "v" ]
                         )
                    )
            }
    , insertCombining =
        Elm.value
            { importFrom = [ "Dict", "Extra" ]
            , name = "insertCombining"
            , annotation =
                Just
                    (Type.function
                         [ Type.function
                             [ Type.var "v", Type.var "v" ]
                             (Type.var "v")
                         , Type.var "comparable"
                         , Type.var "v"
                         , Type.namedWith
                             [ "Dict" ]
                             "Dict"
                             [ Type.var "comparable", Type.var "v" ]
                         ]
                         (Type.namedWith
                              [ "Dict" ]
                              "Dict"
                              [ Type.var "comparable", Type.var "v" ]
                         )
                    )
            }
    , updateIfExists =
        Elm.value
            { importFrom = [ "Dict", "Extra" ]
            , name = "updateIfExists"
            , annotation =
                Just
                    (Type.function
                         [ Type.var "comparable"
                         , Type.function [ Type.var "a" ] (Type.var "a")
                         , Type.namedWith
                             [ "Dict" ]
                             "Dict"
                             [ Type.var "comparable", Type.var "a" ]
                         ]
                         (Type.namedWith
                              [ "Dict" ]
                              "Dict"
                              [ Type.var "comparable", Type.var "a" ]
                         )
                    )
            }
    , upsert =
        Elm.value
            { importFrom = [ "Dict", "Extra" ]
            , name = "upsert"
            , annotation =
                Just
                    (Type.function
                         [ Type.var "comparable"
                         , Type.var "a"
                         , Type.function [ Type.var "a" ] (Type.var "a")
                         , Type.namedWith
                             [ "Dict" ]
                             "Dict"
                             [ Type.var "comparable", Type.var "a" ]
                         ]
                         (Type.namedWith
                              [ "Dict" ]
                              "Dict"
                              [ Type.var "comparable", Type.var "a" ]
                         )
                    )
            }
    , invert =
        Elm.value
            { importFrom = [ "Dict", "Extra" ]
            , name = "invert"
            , annotation =
                Just
                    (Type.function
                         [ Type.namedWith
                             [ "Dict" ]
                             "Dict"
                             [ Type.var "comparable1", Type.var "comparable2" ]
                         ]
                         (Type.namedWith
                              [ "Dict" ]
                              "Dict"
                              [ Type.var "comparable2", Type.var "comparable1" ]
                         )
                    )
            }
    , invertAll =
        Elm.value
            { importFrom = [ "Dict", "Extra" ]
            , name = "invertAll"
            , annotation =
                Just
                    (Type.function
                         [ Type.namedWith
                             [ "Dict" ]
                             "Dict"
                             [ Type.var "comparable1", Type.var "comparable2" ]
                         ]
                         (Type.namedWith
                              [ "Dict" ]
                              "Dict"
                              [ Type.var "comparable2"
                              , Type.namedWith
                                  [ "Set" ]
                                  "Set"
                                  [ Type.var "comparable1" ]
                              ]
                         )
                    )
            }
    , mapKeys =
        Elm.value
            { importFrom = [ "Dict", "Extra" ]
            , name = "mapKeys"
            , annotation =
                Just
                    (Type.function
                         [ Type.function
                             [ Type.var "comparable" ]
                             (Type.var "comparable1")
                         , Type.namedWith
                             [ "Dict" ]
                             "Dict"
                             [ Type.var "comparable", Type.var "v" ]
                         ]
                         (Type.namedWith
                              [ "Dict" ]
                              "Dict"
                              [ Type.var "comparable1", Type.var "v" ]
                         )
                    )
            }
    , filterMap =
        Elm.value
            { importFrom = [ "Dict", "Extra" ]
            , name = "filterMap"
            , annotation =
                Just
                    (Type.function
                         [ Type.function
                             [ Type.var "comparable", Type.var "a" ]
                             (Type.maybe (Type.var "b"))
                         , Type.namedWith
                             [ "Dict" ]
                             "Dict"
                             [ Type.var "comparable", Type.var "a" ]
                         ]
                         (Type.namedWith
                              [ "Dict" ]
                              "Dict"
                              [ Type.var "comparable", Type.var "b" ]
                         )
                    )
            }
    , any =
        Elm.value
            { importFrom = [ "Dict", "Extra" ]
            , name = "any"
            , annotation =
                Just
                    (Type.function
                         [ Type.function
                             [ Type.var "comparable", Type.var "a" ]
                             Type.bool
                         , Type.namedWith
                             [ "Dict" ]
                             "Dict"
                             [ Type.var "comparable", Type.var "a" ]
                         ]
                         Type.bool
                    )
            }
    , all =
        Elm.value
            { importFrom = [ "Dict", "Extra" ]
            , name = "all"
            , annotation =
                Just
                    (Type.function
                         [ Type.function
                             [ Type.var "comparable", Type.var "a" ]
                             Type.bool
                         , Type.namedWith
                             [ "Dict" ]
                             "Dict"
                             [ Type.var "comparable", Type.var "a" ]
                         ]
                         Type.bool
                    )
            }
    , find =
        Elm.value
            { importFrom = [ "Dict", "Extra" ]
            , name = "find"
            , annotation =
                Just
                    (Type.function
                         [ Type.function
                             [ Type.var "comparable", Type.var "a" ]
                             Type.bool
                         , Type.namedWith
                             [ "Dict" ]
                             "Dict"
                             [ Type.var "comparable", Type.var "a" ]
                         ]
                         (Type.maybe
                              (Type.tuple (Type.var "comparable") (Type.var "a")
                              )
                         )
                    )
            }
    , unionWith =
        Elm.value
            { importFrom = [ "Dict", "Extra" ]
            , name = "unionWith"
            , annotation =
                Just
                    (Type.function
                         [ Type.function
                             [ Type.var "comparable"
                             , Type.var "a"
                             , Type.var "a"
                             ]
                             (Type.var "a")
                         , Type.namedWith
                             [ "Dict" ]
                             "Dict"
                             [ Type.var "comparable", Type.var "a" ]
                         , Type.namedWith
                             [ "Dict" ]
                             "Dict"
                             [ Type.var "comparable", Type.var "a" ]
                         ]
                         (Type.namedWith
                              [ "Dict" ]
                              "Dict"
                              [ Type.var "comparable", Type.var "a" ]
                         )
                    )
            }
    }