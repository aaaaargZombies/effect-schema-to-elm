module Gen.Order.Extra exposing
    ( moduleName_, explicit, byField, byFieldWith, byRank, ifStillTiedThen
    , breakTies, breakTiesWith, reverse, natural, nothingLast, nothingFirst, isOrdered
    , greaterThanBy, lessThanBy, call_, values_
    )

{-|
# Generated bindings for Order.Extra

@docs moduleName_, explicit, byField, byFieldWith, byRank, ifStillTiedThen
@docs breakTies, breakTiesWith, reverse, natural, nothingLast, nothingFirst
@docs isOrdered, greaterThanBy, lessThanBy, call_, values_
-}


import Elm
import Elm.Annotation as Type


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Order", "Extra" ]


{-| Creates an ordering that orders items in the order given in the input list.
Items that are not part of the input list are all considered to be equal to each
other and less than anything in the list.

    type Day
        = Mon
        | Tue
        | Wed
        | Thu
        | Fri
        | Sat
        | Sun

    dayOrdering : Day -> Day -> Order
    dayOrdering =
        Order.Extra.explicit
            [ Mon, Tue, Wed, Thu, Fri, Sat, Sun ]

explicit: List a -> a -> a -> Basics.Order
-}
explicit :
    List Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
explicit explicitArg_ explicitArg_0 explicitArg_1 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Order", "Extra" ]
             , name = "explicit"
             , annotation =
                 Just
                     (Type.function
                          [ Type.list (Type.var "a")
                          , Type.var "a"
                          , Type.var "a"
                          ]
                          (Type.namedWith [ "Basics" ] "Order" [])
                     )
             }
        )
        [ Elm.list explicitArg_, explicitArg_0, explicitArg_1 ]


{-| Produces an ordering that orders its elements using the natural ordering of the
field selected by the given function.

    type alias Point = { x : Int, y : Int }

    List.sortWith (Order.Extra.byField .x) [Point 3 5, Point 1 6]
        --> [Point 1 6, Point 3 5]
    List.sortWith (Order.Extra.byField .y) [Point 3 5, Point 1 6]
        --> [Point 3 5, Point 1 6]

byField: (a -> comparable) -> a -> a -> Basics.Order
-}
byField :
    (Elm.Expression -> Elm.Expression)
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
byField byFieldArg_ byFieldArg_0 byFieldArg_1 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Order", "Extra" ]
             , name = "byField"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function
                              [ Type.var "a" ]
                              (Type.var "comparable")
                          , Type.var "a"
                          , Type.var "a"
                          ]
                          (Type.namedWith [ "Basics" ] "Order" [])
                     )
             }
        )
        [ Elm.functionReduced "byFieldUnpack" byFieldArg_
        , byFieldArg_0
        , byFieldArg_1
        ]


{-| Produces an ordering that orders its elements using the given ordering on the
field selected by the given function.

    cards : List Card
    cards =
        [ Card King Hearts, Card King Hearts ]

    List.sortWith
        (Order.Extra.byFieldWith valueOrdering .value)
        cards
        == [ Card Two Spades,  Card King Hearts]

    List.sortWith
        (Order.Extra.byFieldWith suiteOrdering .suite)
        cards
        == [ Card King Hearts, Card Two Spades ]

byFieldWith: (b -> b -> Basics.Order) -> (a -> b) -> a -> a -> Basics.Order
-}
byFieldWith :
    (Elm.Expression -> Elm.Expression -> Elm.Expression)
    -> (Elm.Expression -> Elm.Expression)
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
byFieldWith byFieldWithArg_ byFieldWithArg_0 byFieldWithArg_1 byFieldWithArg_2 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Order", "Extra" ]
             , name = "byFieldWith"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function
                              [ Type.var "b", Type.var "b" ]
                              (Type.namedWith [ "Basics" ] "Order" [])
                          , Type.function [ Type.var "a" ] (Type.var "b")
                          , Type.var "a"
                          , Type.var "a"
                          ]
                          (Type.namedWith [ "Basics" ] "Order" [])
                     )
             }
        )
        [ Elm.functionReduced
            "byFieldWithUnpack"
            (\functionReducedUnpack ->
               Elm.functionReduced
                   "unpack"
                   (byFieldWithArg_ functionReducedUnpack)
            )
        , Elm.functionReduced "byFieldWithUnpack" byFieldWithArg_0
        , byFieldWithArg_1
        , byFieldWithArg_2
        ]


