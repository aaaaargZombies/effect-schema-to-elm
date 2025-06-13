module Gen.Triple.Extra exposing
    ( moduleName_, triple, from, first, second, third
    , apply, sortWith, map, mapFirst, mapSecond, mapThird, toList
    , annotation_, call_, values_
    )

{-|
# Generated bindings for Triple.Extra

@docs moduleName_, triple, from, first, second, third
@docs apply, sortWith, map, mapFirst, mapSecond, mapThird
@docs toList, annotation_, call_, values_
-}


import Elm
import Elm.Annotation as Type


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Triple", "Extra" ]


{-| Create a triple.

triple: a -> b -> c -> ( a, b, c )
-}
triple : Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
triple tripleArg_ tripleArg_0 tripleArg_1 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Triple", "Extra" ]
             , name = "triple"
             , annotation =
                 Just
                     (Type.function
                          [ Type.var "a", Type.var "b", Type.var "c" ]
                          (Type.triple
                               (Type.var "a")
                               (Type.var "b")
                               (Type.var "c")
                          )
                     )
             }
        )
        [ tripleArg_, tripleArg_0, tripleArg_1 ]


{-| Occasionally you might want to create a Triple from a single value. This does
just that.

    Triple.Extra.from 1 --> ( 1, 1, 1 )

from: a -> ( a, a, a )
-}
from : Elm.Expression -> Elm.Expression
from fromArg_ =
    Elm.apply
        (Elm.value
             { importFrom = [ "Triple", "Extra" ]
             , name = "from"
             , annotation =
                 Just
                     (Type.function
                          [ Type.var "a" ]
                          (Type.triple
                               (Type.var "a")
                               (Type.var "a")
                               (Type.var "a")
                          )
                     )
             }
        )
        [ fromArg_ ]


{-| Extract the first value from a triple.

first: ( a, b, c ) -> a
-}
first : Elm.Expression -> Elm.Expression
first firstArg_ =
    Elm.apply
        (Elm.value
             { importFrom = [ "Triple", "Extra" ]
             , name = "first"
             , annotation =
                 Just
                     (Type.function
                          [ Type.triple
                              (Type.var "a")
                              (Type.var "b")
                              (Type.var "c")
                          ]
                          (Type.var "a")
                     )
             }
        )
        [ firstArg_ ]


{-| Extract the second value from a triple.

second: ( a, b, c ) -> b
-}
second : Elm.Expression -> Elm.Expression
second secondArg_ =
    Elm.apply
        (Elm.value
             { importFrom = [ "Triple", "Extra" ]
             , name = "second"
             , annotation =
                 Just
                     (Type.function
                          [ Type.triple
                              (Type.var "a")
                              (Type.var "b")
                              (Type.var "c")
                          ]
                          (Type.var "b")
                     )
             }
        )
        [ secondArg_ ]


{-| Extract the third value from a triple.

third: ( a, b, c ) -> c
-}
third : Elm.Expression -> Elm.Expression
third thirdArg_ =
    Elm.apply
        (Elm.value
             { importFrom = [ "Triple", "Extra" ]
             , name = "third"
             , annotation =
                 Just
                     (Type.function
                          [ Type.triple
                              (Type.var "a")
                              (Type.var "b")
                              (Type.var "c")
                          ]
                          (Type.var "c")
                     )
             }
        )
        [ thirdArg_ ]


{-| Given a function that takes three arguments, apply that function to the three
values contained in a Triple.

    ( 1, 2, Array.fromList [0,1,2,3,4] )
        |> Triple.Extra.apply Array.slice
        --> Array.fromList [1,2,3]

apply: (a -> b -> c -> d) -> ( a, b, c ) -> d
-}
apply :
    (Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression)
    -> Elm.Expression
    -> Elm.Expression
apply applyArg_ applyArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Triple", "Extra" ]
             , name = "apply"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function
                              [ Type.var "a", Type.var "b", Type.var "c" ]
                              (Type.var "d")
                          , Type.triple
                              (Type.var "a")
                              (Type.var "b")
                              (Type.var "c")
                          ]
                          (Type.var "d")
                     )
             }
        )
        [ Elm.functionReduced
            "applyUnpack"
            (\functionReducedUnpack ->
               Elm.functionReduced
                   "unpack"
                   (\functionReducedUnpack0 ->
                        Elm.functionReduced
                            "unpack"
                            ((applyArg_ functionReducedUnpack)
                                 functionReducedUnpack0
                            )
                   )
            )
        , applyArg_0
        ]


