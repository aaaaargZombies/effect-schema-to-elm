module Gen.Tuple.Extra exposing
    ( moduleName_, pairWith, from, apply, flip, join
    , joinBy, sum, product, sort, sortBy, sortWith, map
    , annotation_, call_, values_
    )

{-|
# Generated bindings for Tuple.Extra

@docs moduleName_, pairWith, from, apply, flip, join
@docs joinBy, sum, product, sort, sortBy, sortWith
@docs map, annotation_, call_, values_
-}


import Elm
import Elm.Annotation as Type


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Tuple", "Extra" ]


{-| In certain situations, this proves more "pipe friendly" than the standard
`Tuple.pair`. Fits nicely in your `update` function.

    { model | count = model.count + 1 }
        |> Tuple.Extra.pairWith Cmd.none

pairWith: b -> a -> ( a, b )
-}
pairWith : Elm.Expression -> Elm.Expression -> Elm.Expression
pairWith pairWithArg_ pairWithArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Tuple", "Extra" ]
             , name = "pairWith"
             , annotation =
                 Just
                     (Type.function
                          [ Type.var "b", Type.var "a" ]
                          (Type.tuple (Type.var "a") (Type.var "b"))
                     )
             }
        )
        [ pairWithArg_, pairWithArg_0 ]


{-| Occasionally you might want to create a Tuple from a single value. This does
just that.

    Tuple.Extra.from 1 --> ( 1, 1 )

from: a -> ( a, a )
-}
from : Elm.Expression -> Elm.Expression
from fromArg_ =
    Elm.apply
        (Elm.value
             { importFrom = [ "Tuple", "Extra" ]
             , name = "from"
             , annotation =
                 Just
                     (Type.function
                          [ Type.var "a" ]
                          (Type.tuple (Type.var "a") (Type.var "a"))
                     )
             }
        )
        [ fromArg_ ]


{-| Given a function that takes two arguments, apply that function to the two
values contained in a tuple.

    Tuple.Extra.apply (+) ( 1, 2 )
        --> 3

apply: (a -> b -> c) -> ( a, b ) -> c
-}
apply :
    (Elm.Expression -> Elm.Expression -> Elm.Expression)
    -> Elm.Expression
    -> Elm.Expression
apply applyArg_ applyArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Tuple", "Extra" ]
             , name = "apply"
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
            "applyUnpack"
            (\functionReducedUnpack ->
               Elm.functionReduced "unpack" (applyArg_ functionReducedUnpack)
            )
        , applyArg_0
        ]


{-| Flip the two values contained in a tuple.

flip: ( a, b ) -> ( b, a )
-}
flip : Elm.Expression -> Elm.Expression
flip flipArg_ =
    Elm.apply
        (Elm.value
             { importFrom = [ "Tuple", "Extra" ]
             , name = "flip"
             , annotation =
                 Just
                     (Type.function
                          [ Type.tuple (Type.var "a") (Type.var "b") ]
                          (Type.tuple (Type.var "b") (Type.var "a"))
                     )
             }
        )
        [ flipArg_ ]


{-| Similar to String.join but for tuples instead of lists. Given some separator
string, join together two strings in a tuple.

    Tuple.Extra.join " " ( "Hello", "world" )
        --> "Hello world"

join: appendable -> ( appendable, appendable ) -> appendable
-}
join : Elm.Expression -> Elm.Expression -> Elm.Expression
join joinArg_ joinArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Tuple", "Extra" ]
             , name = "join"
             , annotation =
                 Just
                     (Type.function
                          [ Type.var "appendable"
                          , Type.tuple
                              (Type.var "appendable")
                              (Type.var "appendable")
                          ]
                          (Type.var "appendable")
                     )
             }
        )
        [ joinArg_, joinArg_0 ]


