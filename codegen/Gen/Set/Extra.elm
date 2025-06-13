module Gen.Set.Extra exposing
    ( moduleName_, toggle, isSupersetOf, isSubsetOf, areDisjoint, any
    , all, symmetricDifference, concatMap, filterMap, call_, values_
    )

{-|
# Generated bindings for Set.Extra

@docs moduleName_, toggle, isSupersetOf, isSubsetOf, areDisjoint, any
@docs all, symmetricDifference, concatMap, filterMap, call_, values_
-}


import Elm
import Elm.Annotation as Type


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Set", "Extra" ]


{-| If the set does not contain the element, add it. If it does contain the element, remove it.

    import Set exposing (Set)

    Set.Extra.toggle 1 (Set.fromList [1,2,3])
    --> Set.fromList [2, 3]

    Set.Extra.toggle 1 (Set.fromList [2,3])
    --> Set.fromList [1, 2, 3]

toggle: comparable -> Set.Set comparable -> Set.Set comparable
-}
toggle : Elm.Expression -> Elm.Expression -> Elm.Expression
toggle toggleArg_ toggleArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Set", "Extra" ]
             , name = "toggle"
             , annotation =
                 Just
                     (Type.function
                          [ Type.var "comparable"
                          , Type.namedWith
                              [ "Set" ]
                              "Set"
                              [ Type.var "comparable" ]
                          ]
                          (Type.namedWith
                               [ "Set" ]
                               "Set"
                               [ Type.var "comparable" ]
                          )
                     )
             }
        )
        [ toggleArg_, toggleArg_0 ]


{-| A set is a superset of another set if all the elements in the second set appear in the first set.

    import Set exposing (Set)


    Set.fromList [ 1, 2, 3 ]
        |> Set.Extra.isSupersetOf (Set.fromList [1,2,3,4,5])
    --> False

Note: This is just isSubsetOf with arguments reversed. It can be handy for dealing with pipelines.

isSupersetOf: Set.Set comparable -> Set.Set comparable -> Bool
-}
isSupersetOf : Elm.Expression -> Elm.Expression -> Elm.Expression
isSupersetOf isSupersetOfArg_ isSupersetOfArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Set", "Extra" ]
             , name = "isSupersetOf"
             , annotation =
                 Just
                     (Type.function
                          [ Type.namedWith
                              [ "Set" ]
                              "Set"
                              [ Type.var "comparable" ]
                          , Type.namedWith
                              [ "Set" ]
                              "Set"
                              [ Type.var "comparable" ]
                          ]
                          Type.bool
                     )
             }
        )
        [ isSupersetOfArg_, isSupersetOfArg_0 ]


{-| A set is a subset of another set if all the elements in the first set appear in the second set.

    import Set exposing (Set)

    Set.fromList [ 1, 2, 3 ]
        |> Set.Extra.isSubsetOf (Set.fromList [1,2,3,4,5])
    --> True

isSubsetOf: Set.Set comparable -> Set.Set comparable -> Bool
-}
isSubsetOf : Elm.Expression -> Elm.Expression -> Elm.Expression
isSubsetOf isSubsetOfArg_ isSubsetOfArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Set", "Extra" ]
             , name = "isSubsetOf"
             , annotation =
                 Just
                     (Type.function
                          [ Type.namedWith
                              [ "Set" ]
                              "Set"
                              [ Type.var "comparable" ]
                          , Type.namedWith
                              [ "Set" ]
                              "Set"
                              [ Type.var "comparable" ]
                          ]
                          Type.bool
                     )
             }
        )
        [ isSubsetOfArg_, isSubsetOfArg_0 ]