{-| Similar to List.sortWith but for Triples instead of lists. Instead of
converting values contained in a Triple to `comparable`s, instead supply a
function that will produce an `Order` directly.

    Triple.Extra.sortWith Basics.compare ( 2, 1, 3 )
        --> ( 1, 2, 3 )

sortWith: (a -> a -> Basics.Order) -> ( a, a, a ) -> ( a, a, a )
-}
sortWith :
    (Elm.Expression -> Elm.Expression -> Elm.Expression)
    -> Elm.Expression
    -> Elm.Expression
sortWith sortWithArg_ sortWithArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Triple", "Extra" ]
             , name = "sortWith"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function
                              [ Type.var "a", Type.var "a" ]
                              (Type.namedWith [ "Basics" ] "Order" [])
                          , Type.triple
                              (Type.var "a")
                              (Type.var "a")
                              (Type.var "a")
                          ]
                          (Type.triple
                               (Type.var "a")
                               (Type.var "a")
                               (Type.var "a")
                          )
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


{-| Apply a function to all values contained in a Triple.

    Triple.Extra.map negate ( -3, 10, -7 )
        --> ( 3, -10, 7 )

map: (a -> b) -> ( a, a, a ) -> ( b, b, b )
-}
map : (Elm.Expression -> Elm.Expression) -> Elm.Expression -> Elm.Expression
map mapArg_ mapArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Triple", "Extra" ]
             , name = "map"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function [ Type.var "a" ] (Type.var "b")
                          , Type.triple
                              (Type.var "a")
                              (Type.var "a")
                              (Type.var "a")
                          ]
                          (Type.triple
                               (Type.var "b")
                               (Type.var "b")
                               (Type.var "b")
                          )
                     )
             }
        )
        [ Elm.functionReduced "mapUnpack" mapArg_, mapArg_0 ]


{-| Transform the first value in a triple.

    Triple.Extra.mapFirst negate ( -3, 10, '9' )
        --> ( 3, 10, '9' )

mapFirst: (a -> x) -> ( a, b, c ) -> ( x, b, c )
-}
mapFirst :
    (Elm.Expression -> Elm.Expression) -> Elm.Expression -> Elm.Expression
mapFirst mapFirstArg_ mapFirstArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Triple", "Extra" ]
             , name = "mapFirst"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function [ Type.var "a" ] (Type.var "x")
                          , Type.triple
                              (Type.var "a")
                              (Type.var "b")
                              (Type.var "c")
                          ]
                          (Type.triple
                               (Type.var "x")
                               (Type.var "b")
                               (Type.var "c")
                          )
                     )
             }
        )
        [ Elm.functionReduced "mapFirstUnpack" mapFirstArg_, mapFirstArg_0 ]


{-| Transform the second value in a triple.

    Triple.Extra.mapSecond negate ( -3, 10, '9' )
        --> ( -3, 010, '9' )

mapSecond: (b -> x) -> ( a, b, c ) -> ( a, x, c )
-}
mapSecond :
    (Elm.Expression -> Elm.Expression) -> Elm.Expression -> Elm.Expression
mapSecond mapSecondArg_ mapSecondArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Triple", "Extra" ]
             , name = "mapSecond"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function [ Type.var "b" ] (Type.var "x")
                          , Type.triple
                              (Type.var "a")
                              (Type.var "b")
                              (Type.var "c")
                          ]
                          (Type.triple
                               (Type.var "a")
                               (Type.var "x")
                               (Type.var "c")
                          )
                     )
             }
        )
        [ Elm.functionReduced "mapSecondUnpack" mapSecondArg_, mapSecondArg_0 ]


{-| Transform the third value in a triple.

    Triple.Extra.mapThird String.toUpper ( -3, 10, "a" )
        --> ( -3, 10, "A" )

mapThird: (c -> x) -> ( a, b, c ) -> ( a, b, x )
-}
mapThird :
    (Elm.Expression -> Elm.Expression) -> Elm.Expression -> Elm.Expression