{-| Produces an ordering defined by an explicit ranking function combined with a
secondary ordering function to compare elements within the same rank. The rule is
that all items are sorted first by rank, and then using the given within-rank
ordering for items of the same rank.

This function is intended for use with types that have multiple cases where
constructors for some or all of the cases take arguments. (Otherwise use `Ordering.explicit`
instead which has a simpler interface.) For instance, to make an ordering for
a type such as:

    type JokerCard
        = NormalCard Value Suite
        | Joker

you could use `byRank` to sort all the normal cards before the jokers like so:

    jokerCardOrdering : JokerCard -> JokerCard -> Order
    jokerCardOrdering =
        Order.Extra.byRank
            (\card ->
                case card of
                    NormalCard _ _ ->
                        1

                    Joker ->
                        2
            )
            (\x y ->
                case ( x, y ) of
                    ( NormalCard v1 s1, NormalCard v2 s2 ) ->
                        suiteOrdering s1 s2
                            |> Order.Extra.ifStillTiedThen
                                (valueOrdering v1 v2)

                    _ ->
                        EQ
            )

More generally, the expected pattern is that for each case in your type, you assign
that case to a unique rank with the ranking function. Then for your within-rank
ordering, you have a case statement that enumerates all the "tie" states and
specifies how to break ties, and then uses a catch-all case that returns
`Ordering.noConflicts` to specify that all remaining cases cannot give rise to
the need to do any subcomparisons. (This can be either because the values being
compared have no internal structure and so are always equal, or because they are
constructors with different ranks and so will never be compared by this function.)

byRank: (a -> Int) -> (a -> a -> Basics.Order) -> a -> a -> Basics.Order
-}
byRank :
    (Elm.Expression -> Elm.Expression)
    -> (Elm.Expression -> Elm.Expression -> Elm.Expression)
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
byRank byRankArg_ byRankArg_0 byRankArg_1 byRankArg_2 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Order", "Extra" ]
             , name = "byRank"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function [ Type.var "a" ] Type.int
                          , Type.function
                              [ Type.var "a", Type.var "a" ]
                              (Type.namedWith [ "Basics" ] "Order" [])
                          , Type.var "a"
                          , Type.var "a"
                          ]
                          (Type.namedWith [ "Basics" ] "Order" [])
                     )
             }
        )
        [ Elm.functionReduced "byRankUnpack" byRankArg_
        , Elm.functionReduced
            "byRankUnpack"
            (\functionReducedUnpack ->
               Elm.functionReduced "unpack" (byRankArg_0 functionReducedUnpack)
            )
        , byRankArg_1
        , byRankArg_2
        ]


{-| Returns the main order unless it is `EQ`, in which case returns the tiebreaker.

This function does for `Order`s what `breakTiesWith` does for `Ordering`s. It is
useful in cases where you want to perform a cascading comparison of multiple pairs
of values that are not wrapped in a container value, as happens when examining the
individual fields of a constructor.

ifStillTiedThen: Basics.Order -> Basics.Order -> Basics.Order
-}
ifStillTiedThen : Elm.Expression -> Elm.Expression -> Elm.Expression
ifStillTiedThen ifStillTiedThenArg_ ifStillTiedThenArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Order", "Extra" ]
             , name = "ifStillTiedThen"
             , annotation =
                 Just
                     (Type.function
                          [ Type.namedWith [ "Basics" ] "Order" []
                          , Type.namedWith [ "Basics" ] "Order" []
                          ]
                          (Type.namedWith [ "Basics" ] "Order" [])
                     )
             }
        )
        [ ifStillTiedThenArg_, ifStillTiedThenArg_0 ]