{-| A set is disjoint from another set if they have no elements in common.

    import Set exposing (Set)

    Set.Extra.areDisjoint
        (Set.fromList [1,2,3])
        (Set.fromList [3,4,5])
    --> False

    Set.Extra.areDisjoint
        (Set.fromList [1,2,3])
        (Set.fromList [4,5,6])
    --> True

areDisjoint: Set.Set comparable -> Set.Set comparable -> Bool
-}
areDisjoint : Elm.Expression -> Elm.Expression -> Elm.Expression
areDisjoint areDisjointArg_ areDisjointArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Set", "Extra" ]
             , name = "areDisjoint"
             , annotation =
                 Just
                     (Type.function
                          [ Type.namedWith
                              [ "Set" ]
                              "Set"
                              [ Type.var "comparable" ]
                          , Type.namedWith
                              [ "Set" ]
                              "Set"
                              [ Type.var "comparable" ]
                          ]
                          Type.bool
                     )
             }
        )
        [ areDisjointArg_, areDisjointArg_0 ]


{-| Determine if any elements satisfy some test.

    import Set exposing (Set)

    Set.Extra.any (\n -> modBy 2 n == 0) (Set.fromList [ 2, 3 ])
    --> True

    Set.Extra.any (\n -> modBy 2 n == 0) (Set.fromList [ 1, 3 ])
    --> False

    Set.Extra.any (\n -> modBy 2 n == 0) Set.empty
    --> False

any: (a -> Bool) -> Set.Set a -> Bool
-}
any : (Elm.Expression -> Elm.Expression) -> Elm.Expression -> Elm.Expression
any anyArg_ anyArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Set", "Extra" ]
             , name = "any"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function [ Type.var "a" ] Type.bool
                          , Type.namedWith [ "Set" ] "Set" [ Type.var "a" ]
                          ]
                          Type.bool
                     )
             }
        )
        [ Elm.functionReduced "anyUnpack" anyArg_, anyArg_0 ]


{-| Determine if all elements satisfy some test.

    import Set exposing (Set)

    Set.Extra.all (\n -> modBy 2 n == 0) (Set.fromList [ 2, 4 ])
    --> True

    Set.Extra.all (\n -> modBy 2 n == 0) (Set.fromList [ 2, 3 ])
    --> False

    Set.Extra.all (\n -> modBy 2 n == 0) Set.empty
    --> True

all: (a -> Bool) -> Set.Set a -> Bool
-}
all : (Elm.Expression -> Elm.Expression) -> Elm.Expression -> Elm.Expression
all allArg_ allArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Set", "Extra" ]
             , name = "all"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function [ Type.var "a" ] Type.bool
                          , Type.namedWith [ "Set" ] "Set" [ Type.var "a" ]
                          ]
                          Type.bool
                     )
             }
        )
        [ Elm.functionReduced "allUnpack" allArg_, allArg_0 ]


{-| The symmetric difference between two sets is a set that contains all the elements that are in one of the two sets, but not both.

    import Set exposing (Set)


    Set.Extra.symmetricDifference
        (Set.fromList [1,2,3])
        (Set.fromList [3,4,5])
        --> Set.fromList [1,2,4,5]

symmetricDifference: Set.Set comparable -> Set.Set comparable -> Set.Set comparable
-}
symmetricDifference : Elm.Expression -> Elm.Expression -> Elm.Expression
symmetricDifference symmetricDifferenceArg_ symmetricDifferenceArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Set", "Extra" ]
             , name = "symmetricDifference"
             , annotation =
                 Just
                     (Type.function
                          [ Type.namedWith
                              [ "Set" ]
                              "Set"
                              [ Type.var "comparable" ]
                          , Type.namedWith
                              [ "Set" ]
                              "Set"
                              [ Type.var "comparable" ]
                          ]
                          (Type.namedWith
                               [ "Set" ]
                               "Set"
                               [ Type.var "comparable" ]
                          )
                     )
             }
        )
        [ symmetricDifferenceArg_, symmetricDifferenceArg_0 ]