{-| Works just like join, but first converts the values of the tuple to strings.
These means the function works with any type of tuple.

    Tuple.Extra.joinBy String.fromInt suitToString " of " ( 7, Club )
        == "Seven of Clubs"

joinBy: (a -> appendable) -> (b -> appendable) -> appendable -> ( a, b ) -> appendable
-}
joinBy :
    (Elm.Expression -> Elm.Expression)
    -> (Elm.Expression -> Elm.Expression)
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
joinBy joinByArg_ joinByArg_0 joinByArg_1 joinByArg_2 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Tuple", "Extra" ]
             , name = "joinBy"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function
                              [ Type.var "a" ]
                              (Type.var "appendable")
                          , Type.function
                              [ Type.var "b" ]
                              (Type.var "appendable")
                          , Type.var "appendable"
                          , Type.tuple (Type.var "a") (Type.var "b")
                          ]
                          (Type.var "appendable")
                     )
             }
        )
        [ Elm.functionReduced "joinByUnpack" joinByArg_
        , Elm.functionReduced "joinByUnpack" joinByArg_0
        , joinByArg_1
        , joinByArg_2
        ]


{-| Similar to List.sum but for tuples instead of lists. Adds together two
numbers contained in a tuple.

    Tuple.Extra.sum ( 1, 2 )
        --> 3

sum: ( number, number ) -> number
-}
sum : Elm.Expression -> Elm.Expression
sum sumArg_ =
    Elm.apply
        (Elm.value
             { importFrom = [ "Tuple", "Extra" ]
             , name = "sum"
             , annotation =
                 Just
                     (Type.function
                          [ Type.tuple (Type.var "number") (Type.var "number") ]
                          (Type.var "number")
                     )
             }
        )
        [ sumArg_ ]


{-| Similar to List.sum but for tuples instead of lists. Multiplies together two
numbers contained in a tuple

    Tuple.Extra.product ( 1, 2 )
        --> 2

product: ( number, number ) -> number
-}
product : Elm.Expression -> Elm.Expression
product productArg_ =
    Elm.apply
        (Elm.value
             { importFrom = [ "Tuple", "Extra" ]
             , name = "product"
             , annotation =
                 Just
                     (Type.function
                          [ Type.tuple (Type.var "number") (Type.var "number") ]
                          (Type.var "number")
                     )
             }
        )
        [ productArg_ ]


{-| Similar to List.sort but for tuples instead of lists. Sort values contained
in a tuple from lowest to highest

    Tuple.Extra.sort ( 2, 1 )
        --> ( 1, 2 )

sort: ( comparable, comparable ) -> ( comparable, comparable )
-}
sort : Elm.Expression -> Elm.Expression
sort sortArg_ =
    Elm.apply
        (Elm.value
             { importFrom = [ "Tuple", "Extra" ]
             , name = "sort"
             , annotation =
                 Just
                     (Type.function
                          [ Type.tuple
                              (Type.var "comparable")
                              (Type.var "comparable")
                          ]
                          (Type.tuple
                               (Type.var "comparable")
                               (Type.var "comparable")
                          )
                     )
             }
        )
        [ sortArg_ ]


{-| Similar to List.sortBy but for tuples instead of lists. Sort values
contained in a tuple by first converting both values to a `comparable`. The
values are sorted lowest to highest

    Tuple.Extra.sortBy String.length ( "mouse", "cat" )
        --> ( "cat", "mouse" )

sortBy: (a -> comparable) -> ( a, a ) -> ( a, a )
-}
sortBy : (Elm.Expression -> Elm.Expression) -> Elm.Expression -> Elm.Expression
sortBy sortByArg_ sortByArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Tuple", "Extra" ]
             , name = "sortBy"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function
                              [ Type.var "a" ]
                              (Type.var "comparable")
                          , Type.tuple (Type.var "a") (Type.var "a")
                          ]
                          (Type.tuple (Type.var "a") (Type.var "a"))
                     )
             }
        )
        [ Elm.functionReduced "sortByUnpack" sortByArg_, sortByArg_0 ]