{-| Create an ordering function that can be used to sort
lists by multiple dimensions, by flattening multiple ordering functions into one.

This is equivalent to `ORDER BY` in SQL. The ordering function will order
its inputs based on the order that they appear in the `List (a -> a -> Order)` argument.

    type alias Pen =
        { model : String
        , tipWidthInMillimeters : Float
        }

    pens : List Pen
    pens =
        [ Pen "Pilot Hi-Tec-C Gel" 0.4
        , Pen "Morning Glory Pro Mach" 0.38
        , Pen "Pilot Hi-Tec-C Coleto" 0.5
        ]

    order : Pen -> Pen -> Order
    order =
        breakTies [ byField .tipWidthInMillimeters, byField .model ]

    List.sortWith order pens
    --> [ Pen "Morning Glory Pro Mach" 0.38
    --> , Pen "Pilot Hi-Tec-C Gel" 0.4
    --> , Pen "Pilot Hi-Tec-C Coleto" 0.5
    --> ]

If our `Pen` type alias above was represented a row in a database table, our `order` function as defined above would be equivalent
to this SQL clause:

    ORDER BY tipWidthInMillimeters, model

breakTies: List (a -> a -> Basics.Order) -> a -> a -> Basics.Order
-}
breakTies :
    List Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
breakTies breakTiesArg_ breakTiesArg_0 breakTiesArg_1 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Order", "Extra" ]
             , name = "breakTies"
             , annotation =
                 Just
                     (Type.function
                          [ Type.list
                              (Type.function
                                 [ Type.var "a", Type.var "a" ]
                                 (Type.namedWith [ "Basics" ] "Order" [])
                              )
                          , Type.var "a"
                          , Type.var "a"
                          ]
                          (Type.namedWith [ "Basics" ] "Order" [])
                     )
             }
        )
        [ Elm.list breakTiesArg_, breakTiesArg_0, breakTiesArg_1 ]


{-| Produces an ordering that refines the second input ordering by using the first
a -> a -> Orders a tie breaker. (Note that the second argument is the primary sort, and
the first argument is a tie breaker. This argument ordering is intended to support
function chaining with `|>`.)

    type alias Point =
        { x : Int, y : Int }

    pointOrdering : Point -> Point -> Order
    pointOrdering =
        Order.Extra.byField .x
            |> Order.Extra.breakTiesWith (Order.Extra.byField .y)

breakTiesWith: (a -> a -> Basics.Order) -> (a -> a -> Basics.Order) -> a -> a -> Basics.Order
-}
breakTiesWith :
    (Elm.Expression -> Elm.Expression -> Elm.Expression)
    -> (Elm.Expression -> Elm.Expression -> Elm.Expression)
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
breakTiesWith breakTiesWithArg_ breakTiesWithArg_0 breakTiesWithArg_1 breakTiesWithArg_2 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Order", "Extra" ]
             , name = "breakTiesWith"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function
                              [ Type.var "a", Type.var "a" ]
                              (Type.namedWith [ "Basics" ] "Order" [])
                          , Type.function
                              [ Type.var "a", Type.var "a" ]
                              (Type.namedWith [ "Basics" ] "Order" [])
                          , Type.var "a"
                          , Type.var "a"
                          ]
                          (Type.namedWith [ "Basics" ] "Order" [])
                     )
             }
        )
        [ Elm.functionReduced
            "breakTiesWithUnpack"
            (\functionReducedUnpack ->
               Elm.functionReduced
                   "unpack"
                   (breakTiesWithArg_ functionReducedUnpack)
            )
        , Elm.functionReduced
            "breakTiesWithUnpack"
            (\functionReducedUnpack ->
               Elm.functionReduced
                   "unpack"
                   (breakTiesWithArg_0 functionReducedUnpack)
            )
        , breakTiesWithArg_1
        , breakTiesWithArg_2
        ]


{-| Returns an ordering that reverses the input ordering.

    List.sortWith
        (Order.Extra.reverse compare)
        [ 1, 2, 3, 4, 5 ]
        --> [ 5, 4, 3, 2, 1 ]

reverse: (a -> a -> Basics.Order) -> a -> a -> Basics.Order
-}
reverse :
    (Elm.Expression -> Elm.Expression -> Elm.Expression)
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
reverse reverseArg_ reverseArg_0 reverseArg_1 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Order", "Extra" ]
             , name = "reverse"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function
                              [ Type.var "a", Type.var "a" ]
                              (Type.namedWith [ "Basics" ] "Order" [])
                          , Type.var "a"
                          , Type.var "a"
                          ]
                          (Type.namedWith [ "Basics" ] "Order" [])
                     )
             }
        )
        [ Elm.functionReduced
            "reverseUnpack"
            (\functionReducedUnpack ->
               Elm.functionReduced "unpack" (reverseArg_ functionReducedUnpack)
            )
        , reverseArg_0
        , reverseArg_1
        ]