{-| Map a given function onto a set and union the resulting set.

    import Set exposing (Set)

    neighbors : (Int, Int) -> Set (Int, Int)
    neighbors (x, y) =
        Set.fromList
            [ (x - 1, y - 1), (x, y - 1), (x + 1, y - 1)
            , (x - 1, y),                 (x + 1, y)
            , (x - 1, y + 1), (x, y + 1), (x + 1, y + 1)
            ]

    setOfPoints : Set (Int, Int)
    setOfPoints =
        Set.fromList [(1,1), (0,0)]

    Set.Extra.concatMap neighbors setOfPoints
    --> Set.fromList
    -->     [ (-1,-1), (-1,0), (-1,1)
    -->     , (0,-1), (0,0), (0,1)
    -->     , (0,2), (1,-1), (1,0)
    -->     , (1,1), (1,2), (2,0)
    -->     , (2,1), (2,2)
    -->     ]

concatMap: (comparable -> Set.Set comparable2) -> Set.Set comparable -> Set.Set comparable2
-}
concatMap :
    (Elm.Expression -> Elm.Expression) -> Elm.Expression -> Elm.Expression
concatMap concatMapArg_ concatMapArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Set", "Extra" ]
             , name = "concatMap"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function
                              [ Type.var "comparable" ]
                              (Type.namedWith
                                 [ "Set" ]
                                 "Set"
                                 [ Type.var "comparable2" ]
                              )
                          , Type.namedWith
                              [ "Set" ]
                              "Set"
                              [ Type.var "comparable" ]
                          ]
                          (Type.namedWith
                               [ "Set" ]
                               "Set"
                               [ Type.var "comparable2" ]
                          )
                     )
             }
        )
        [ Elm.functionReduced "concatMapUnpack" concatMapArg_, concatMapArg_0 ]


{-| Apply a function that may succeed to all values in the set, but only keep the successes.

    import Set exposing (Set)

    Set.fromList ["1", "2", "a", "3"]
        |> Set.Extra.filterMap String.toFloat
    --> Set.fromList [1, 2, 3]

filterMap: (comparable -> Maybe comparable2) -> Set.Set comparable -> Set.Set comparable2
-}
filterMap :
    (Elm.Expression -> Elm.Expression) -> Elm.Expression -> Elm.Expression
filterMap filterMapArg_ filterMapArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Set", "Extra" ]
             , name = "filterMap"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function
                              [ Type.var "comparable" ]
                              (Type.maybe (Type.var "comparable2"))
                          , Type.namedWith
                              [ "Set" ]
                              "Set"
                              [ Type.var "comparable" ]
                          ]
                          (Type.namedWith
                               [ "Set" ]
                               "Set"
                               [ Type.var "comparable2" ]
                          )
                     )
             }
        )
        [ Elm.functionReduced "filterMapUnpack" filterMapArg_, filterMapArg_0 ]


call_ :
    { toggle : Elm.Expression -> Elm.Expression -> Elm.Expression
    , isSupersetOf : Elm.Expression -> Elm.Expression -> Elm.Expression
    , isSubsetOf : Elm.Expression -> Elm.Expression -> Elm.Expression
    , areDisjoint : Elm.Expression -> Elm.Expression -> Elm.Expression
    , any : Elm.Expression -> Elm.Expression -> Elm.Expression
    , all : Elm.Expression -> Elm.Expression -> Elm.Expression
    , symmetricDifference : Elm.Expression -> Elm.Expression -> Elm.Expression
    , concatMap : Elm.Expression -> Elm.Expression -> Elm.Expression
    , filterMap : Elm.Expression -> Elm.Expression -> Elm.Expression
    }