mapThird mapThirdArg_ mapThirdArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Triple", "Extra" ]
             , name = "mapThird"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function [ Type.var "c" ] (Type.var "x")
                          , Type.triple
                              (Type.var "a")
                              (Type.var "b")
                              (Type.var "c")
                          ]
                          (Type.triple
                               (Type.var "a")
                               (Type.var "b")
                               (Type.var "x")
                          )
                     )
             }
        )
        [ Elm.functionReduced "mapThirdUnpack" mapThirdArg_, mapThirdArg_0 ]


{-| Turns a triple into a list of three elements.

    Triple.Extra.toList ( 1, 2, 3 )
        --> [ 1, 2, 3 ]

toList: ( a, a, a ) -> List a
-}
toList : Elm.Expression -> Elm.Expression
toList toListArg_ =
    Elm.apply
        (Elm.value
             { importFrom = [ "Triple", "Extra" ]
             , name = "toList"
             , annotation =
                 Just
                     (Type.function
                          [ Type.triple
                              (Type.var "a")
                              (Type.var "a")
                              (Type.var "a")
                          ]
                          (Type.list (Type.var "a"))
                     )
             }
        )
        [ toListArg_ ]


annotation_ :
    { triple :
        Type.Annotation -> Type.Annotation -> Type.Annotation -> Type.Annotation
    }
annotation_ =
    { triple =
        \tripleArg0 tripleArg1 tripleArg2 ->
            Type.alias
                moduleName_
                "Triple"
                [ tripleArg0, tripleArg1, tripleArg2 ]
                (Type.triple (Type.var "a") (Type.var "b") (Type.var "c"))
    }


call_ :
    { triple :
        Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
    , from : Elm.Expression -> Elm.Expression
    , first : Elm.Expression -> Elm.Expression
    , second : Elm.Expression -> Elm.Expression
    , third : Elm.Expression -> Elm.Expression
    , apply : Elm.Expression -> Elm.Expression -> Elm.Expression
    , sortWith : Elm.Expression -> Elm.Expression -> Elm.Expression
    , map : Elm.Expression -> Elm.Expression -> Elm.Expression
    , mapFirst : Elm.Expression -> Elm.Expression -> Elm.Expression
    , mapSecond : Elm.Expression -> Elm.Expression -> Elm.Expression
    , mapThird : Elm.Expression -> Elm.Expression -> Elm.Expression
    , toList : Elm.Expression -> Elm.Expression
    }