{-| Compare two strings naturally.

    List.sortWith Order.Extra.natural ["a10", "a2"]
    --> ["a2", "a10"]

Without full I18n support, this is probably the best way to sort
user provided strings in a way that is intuitive to humans.

natural: String -> String -> Basics.Order
-}
natural : String -> String -> Elm.Expression
natural naturalArg_ naturalArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Order", "Extra" ]
             , name = "natural"
             , annotation =
                 Just
                     (Type.function
                          [ Type.string, Type.string ]
                          (Type.namedWith [ "Basics" ] "Order" [])
                     )
             }
        )
        [ Elm.string naturalArg_, Elm.string naturalArg_0 ]


{-| Returns an ordering that treats `Nothing` as greater than `Just a`.

    [ Just 1, Nothing, Just 2 ]
        |> List.sortWith (Order.Extra.nothingLast compare)
        --> [ Just 1, Just 2, Nothing ]

nothingLast: (a -> a -> Basics.Order) -> Maybe a -> Maybe a -> Basics.Order
-}
nothingLast :
    (Elm.Expression -> Elm.Expression -> Elm.Expression)
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
nothingLast nothingLastArg_ nothingLastArg_0 nothingLastArg_1 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Order", "Extra" ]
             , name = "nothingLast"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function
                              [ Type.var "a", Type.var "a" ]
                              (Type.namedWith [ "Basics" ] "Order" [])
                          , Type.maybe (Type.var "a")
                          , Type.maybe (Type.var "a")
                          ]
                          (Type.namedWith [ "Basics" ] "Order" [])
                     )
             }
        )
        [ Elm.functionReduced
            "nothingLastUnpack"
            (\functionReducedUnpack ->
               Elm.functionReduced
                   "unpack"
                   (nothingLastArg_ functionReducedUnpack)
            )
        , nothingLastArg_0
        , nothingLastArg_1
        ]


{-| Returns an ordering that treats `Nothing` as less than `Just a`.

    [ Just 1, Nothing, Just 2 ]
        |> List.sortWith (Order.Extra.nothingFirst compare)
        --> [ Nothing, Just 1, Just 2 ]

nothingFirst: (a -> a -> Basics.Order) -> Maybe a -> Maybe a -> Basics.Order
-}
nothingFirst :
    (Elm.Expression -> Elm.Expression -> Elm.Expression)
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
nothingFirst nothingFirstArg_ nothingFirstArg_0 nothingFirstArg_1 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Order", "Extra" ]
             , name = "nothingFirst"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function
                              [ Type.var "a", Type.var "a" ]
                              (Type.namedWith [ "Basics" ] "Order" [])
                          , Type.maybe (Type.var "a")
                          , Type.maybe (Type.var "a")
                          ]
                          (Type.namedWith [ "Basics" ] "Order" [])
                     )
             }
        )
        [ Elm.functionReduced
            "nothingFirstUnpack"
            (\functionReducedUnpack ->
               Elm.functionReduced
                   "unpack"
                   (nothingFirstArg_ functionReducedUnpack)
            )
        , nothingFirstArg_0
        , nothingFirstArg_1
        ]


{-| Determines if the given list is ordered according to the given ordering.

    Order.Extra.isOrdered compare [ 1, 2, 3 ]
        --> True

    Order.Extra.isOrdered compare [ 2, 1, 3 ]
        --> False

    Order.Extra.isOrdered compare []
        --> True

    Order.Extra.isOrdered
        (Order.Extra.reverse compare)
        [ 1, 2, 3 ]
        --> False

isOrdered: (a -> a -> Basics.Order) -> List a -> Bool
-}
isOrdered :
    (Elm.Expression -> Elm.Expression -> Elm.Expression)
    -> List Elm.Expression
    -> Elm.Expression
isOrdered isOrderedArg_ isOrderedArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Order", "Extra" ]
             , name = "isOrdered"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function
                              [ Type.var "a", Type.var "a" ]
                              (Type.namedWith [ "Basics" ] "Order" [])
                          , Type.list (Type.var "a")
                          ]
                          Type.bool
                     )
             }
        )
        [ Elm.functionReduced
            "isOrderedUnpack"
            (\functionReducedUnpack ->
               Elm.functionReduced
                   "unpack"
                   (isOrderedArg_ functionReducedUnpack)
            )
        , Elm.list isOrderedArg_0
        ]