{-| Similar to List.sortWith but for tuples instead of lists. Instead of
converting values contained in a tuple to `comparable`s, instead supply a
function that will produce an `Order` directly.

    Tuple.Extra.sortWith Basics.compare ( 2, 1 )
        --> ( 1, 2 )

sortWith: (a -> a -> Basics.Order) -> ( a, a ) -> ( a, a )
-}
sortWith :
    (Elm.Expression -> Elm.Expression -> Elm.Expression)
    -> Elm.Expression
    -> Elm.Expression
sortWith sortWithArg_ sortWithArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Tuple", "Extra" ]
             , name = "sortWith"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function
                              [ Type.var "a", Type.var "a" ]
                              (Type.namedWith [ "Basics" ] "Order" [])
                          , Type.tuple (Type.var "a") (Type.var "a")
                          ]
                          (Type.tuple (Type.var "a") (Type.var "a"))
                     )
             }
        )
        [ Elm.functionReduced
            "sortWithUnpack"
            (\functionReducedUnpack ->
               Elm.functionReduced "unpack" (sortWithArg_ functionReducedUnpack)
            )
        , sortWithArg_0
        ]


{-| Apply a function to both values contained in a tuple. This might also be
known as `mapBothWith` or `bimap`.

    Tuple.Extra.map negate ( -3, 10 )
        --> ( 3, -10 )

map: (a -> b) -> ( a, a ) -> ( b, b )
-}
map : (Elm.Expression -> Elm.Expression) -> Elm.Expression -> Elm.Expression
map mapArg_ mapArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Tuple", "Extra" ]
             , name = "map"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function [ Type.var "a" ] (Type.var "b")
                          , Type.tuple (Type.var "a") (Type.var "a")
                          ]
                          (Type.tuple (Type.var "b") (Type.var "b"))
                     )
             }
        )
        [ Elm.functionReduced "mapUnpack" mapArg_, mapArg_0 ]


annotation_ : { tuple : Type.Annotation -> Type.Annotation -> Type.Annotation }
annotation_ =
    { tuple =
        \tupleArg0 tupleArg1 ->
            Type.alias
                moduleName_
                "Tuple"
                [ tupleArg0, tupleArg1 ]
                (Type.tuple (Type.var "a") (Type.var "b"))
    }


call_ :
    { pairWith : Elm.Expression -> Elm.Expression -> Elm.Expression
    , from : Elm.Expression -> Elm.Expression
    , apply : Elm.Expression -> Elm.Expression -> Elm.Expression
    , flip : Elm.Expression -> Elm.Expression
    , join : Elm.Expression -> Elm.Expression -> Elm.Expression
    , joinBy :
        Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
    , sum : Elm.Expression -> Elm.Expression
    , product : Elm.Expression -> Elm.Expression
    , sort : Elm.Expression -> Elm.Expression
    , sortBy : Elm.Expression -> Elm.Expression -> Elm.Expression
    , sortWith : Elm.Expression -> Elm.Expression -> Elm.Expression
    , map : Elm.Expression -> Elm.Expression -> Elm.Expression
    }