call_ =
    { triple =
        \tripleArg_ tripleArg_0 tripleArg_1 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Triple", "Extra" ]
                     , name = "triple"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.var "a", Type.var "b", Type.var "c" ]
                                  (Type.triple
                                       (Type.var "a")
                                       (Type.var "b")
                                       (Type.var "c")
                                  )
                             )
                     }
                )
                [ tripleArg_, tripleArg_0, tripleArg_1 ]
    , from =
        \fromArg_ ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Triple", "Extra" ]
                     , name = "from"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.var "a" ]
                                  (Type.triple
                                       (Type.var "a")
                                       (Type.var "a")
                                       (Type.var "a")
                                  )
                             )
                     }
                )
                [ fromArg_ ]
    , first =
        \firstArg_ ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Triple", "Extra" ]
                     , name = "first"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.triple
                                      (Type.var "a")
                                      (Type.var "b")
                                      (Type.var "c")
                                  ]
                                  (Type.var "a")
                             )
                     }
                )
                [ firstArg_ ]
    , second =
        \secondArg_ ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Triple", "Extra" ]
                     , name = "second"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.triple
                                      (Type.var "a")
                                      (Type.var "b")
                                      (Type.var "c")
                                  ]
                                  (Type.var "b")
                             )
                     }
                )
                [ secondArg_ ]
    , third =
        \thirdArg_ ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Triple", "Extra" ]
                     , name = "third"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.triple
                                      (Type.var "a")
                                      (Type.var "b")
                                      (Type.var "c")
                                  ]
                                  (Type.var "c")
                             )
                     }
                )
                [ thirdArg_ ]
    , apply =
        \applyArg_ applyArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Triple", "Extra" ]
                     , name = "apply"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function
                                      [ Type.var "a"
                                      , Type.var "b"
                                      , Type.var "c"
                                      ]
                                      (Type.var "d")
                                  , Type.triple
                                      (Type.var "a")
                                      (Type.var "b")
                                      (Type.var "c")
                                  ]
                                  (Type.var "d")
                             )
                     }
                )
                [ applyArg_, applyArg_0 ]
    , sortWith =
        \sortWithArg_ sortWithArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Triple", "Extra" ]
                     , name = "sortWith"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function
                                      [ Type.var "a", Type.var "a" ]
                                      (Type.namedWith [ "Basics" ] "Order" [])
                                  , Type.triple
                                      (Type.var "a")
                                      (Type.var "a")
                                      (Type.var "a")
                                  ]
                                  (Type.triple
                                       (Type.var "a")
                                       (Type.var "a")
                                       (Type.var "a")
                                  )
                             )
                     }
                )
                [ sortWithArg_, sortWithArg_0 ]
    , map =
        \mapArg_ mapArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Triple", "Extra" ]
                     , name = "map"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function
                                      [ Type.var "a" ]
                                      (Type.var "b")
                                  , Type.triple
                                      (Type.var "a")
                                      (Type.var "a")
                                      (Type.var "a")
                                  ]
                                  (Type.triple
                                       (Type.var "b")
                                       (Type.var "b")
                                       (Type.var "b")
                                  )
                             )
                     }
                )
                [ mapArg_, mapArg_0 ]
    , mapFirst =
        \mapFirstArg_ mapFirstArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Triple", "Extra" ]
                     , name = "mapFirst"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function
                                      [ Type.var "a" ]
                                      (Type.var "x")
                                  , Type.triple
                                      (Type.var "a")
                                      (Type.var "b")
                                      (Type.var "c")
                                  ]
                                  (Type.triple
                                       (Type.var "x")
                                       (Type.var "b")
                                       (Type.var "c")
                                  )
                             )
                     }
                )
                [ mapFirstArg_, mapFirstArg_0 ]
    , mapSecond =
        \mapSecondArg_ mapSecondArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Triple", "Extra" ]
                     , name = "mapSecond"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function
                                      [ Type.var "b" ]
                                      (Type.var "x")
                                  , Type.triple
                                      (Type.var "a")
                                      (Type.var "b")
                                      (Type.var "c")
                                  ]
                                  (Type.triple
                                       (Type.var "a")
                                       (Type.var "x")
                                       (Type.var "c")
                                  )
                             )
                     }
                )
                [ mapSecondArg_, mapSecondArg_0 ]
    , mapThird =
        \mapThirdArg_ mapThirdArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Triple", "Extra" ]
                     , name = "mapThird"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function
                                      [ Type.var "c" ]
                                      (Type.var "x")
                                  , Type.triple
                                      (Type.var "a")
                                      (Type.var "b")
                                      (Type.var "c")
                                  ]
                                  (Type.triple
                                       (Type.var "a")
                                       (Type.var "b")
                                       (Type.var "x")
                                  )
                             )
                     }
                )
                [ mapThirdArg_, mapThirdArg_0 ]
    , toList =
        \toListArg_ ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Triple", "Extra" ]
                     , name = "toList"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.triple
                                      (Type.var "a")
                                      (Type.var "a")
                                      (Type.var "a")
                                  ]
                                  (Type.list (Type.var "a"))
                             )
                     }
                )
                [ toListArg_ ]
    }


values_ :
    { triple : Elm.Expression
    , from : Elm.Expression
    , first : Elm.Expression
    , second : Elm.Expression
    , third : Elm.Expression
    , apply : Elm.Expression
    , sortWith : Elm.Expression
    , map : Elm.Expression
    , mapFirst : Elm.Expression
    , mapSecond : Elm.Expression
    , mapThird : Elm.Expression
    , toList : Elm.Expression
    }