{-| Determines if one value is greater than another according to the given ordering.

    greaterThanBy
        xThenYOrdering
        { x = 7, y = 8 }
        { x = 10, y = 2 }
        == False

    greaterThanBy
        yThenXOrdering
        { x = 7, y = 8 }
        { x = 10, y = 2 }
        == True

greaterThanBy: (a -> a -> Basics.Order) -> a -> a -> Bool
-}
greaterThanBy :
    (Elm.Expression -> Elm.Expression -> Elm.Expression)
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
greaterThanBy greaterThanByArg_ greaterThanByArg_0 greaterThanByArg_1 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Order", "Extra" ]
             , name = "greaterThanBy"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function
                              [ Type.var "a", Type.var "a" ]
                              (Type.namedWith [ "Basics" ] "Order" [])
                          , Type.var "a"
                          , Type.var "a"
                          ]
                          Type.bool
                     )
             }
        )
        [ Elm.functionReduced
            "greaterThanByUnpack"
            (\functionReducedUnpack ->
               Elm.functionReduced
                   "unpack"
                   (greaterThanByArg_ functionReducedUnpack)
            )
        , greaterThanByArg_0
        , greaterThanByArg_1
        ]


{-| Determines if one value is less than another according to the given ordering.

    lessThanBy
        xThenYOrdering
        { x = 7, y = 8 }
        { x = 10, y = 2 }
        == True

    lessThanBy
        yThenXOrdering
        { x = 7, y = 8 }
        { x = 10, y = 2 }
        == False

lessThanBy: (a -> a -> Basics.Order) -> a -> a -> Bool
-}
lessThanBy :
    (Elm.Expression -> Elm.Expression -> Elm.Expression)
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
lessThanBy lessThanByArg_ lessThanByArg_0 lessThanByArg_1 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Order", "Extra" ]
             , name = "lessThanBy"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function
                              [ Type.var "a", Type.var "a" ]
                              (Type.namedWith [ "Basics" ] "Order" [])
                          , Type.var "a"
                          , Type.var "a"
                          ]
                          Type.bool
                     )
             }
        )
        [ Elm.functionReduced
            "lessThanByUnpack"
            (\functionReducedUnpack ->
               Elm.functionReduced
                   "unpack"
                   (lessThanByArg_ functionReducedUnpack)
            )
        , lessThanByArg_0
        , lessThanByArg_1
        ]


call_ :
    { explicit :
        Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
    , byField :
        Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
    , byFieldWith :
        Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
    , byRank :
        Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
    , ifStillTiedThen : Elm.Expression -> Elm.Expression -> Elm.Expression
    , breakTies :
        Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
    , breakTiesWith :
        Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
    , reverse :
        Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
    , natural : Elm.Expression -> Elm.Expression -> Elm.Expression
    , nothingLast :
        Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
    , nothingFirst :
        Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
    , isOrdered : Elm.Expression -> Elm.Expression -> Elm.Expression
    , greaterThanBy :
        Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
    , lessThanBy :
        Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
    }