call_ =
    { pairWith =
        \pairWithArg_ pairWithArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Tuple", "Extra" ]
                     , name = "pairWith"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.var "b", Type.var "a" ]
                                  (Type.tuple (Type.var "a") (Type.var "b"))
                             )
                     }
                )
                [ pairWithArg_, pairWithArg_0 ]
    , from =
        \fromArg_ ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Tuple", "Extra" ]
                     , name = "from"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.var "a" ]
                                  (Type.tuple (Type.var "a") (Type.var "a"))
                             )
                     }
                )
                [ fromArg_ ]
    , apply =
        \applyArg_ applyArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Tuple", "Extra" ]
                     , name = "apply"
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
                [ applyArg_, applyArg_0 ]
    , flip =
        \flipArg_ ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Tuple", "Extra" ]
                     , name = "flip"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.tuple (Type.var "a") (Type.var "b") ]
                                  (Type.tuple (Type.var "b") (Type.var "a"))
                             )
                     }
                )
                [ flipArg_ ]
    , join =
        \joinArg_ joinArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Tuple", "Extra" ]
                     , name = "join"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.var "appendable"
                                  , Type.tuple
                                      (Type.var "appendable")
                                      (Type.var "appendable")
                                  ]
                                  (Type.var "appendable")
                             )
                     }
                )
                [ joinArg_, joinArg_0 ]
    , joinBy =
        \joinByArg_ joinByArg_0 joinByArg_1 joinByArg_2 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Tuple", "Extra" ]
                     , name = "joinBy"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function
                                      [ Type.var "a" ]
                                      (Type.var "appendable")
                                  , Type.function
                                      [ Type.var "b" ]
                                      (Type.var "appendable")
                                  , Type.var "appendable"
                                  , Type.tuple (Type.var "a") (Type.var "b")
                                  ]
                                  (Type.var "appendable")
                             )
                     }
                )
                [ joinByArg_, joinByArg_0, joinByArg_1, joinByArg_2 ]
    , sum =
        \sumArg_ ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Tuple", "Extra" ]
                     , name = "sum"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.tuple
                                      (Type.var "number")
                                      (Type.var "number")
                                  ]
                                  (Type.var "number")
                             )
                     }
                )
                [ sumArg_ ]
    , product =
        \productArg_ ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Tuple", "Extra" ]
                     , name = "product"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.tuple
                                      (Type.var "number")
                                      (Type.var "number")
                                  ]
                                  (Type.var "number")
                             )
                     }
                )
                [ productArg_ ]
    , sort =
        \sortArg_ ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Tuple", "Extra" ]
                     , name = "sort"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.tuple
                                      (Type.var "comparable")
                                      (Type.var "comparable")
                                  ]
                                  (Type.tuple
                                       (Type.var "comparable")
                                       (Type.var "comparable")
                                  )
                             )
                     }
                )
                [ sortArg_ ]
    , sortBy =
        \sortByArg_ sortByArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Tuple", "Extra" ]
                     , name = "sortBy"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function
                                      [ Type.var "a" ]
                                      (Type.var "comparable")
                                  , Type.tuple (Type.var "a") (Type.var "a")
                                  ]
                                  (Type.tuple (Type.var "a") (Type.var "a"))
                             )
                     }
                )
                [ sortByArg_, sortByArg_0 ]
    , sortWith =
        \sortWithArg_ sortWithArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Tuple", "Extra" ]
                     , name = "sortWith"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function
                                      [ Type.var "a", Type.var "a" ]
                                      (Type.namedWith [ "Basics" ] "Order" [])
                                  , Type.tuple (Type.var "a") (Type.var "a")
                                  ]
                                  (Type.tuple (Type.var "a") (Type.var "a"))
                             )
                     }
                )
                [ sortWithArg_, sortWithArg_0 ]
    , map =
        \mapArg_ mapArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Tuple", "Extra" ]
                     , name = "map"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function
                                      [ Type.var "a" ]
                                      (Type.var "b")
                                  , Type.tuple (Type.var "a") (Type.var "a")
                                  ]
                                  (Type.tuple (Type.var "b") (Type.var "b"))
                             )
                     }
                )
                [ mapArg_, mapArg_0 ]
    }


values_ :
    { pairWith : Elm.Expression
    , from : Elm.Expression
    , apply : Elm.Expression
    , flip : Elm.Expression
    , join : Elm.Expression
    , joinBy : Elm.Expression
    , sum : Elm.Expression
    , product : Elm.Expression
    , sort : Elm.Expression
    , sortBy : Elm.Expression
    , sortWith : Elm.Expression
    , map : Elm.Expression
    }