call_ =
    { toggle =
        \toggleArg_ toggleArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Set", "Extra" ]
                     , name = "toggle"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.var "comparable"
                                  , Type.namedWith
                                      [ "Set" ]
                                      "Set"
                                      [ Type.var "comparable" ]
                                  ]
                                  (Type.namedWith
                                       [ "Set" ]
                                       "Set"
                                       [ Type.var "comparable" ]
                                  )
                             )
                     }
                )
                [ toggleArg_, toggleArg_0 ]
    , isSupersetOf =
        \isSupersetOfArg_ isSupersetOfArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Set", "Extra" ]
                     , name = "isSupersetOf"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.namedWith
                                      [ "Set" ]
                                      "Set"
                                      [ Type.var "comparable" ]
                                  , Type.namedWith
                                      [ "Set" ]
                                      "Set"
                                      [ Type.var "comparable" ]
                                  ]
                                  Type.bool
                             )
                     }
                )
                [ isSupersetOfArg_, isSupersetOfArg_0 ]
    , isSubsetOf =
        \isSubsetOfArg_ isSubsetOfArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Set", "Extra" ]
                     , name = "isSubsetOf"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.namedWith
                                      [ "Set" ]
                                      "Set"
                                      [ Type.var "comparable" ]
                                  , Type.namedWith
                                      [ "Set" ]
                                      "Set"
                                      [ Type.var "comparable" ]
                                  ]
                                  Type.bool
                             )
                     }
                )
                [ isSubsetOfArg_, isSubsetOfArg_0 ]
    , areDisjoint =
        \areDisjointArg_ areDisjointArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Set", "Extra" ]
                     , name = "areDisjoint"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.namedWith
                                      [ "Set" ]
                                      "Set"
                                      [ Type.var "comparable" ]
                                  , Type.namedWith
                                      [ "Set" ]
                                      "Set"
                                      [ Type.var "comparable" ]
                                  ]
                                  Type.bool
                             )
                     }
                )
                [ areDisjointArg_, areDisjointArg_0 ]
    , any =
        \anyArg_ anyArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Set", "Extra" ]
                     , name = "any"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function [ Type.var "a" ] Type.bool
                                  , Type.namedWith
                                      [ "Set" ]
                                      "Set"
                                      [ Type.var "a" ]
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
                     { importFrom = [ "Set", "Extra" ]
                     , name = "all"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function [ Type.var "a" ] Type.bool
                                  , Type.namedWith
                                      [ "Set" ]
                                      "Set"
                                      [ Type.var "a" ]
                                  ]
                                  Type.bool
                             )
                     }
                )
                [ allArg_, allArg_0 ]
    , symmetricDifference =
        \symmetricDifferenceArg_ symmetricDifferenceArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Set", "Extra" ]
                     , name = "symmetricDifference"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.namedWith
                                      [ "Set" ]
                                      "Set"
                                      [ Type.var "comparable" ]
                                  , Type.namedWith
                                      [ "Set" ]
                                      "Set"
                                      [ Type.var "comparable" ]
                                  ]
                                  (Type.namedWith
                                       [ "Set" ]
                                       "Set"
                                       [ Type.var "comparable" ]
                                  )
                             )
                     }
                )
                [ symmetricDifferenceArg_, symmetricDifferenceArg_0 ]
    , concatMap =
        \concatMapArg_ concatMapArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Set", "Extra" ]
                     , name = "concatMap"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function
                                      [ Type.var "comparable" ]
                                      (Type.namedWith
                                         [ "Set" ]
                                         "Set"
                                         [ Type.var "comparable2" ]
                                      )
                                  , Type.namedWith
                                      [ "Set" ]
                                      "Set"
                                      [ Type.var "comparable" ]
                                  ]
                                  (Type.namedWith
                                       [ "Set" ]
                                       "Set"
                                       [ Type.var "comparable2" ]
                                  )
                             )
                     }
                )
                [ concatMapArg_, concatMapArg_0 ]
    , filterMap =
        \filterMapArg_ filterMapArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Set", "Extra" ]
                     , name = "filterMap"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function
                                      [ Type.var "comparable" ]
                                      (Type.maybe (Type.var "comparable2"))
                                  , Type.namedWith
                                      [ "Set" ]
                                      "Set"
                                      [ Type.var "comparable" ]
                                  ]
                                  (Type.namedWith
                                       [ "Set" ]
                                       "Set"
                                       [ Type.var "comparable2" ]
                                  )
                             )
                     }
                )
                [ filterMapArg_, filterMapArg_0 ]
    }


values_ :
    { toggle : Elm.Expression
    , isSupersetOf : Elm.Expression
    , isSubsetOf : Elm.Expression
    , areDisjoint : Elm.Expression
    , any : Elm.Expression
    , all : Elm.Expression
    , symmetricDifference : Elm.Expression
    , concatMap : Elm.Expression
    , filterMap : Elm.Expression
    }