call_ =
    { explicit =
        \explicitArg_ explicitArg_0 explicitArg_1 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Order", "Extra" ]
                     , name = "explicit"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.list (Type.var "a")
                                  , Type.var "a"
                                  , Type.var "a"
                                  ]
                                  (Type.namedWith [ "Basics" ] "Order" [])
                             )
                     }
                )
                [ explicitArg_, explicitArg_0, explicitArg_1 ]
    , byField =
        \byFieldArg_ byFieldArg_0 byFieldArg_1 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Order", "Extra" ]
                     , name = "byField"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function
                                      [ Type.var "a" ]
                                      (Type.var "comparable")
                                  , Type.var "a"
                                  , Type.var "a"
                                  ]
                                  (Type.namedWith [ "Basics" ] "Order" [])
                             )
                     }
                )
                [ byFieldArg_, byFieldArg_0, byFieldArg_1 ]
    , byFieldWith =
        \byFieldWithArg_ byFieldWithArg_0 byFieldWithArg_1 byFieldWithArg_2 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Order", "Extra" ]
                     , name = "byFieldWith"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function
                                      [ Type.var "b", Type.var "b" ]
                                      (Type.namedWith [ "Basics" ] "Order" [])
                                  , Type.function
                                      [ Type.var "a" ]
                                      (Type.var "b")
                                  , Type.var "a"
                                  , Type.var "a"
                                  ]
                                  (Type.namedWith [ "Basics" ] "Order" [])
                             )
                     }
                )
                [ byFieldWithArg_
                , byFieldWithArg_0
                , byFieldWithArg_1
                , byFieldWithArg_2
                ]
    , byRank =
        \byRankArg_ byRankArg_0 byRankArg_1 byRankArg_2 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Order", "Extra" ]
                     , name = "byRank"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function [ Type.var "a" ] Type.int
                                  , Type.function
                                      [ Type.var "a", Type.var "a" ]
                                      (Type.namedWith [ "Basics" ] "Order" [])
                                  , Type.var "a"
                                  , Type.var "a"
                                  ]
                                  (Type.namedWith [ "Basics" ] "Order" [])
                             )
                     }
                )
                [ byRankArg_, byRankArg_0, byRankArg_1, byRankArg_2 ]
    , ifStillTiedThen =
        \ifStillTiedThenArg_ ifStillTiedThenArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Order", "Extra" ]
                     , name = "ifStillTiedThen"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.namedWith [ "Basics" ] "Order" []
                                  , Type.namedWith [ "Basics" ] "Order" []
                                  ]
                                  (Type.namedWith [ "Basics" ] "Order" [])
                             )
                     }
                )
                [ ifStillTiedThenArg_, ifStillTiedThenArg_0 ]
    , breakTies =
        \breakTiesArg_ breakTiesArg_0 breakTiesArg_1 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Order", "Extra" ]
                     , name = "breakTies"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.list
                                      (Type.function
                                         [ Type.var "a", Type.var "a" ]
                                         (Type.namedWith [ "Basics" ] "Order" []
                                         )
                                      )
                                  , Type.var "a"
                                  , Type.var "a"
                                  ]
                                  (Type.namedWith [ "Basics" ] "Order" [])
                             )
                     }
                )
                [ breakTiesArg_, breakTiesArg_0, breakTiesArg_1 ]
    , breakTiesWith =
        \breakTiesWithArg_ breakTiesWithArg_0 breakTiesWithArg_1 breakTiesWithArg_2 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Order", "Extra" ]
                     , name = "breakTiesWith"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function
                                      [ Type.var "a", Type.var "a" ]
                                      (Type.namedWith [ "Basics" ] "Order" [])
                                  , Type.function
                                      [ Type.var "a", Type.var "a" ]
                                      (Type.namedWith [ "Basics" ] "Order" [])
                                  , Type.var "a"
                                  , Type.var "a"
                                  ]
                                  (Type.namedWith [ "Basics" ] "Order" [])
                             )
                     }
                )
                [ breakTiesWithArg_
                , breakTiesWithArg_0
                , breakTiesWithArg_1
                , breakTiesWithArg_2
                ]
    , reverse =
        \reverseArg_ reverseArg_0 reverseArg_1 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Order", "Extra" ]
                     , name = "reverse"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function
                                      [ Type.var "a", Type.var "a" ]
                                      (Type.namedWith [ "Basics" ] "Order" [])
                                  , Type.var "a"
                                  , Type.var "a"
                                  ]
                                  (Type.namedWith [ "Basics" ] "Order" [])
                             )
                     }
                )
                [ reverseArg_, reverseArg_0, reverseArg_1 ]
    , natural =
        \naturalArg_ naturalArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Order", "Extra" ]
                     , name = "natural"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.string, Type.string ]
                                  (Type.namedWith [ "Basics" ] "Order" [])
                             )
                     }
                )
                [ naturalArg_, naturalArg_0 ]
    , nothingLast =
        \nothingLastArg_ nothingLastArg_0 nothingLastArg_1 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Order", "Extra" ]
                     , name = "nothingLast"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function
                                      [ Type.var "a", Type.var "a" ]
                                      (Type.namedWith [ "Basics" ] "Order" [])
                                  , Type.maybe (Type.var "a")
                                  , Type.maybe (Type.var "a")
                                  ]
                                  (Type.namedWith [ "Basics" ] "Order" [])
                             )
                     }
                )
                [ nothingLastArg_, nothingLastArg_0, nothingLastArg_1 ]
    , nothingFirst =
        \nothingFirstArg_ nothingFirstArg_0 nothingFirstArg_1 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Order", "Extra" ]
                     , name = "nothingFirst"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function
                                      [ Type.var "a", Type.var "a" ]
                                      (Type.namedWith [ "Basics" ] "Order" [])
                                  , Type.maybe (Type.var "a")
                                  , Type.maybe (Type.var "a")
                                  ]
                                  (Type.namedWith [ "Basics" ] "Order" [])
                             )
                     }
                )
                [ nothingFirstArg_, nothingFirstArg_0, nothingFirstArg_1 ]
    , isOrdered =
        \isOrderedArg_ isOrderedArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Order", "Extra" ]
                     , name = "isOrdered"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function
                                      [ Type.var "a", Type.var "a" ]
                                      (Type.namedWith [ "Basics" ] "Order" [])
                                  , Type.list (Type.var "a")
                                  ]
                                  Type.bool
                             )
                     }
                )
                [ isOrderedArg_, isOrderedArg_0 ]
    , greaterThanBy =
        \greaterThanByArg_ greaterThanByArg_0 greaterThanByArg_1 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Order", "Extra" ]
                     , name = "greaterThanBy"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function
                                      [ Type.var "a", Type.var "a" ]
                                      (Type.namedWith [ "Basics" ] "Order" [])
                                  , Type.var "a"
                                  , Type.var "a"
                                  ]
                                  Type.bool
                             )
                     }
                )
                [ greaterThanByArg_, greaterThanByArg_0, greaterThanByArg_1 ]
    , lessThanBy =
        \lessThanByArg_ lessThanByArg_0 lessThanByArg_1 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Order", "Extra" ]
                     , name = "lessThanBy"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function
                                      [ Type.var "a", Type.var "a" ]
                                      (Type.namedWith [ "Basics" ] "Order" [])
                                  , Type.var "a"
                                  , Type.var "a"
                                  ]
                                  Type.bool
                             )
                     }
                )
                [ lessThanByArg_, lessThanByArg_0, lessThanByArg_1 ]
    }