values_ =
    { pairWith =
        Elm.value
            { importFrom = [ "Tuple", "Extra" ]
            , name = "pairWith"
            , annotation =
                Just
                    (Type.function
                         [ Type.var "b", Type.var "a" ]
                         (Type.tuple (Type.var "a") (Type.var "b"))
                    )
            }
    , from =
        Elm.value
            { importFrom = [ "Tuple", "Extra" ]
            , name = "from"
            , annotation =
                Just
                    (Type.function
                         [ Type.var "a" ]
                         (Type.tuple (Type.var "a") (Type.var "a"))
                    )
            }
    , apply =
        Elm.value
            { importFrom = [ "Tuple", "Extra" ]
            , name = "apply"
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
    , flip =
        Elm.value
            { importFrom = [ "Tuple", "Extra" ]
            , name = "flip"
            , annotation =
                Just
                    (Type.function
                         [ Type.tuple (Type.var "a") (Type.var "b") ]
                         (Type.tuple (Type.var "b") (Type.var "a"))
                    )
            }
    , join =
        Elm.value
            { importFrom = [ "Tuple", "Extra" ]
            , name = "join"
            , annotation =
                Just
                    (Type.function
                         [ Type.var "appendable"
                         , Type.tuple
                             (Type.var "appendable")
                             (Type.var "appendable")
                         ]
                         (Type.var "appendable")
                    )
            }
    , joinBy =
        Elm.value
            { importFrom = [ "Tuple", "Extra" ]
            , name = "joinBy"
            , annotation =
                Just
                    (Type.function
                         [ Type.function
                             [ Type.var "a" ]
                             (Type.var "appendable")
                         , Type.function
                             [ Type.var "b" ]
                             (Type.var "appendable")
                         , Type.var "appendable"
                         , Type.tuple (Type.var "a") (Type.var "b")
                         ]
                         (Type.var "appendable")
                    )
            }
    , sum =
        Elm.value
            { importFrom = [ "Tuple", "Extra" ]
            , name = "sum"
            , annotation =
                Just
                    (Type.function
                         [ Type.tuple (Type.var "number") (Type.var "number") ]
                         (Type.var "number")
                    )
            }
    , product =
        Elm.value
            { importFrom = [ "Tuple", "Extra" ]
            , name = "product"
            , annotation =
                Just
                    (Type.function
                         [ Type.tuple (Type.var "number") (Type.var "number") ]
                         (Type.var "number")
                    )
            }
    , sort =
        Elm.value
            { importFrom = [ "Tuple", "Extra" ]
            , name = "sort"
            , annotation =
                Just
                    (Type.function
                         [ Type.tuple
                             (Type.var "comparable")
                             (Type.var "comparable")
                         ]
                         (Type.tuple
                              (Type.var "comparable")
                              (Type.var "comparable")
                         )
                    )
            }
    , sortBy =
        Elm.value
            { importFrom = [ "Tuple", "Extra" ]
            , name = "sortBy"
            , annotation =
                Just
                    (Type.function
                         [ Type.function
                             [ Type.var "a" ]
                             (Type.var "comparable")
                         , Type.tuple (Type.var "a") (Type.var "a")
                         ]
                         (Type.tuple (Type.var "a") (Type.var "a"))
                    )
            }
    , sortWith =
        Elm.value
            { importFrom = [ "Tuple", "Extra" ]
            , name = "sortWith"
            , annotation =
                Just
                    (Type.function
                         [ Type.function
                             [ Type.var "a", Type.var "a" ]
                             (Type.namedWith [ "Basics" ] "Order" [])
                         , Type.tuple (Type.var "a") (Type.var "a")
                         ]
                         (Type.tuple (Type.var "a") (Type.var "a"))
                    )
            }
    , map =
        Elm.value
            { importFrom = [ "Tuple", "Extra" ]
            , name = "map"
            , annotation =
                Just
                    (Type.function
                         [ Type.function [ Type.var "a" ] (Type.var "b")
                         , Type.tuple (Type.var "a") (Type.var "a")
                         ]
                         (Type.tuple (Type.var "b") (Type.var "b"))
                    )
            }
    }