values_ =
    { triple =
        Elm.value
            { importFrom = [ "Triple", "Extra" ]
            , name = "triple"
            , annotation =
                Just
                    (Type.function
                         [ Type.var "a", Type.var "b", Type.var "c" ]
                         (Type.triple
                              (Type.var "a")
                              (Type.var "b")
                              (Type.var "c")
                         )
                    )
            }
    , from =
        Elm.value
            { importFrom = [ "Triple", "Extra" ]
            , name = "from"
            , annotation =
                Just
                    (Type.function
                         [ Type.var "a" ]
                         (Type.triple
                              (Type.var "a")
                              (Type.var "a")
                              (Type.var "a")
                         )
                    )
            }
    , first =
        Elm.value
            { importFrom = [ "Triple", "Extra" ]
            , name = "first"
            , annotation =
                Just
                    (Type.function
                         [ Type.triple
                             (Type.var "a")
                             (Type.var "b")
                             (Type.var "c")
                         ]
                         (Type.var "a")
                    )
            }
    , second =
        Elm.value
            { importFrom = [ "Triple", "Extra" ]
            , name = "second"
            , annotation =
                Just
                    (Type.function
                         [ Type.triple
                             (Type.var "a")
                             (Type.var "b")
                             (Type.var "c")
                         ]
                         (Type.var "b")
                    )
            }
    , third =
        Elm.value
            { importFrom = [ "Triple", "Extra" ]
            , name = "third"
            , annotation =
                Just
                    (Type.function
                         [ Type.triple
                             (Type.var "a")
                             (Type.var "b")
                             (Type.var "c")
                         ]
                         (Type.var "c")
                    )
            }
    , apply =
        Elm.value
            { importFrom = [ "Triple", "Extra" ]
            , name = "apply"
            , annotation =
                Just
                    (Type.function
                         [ Type.function
                             [ Type.var "a", Type.var "b", Type.var "c" ]
                             (Type.var "d")
                         , Type.triple
                             (Type.var "a")
                             (Type.var "b")
                             (Type.var "c")
                         ]
                         (Type.var "d")
                    )
            }
    , sortWith =
        Elm.value
            { importFrom = [ "Triple", "Extra" ]
            , name = "sortWith"
            , annotation =
                Just
                    (Type.function
                         [ Type.function
                             [ Type.var "a", Type.var "a" ]
                             (Type.namedWith [ "Basics" ] "Order" [])
                         , Type.triple
                             (Type.var "a")
                             (Type.var "a")
                             (Type.var "a")
                         ]
                         (Type.triple
                              (Type.var "a")
                              (Type.var "a")
                              (Type.var "a")
                         )
                    )
            }
    , map =
        Elm.value
            { importFrom = [ "Triple", "Extra" ]
            , name = "map"
            , annotation =
                Just
                    (Type.function
                         [ Type.function [ Type.var "a" ] (Type.var "b")
                         , Type.triple
                             (Type.var "a")
                             (Type.var "a")
                             (Type.var "a")
                         ]
                         (Type.triple
                              (Type.var "b")
                              (Type.var "b")
                              (Type.var "b")
                         )
                    )
            }
    , mapFirst =
        Elm.value
            { importFrom = [ "Triple", "Extra" ]
            , name = "mapFirst"
            , annotation =
                Just
                    (Type.function
                         [ Type.function [ Type.var "a" ] (Type.var "x")
                         , Type.triple
                             (Type.var "a")
                             (Type.var "b")
                             (Type.var "c")
                         ]
                         (Type.triple
                              (Type.var "x")
                              (Type.var "b")
                              (Type.var "c")
                         )
                    )
            }
    , mapSecond =
        Elm.value
            { importFrom = [ "Triple", "Extra" ]
            , name = "mapSecond"
            , annotation =
                Just
                    (Type.function
                         [ Type.function [ Type.var "b" ] (Type.var "x")
                         , Type.triple
                             (Type.var "a")
                             (Type.var "b")
                             (Type.var "c")
                         ]
                         (Type.triple
                              (Type.var "a")
                              (Type.var "x")
                              (Type.var "c")
                         )
                    )
            }
    , mapThird =
        Elm.value
            { importFrom = [ "Triple", "Extra" ]
            , name = "mapThird"
            , annotation =
                Just
                    (Type.function
                         [ Type.function [ Type.var "c" ] (Type.var "x")
                         , Type.triple
                             (Type.var "a")
                             (Type.var "b")
                             (Type.var "c")
                         ]
                         (Type.triple
                              (Type.var "a")
                              (Type.var "b")
                              (Type.var "x")
                         )
                    )
            }
    , toList =
        Elm.value
            { importFrom = [ "Triple", "Extra" ]
            , name = "toList"
            , annotation =
                Just
                    (Type.function
                         [ Type.triple
                             (Type.var "a")
                             (Type.var "a")
                             (Type.var "a")
                         ]
                         (Type.list (Type.var "a"))
                    )
            }
    }