values_ :
    { explicit : Elm.Expression
    , byField : Elm.Expression
    , byFieldWith : Elm.Expression
    , byRank : Elm.Expression
    , ifStillTiedThen : Elm.Expression
    , breakTies : Elm.Expression
    , breakTiesWith : Elm.Expression
    , reverse : Elm.Expression
    , natural : Elm.Expression
    , nothingLast : Elm.Expression
    , nothingFirst : Elm.Expression
    , isOrdered : Elm.Expression
    , greaterThanBy : Elm.Expression
    , lessThanBy : Elm.Expression
    }
values_ =
    { explicit =
        Elm.value
            { importFrom = [ "Order", "Extra" ]
            , name = "explicit"
            , annotation =
                Just
                    (Type.function
                         [ Type.list (Type.var "a")
                         , Type.var "a"
                         , Type.var "a"
                         ]
                         (Type.namedWith [ "Basics" ] "Order" [])
                    )
            }
    , byField =
        Elm.value
            { importFrom = [ "Order", "Extra" ]
            , name = "byField"
            , annotation =
                Just
                    (Type.function
                         [ Type.function
                             [ Type.var "a" ]
                             (Type.var "comparable")
                         , Type.var "a"
                         , Type.var "a"
                         ]
                         (Type.namedWith [ "Basics" ] "Order" [])
                    )
            }
    , byFieldWith =
        Elm.value
            { importFrom = [ "Order", "Extra" ]
            , name = "byFieldWith"
            , annotation =
                Just
                    (Type.function
                         [ Type.function
                             [ Type.var "b", Type.var "b" ]
                             (Type.namedWith [ "Basics" ] "Order" [])
                         , Type.function [ Type.var "a" ] (Type.var "b")
                         , Type.var "a"
                         , Type.var "a"
                         ]
                         (Type.namedWith [ "Basics" ] "Order" [])
                    )
            }
    , byRank =
        Elm.value
            { importFrom = [ "Order", "Extra" ]
            , name = "byRank"
            , annotation =
                Just
                    (Type.function
                         [ Type.function [ Type.var "a" ] Type.int
                         , Type.function
                             [ Type.var "a", Type.var "a" ]
                             (Type.namedWith [ "Basics" ] "Order" [])
                         , Type.var "a"
                         , Type.var "a"
                         ]
                         (Type.namedWith [ "Basics" ] "Order" [])
                    )
            }
    , ifStillTiedThen =
        Elm.value
            { importFrom = [ "Order", "Extra" ]
            , name = "ifStillTiedThen"
            , annotation =
                Just
                    (Type.function
                         [ Type.namedWith [ "Basics" ] "Order" []
                         , Type.namedWith [ "Basics" ] "Order" []
                         ]
                         (Type.namedWith [ "Basics" ] "Order" [])
                    )
            }
    , breakTies =
        Elm.value
            { importFrom = [ "Order", "Extra" ]
            , name = "breakTies"
            , annotation =
                Just
                    (Type.function
                         [ Type.list
                             (Type.function
                                [ Type.var "a", Type.var "a" ]
                                (Type.namedWith [ "Basics" ] "Order" [])
                             )
                         , Type.var "a"
                         , Type.var "a"
                         ]
                         (Type.namedWith [ "Basics" ] "Order" [])
                    )
            }
    , breakTiesWith =
        Elm.value
            { importFrom = [ "Order", "Extra" ]
            , name = "breakTiesWith"
            , annotation =
                Just
                    (Type.function
                         [ Type.function
                             [ Type.var "a", Type.var "a" ]
                             (Type.namedWith [ "Basics" ] "Order" [])
                         , Type.function
                             [ Type.var "a", Type.var "a" ]
                             (Type.namedWith [ "Basics" ] "Order" [])
                         , Type.var "a"
                         , Type.var "a"
                         ]
                         (Type.namedWith [ "Basics" ] "Order" [])
                    )
            }
    , reverse =
        Elm.value
            { importFrom = [ "Order", "Extra" ]
            , name = "reverse"
            , annotation =
                Just
                    (Type.function
                         [ Type.function
                             [ Type.var "a", Type.var "a" ]
                             (Type.namedWith [ "Basics" ] "Order" [])
                         , Type.var "a"
                         , Type.var "a"
                         ]
                         (Type.namedWith [ "Basics" ] "Order" [])
                    )
            }
    , natural =
        Elm.value
            { importFrom = [ "Order", "Extra" ]
            , name = "natural"
            , annotation =
                Just
                    (Type.function
                         [ Type.string, Type.string ]
                         (Type.namedWith [ "Basics" ] "Order" [])
                    )
            }
    , nothingLast =
        Elm.value
            { importFrom = [ "Order", "Extra" ]
            , name = "nothingLast"
            , annotation =
                Just
                    (Type.function
                         [ Type.function
                             [ Type.var "a", Type.var "a" ]
                             (Type.namedWith [ "Basics" ] "Order" [])
                         , Type.maybe (Type.var "a")
                         , Type.maybe (Type.var "a")
                         ]
                         (Type.namedWith [ "Basics" ] "Order" [])
                    )
            }
    , nothingFirst =
        Elm.value
            { importFrom = [ "Order", "Extra" ]
            , name = "nothingFirst"
            , annotation =
                Just
                    (Type.function
                         [ Type.function
                             [ Type.var "a", Type.var "a" ]
                             (Type.namedWith [ "Basics" ] "Order" [])
                         , Type.maybe (Type.var "a")
                         , Type.maybe (Type.var "a")
                         ]
                         (Type.namedWith [ "Basics" ] "Order" [])
                    )
            }
    , isOrdered =
        Elm.value
            { importFrom = [ "Order", "Extra" ]
            , name = "isOrdered"
            , annotation =
                Just
                    (Type.function
                         [ Type.function
                             [ Type.var "a", Type.var "a" ]
                             (Type.namedWith [ "Basics" ] "Order" [])
                         , Type.list (Type.var "a")
                         ]
                         Type.bool
                    )
            }
    , greaterThanBy =
        Elm.value
            { importFrom = [ "Order", "Extra" ]
            , name = "greaterThanBy"
            , annotation =
                Just
                    (Type.function
                         [ Type.function
                             [ Type.var "a", Type.var "a" ]
                             (Type.namedWith [ "Basics" ] "Order" [])
                         , Type.var "a"
                         , Type.var "a"
                         ]
                         Type.bool
                    )
            }
    , lessThanBy =
        Elm.value
            { importFrom = [ "Order", "Extra" ]
            , name = "lessThanBy"
            , annotation =
                Just
                    (Type.function
                         [ Type.function
                             [ Type.var "a", Type.var "a" ]
                             (Type.namedWith [ "Basics" ] "Order" [])
                         , Type.var "a"
                         , Type.var "a"
                         ]
                         Type.bool
                    )
            }
    }