values_ =
    { toggle =
        Elm.value
            { importFrom = [ "Set", "Extra" ]
            , name = "toggle"
            , annotation =
                Just
                    (Type.function
                         [ Type.var "comparable"
                         , Type.namedWith
                             [ "Set" ]
                             "Set"
                             [ Type.var "comparable" ]
                         ]
                         (Type.namedWith
                              [ "Set" ]
                              "Set"
                              [ Type.var "comparable" ]
                         )
                    )
            }
    , isSupersetOf =
        Elm.value
            { importFrom = [ "Set", "Extra" ]
            , name = "isSupersetOf"
            , annotation =
                Just
                    (Type.function
                         [ Type.namedWith
                             [ "Set" ]
                             "Set"
                             [ Type.var "comparable" ]
                         , Type.namedWith
                             [ "Set" ]
                             "Set"
                             [ Type.var "comparable" ]
                         ]
                         Type.bool
                    )
            }
    , isSubsetOf =
        Elm.value
            { importFrom = [ "Set", "Extra" ]
            , name = "isSubsetOf"
            , annotation =
                Just
                    (Type.function
                         [ Type.namedWith
                             [ "Set" ]
                             "Set"
                             [ Type.var "comparable" ]
                         , Type.namedWith
                             [ "Set" ]
                             "Set"
                             [ Type.var "comparable" ]
                         ]
                         Type.bool
                    )
            }
    , areDisjoint =
        Elm.value
            { importFrom = [ "Set", "Extra" ]
            , name = "areDisjoint"
            , annotation =
                Just
                    (Type.function
                         [ Type.namedWith
                             [ "Set" ]
                             "Set"
                             [ Type.var "comparable" ]
                         , Type.namedWith
                             [ "Set" ]
                             "Set"
                             [ Type.var "comparable" ]
                         ]
                         Type.bool
                    )
            }
    , any =
        Elm.value
            { importFrom = [ "Set", "Extra" ]
            , name = "any"
            , annotation =
                Just
                    (Type.function
                         [ Type.function [ Type.var "a" ] Type.bool
                         , Type.namedWith [ "Set" ] "Set" [ Type.var "a" ]
                         ]
                         Type.bool
                    )
            }
    , all =
        Elm.value
            { importFrom = [ "Set", "Extra" ]
            , name = "all"
            , annotation =
                Just
                    (Type.function
                         [ Type.function [ Type.var "a" ] Type.bool
                         , Type.namedWith [ "Set" ] "Set" [ Type.var "a" ]
                         ]
                         Type.bool
                    )
            }
    , symmetricDifference =
        Elm.value
            { importFrom = [ "Set", "Extra" ]
            , name = "symmetricDifference"
            , annotation =
                Just
                    (Type.function
                         [ Type.namedWith
                             [ "Set" ]
                             "Set"
                             [ Type.var "comparable" ]
                         , Type.namedWith
                             [ "Set" ]
                             "Set"
                             [ Type.var "comparable" ]
                         ]
                         (Type.namedWith
                              [ "Set" ]
                              "Set"
                              [ Type.var "comparable" ]
                         )
                    )
            }
    , concatMap =
        Elm.value
            { importFrom = [ "Set", "Extra" ]
            , name = "concatMap"
            , annotation =
                Just
                    (Type.function
                         [ Type.function
                             [ Type.var "comparable" ]
                             (Type.namedWith
                                [ "Set" ]
                                "Set"
                                [ Type.var "comparable2" ]
                             )
                         , Type.namedWith
                             [ "Set" ]
                             "Set"
                             [ Type.var "comparable" ]
                         ]
                         (Type.namedWith
                              [ "Set" ]
                              "Set"
                              [ Type.var "comparable2" ]
                         )
                    )
            }
    , filterMap =
        Elm.value
            { importFrom = [ "Set", "Extra" ]
            , name = "filterMap"
            , annotation =
                Just
                    (Type.function
                         [ Type.function
                             [ Type.var "comparable" ]
                             (Type.maybe (Type.var "comparable2"))
                         , Type.namedWith
                             [ "Set" ]
                             "Set"
                             [ Type.var "comparable" ]
                         ]
                         (Type.namedWith
                              [ "Set" ]
                              "Set"
                              [ Type.var "comparable2" ]
                         )
                    )
            }
    }