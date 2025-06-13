module Gen.List.Extra exposing
    ( moduleName_, last, init, getAt, cons, uncons
    , unconsLast, push, appendTo, prependTo, maximumBy, maximumWith, minimumBy
    , minimumWith, andMap, andThen, reverseMap, takeWhile, dropWhile, unique
    , uniqueBy, allDifferent, allDifferentBy, setIf, setAt, remove, updateIf
    , updateAt, updateIfIndex, removeAt, removeIfIndex, removeWhen, swapAt, stableSortWith
    , intercalate, transpose, subsequences, permutations, interweave, cartesianProduct, uniquePairs
    , foldl1, foldr1, indexedFoldl, indexedFoldr, stoppableFoldl, scanl, scanl1
    , scanr, scanr1, mapAccuml, mapAccumr, unfoldr, iterate, initialize
    , cycle, reverseRange, splitAt, splitWhen, takeWhileRight, dropWhileRight, span
    , break, stripPrefix, group, groupWhile, inits, tails, conditional
    , select, selectSplit, gatherEquals, gatherEqualsBy, gatherWith, subsequencesNonEmpty, frequencies
    , isPrefixOf, isSuffixOf, isInfixOf, isSubsequenceOf, isPermutationOf, notMember, find
    , elemIndex, elemIndices, findIndex, findIndices, findMap, count, zip
    , zip3, lift2, lift3, lift4, groupsOf, groupsOfWithStep, groupsOfVarying
    , greedyGroupsOf, greedyGroupsOfWithStep, joinOn, annotation_, make_, caseOf_, call_
    , values_
    )

{-|
# Generated bindings for List.Extra

@docs moduleName_, last, init, getAt, cons, uncons
@docs unconsLast, push, appendTo, prependTo, maximumBy, maximumWith
@docs minimumBy, minimumWith, andMap, andThen, reverseMap, takeWhile
@docs dropWhile, unique, uniqueBy, allDifferent, allDifferentBy, setIf
@docs setAt, remove, updateIf, updateAt, updateIfIndex, removeAt
@docs removeIfIndex, removeWhen, swapAt, stableSortWith, intercalate, transpose
@docs subsequences, permutations, interweave, cartesianProduct, uniquePairs, foldl1
@docs foldr1, indexedFoldl, indexedFoldr, stoppableFoldl, scanl, scanl1
@docs scanr, scanr1, mapAccuml, mapAccumr, unfoldr, iterate
@docs initialize, cycle, reverseRange, splitAt, splitWhen, takeWhileRight
@docs dropWhileRight, span, break, stripPrefix, group, groupWhile
@docs inits, tails, conditional, select, selectSplit, gatherEquals
@docs gatherEqualsBy, gatherWith, subsequencesNonEmpty, frequencies, isPrefixOf, isSuffixOf
@docs isInfixOf, isSubsequenceOf, isPermutationOf, notMember, find, elemIndex
@docs elemIndices, findIndex, findIndices, findMap, count, zip
@docs zip3, lift2, lift3, lift4, groupsOf, groupsOfWithStep
@docs groupsOfVarying, greedyGroupsOf, greedyGroupsOfWithStep, joinOn, annotation_, make_
@docs caseOf_, call_, values_
-}


import Elm
import Elm.Annotation as Type
import Elm.Arg
import Elm.Case


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "List", "Extra" ]


{-| Extract the last element of a list.

    last [ 1, 2, 3 ]
    --> Just 3

    last []
    --> Nothing

last: List a -> Maybe a
-}
last : List Elm.Expression -> Elm.Expression
last lastArg_ =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "last"
             , annotation =
                 Just
                     (Type.function
                          [ Type.list (Type.var "a") ]
                          (Type.maybe (Type.var "a"))
                     )
             }
        )
        [ Elm.list lastArg_ ]


{-| Return all elements of the list except the last one.

    init [ 1, 2, 3 ]
    --> Just [ 1, 2 ]

    init []
    --> Nothing

init: List a -> Maybe (List a)
-}
init : List Elm.Expression -> Elm.Expression
init initArg_ =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "init"
             , annotation =
                 Just
                     (Type.function
                          [ Type.list (Type.var "a") ]
                          (Type.maybe (Type.list (Type.var "a")))
                     )
             }
        )
        [ Elm.list initArg_ ]


{-| Returns `Just` the element at the given index in the list,
or `Nothing` if the index is out of range.

getAt: Int -> List a -> Maybe a
-}
getAt : Int -> List Elm.Expression -> Elm.Expression
getAt getAtArg_ getAtArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "getAt"
             , annotation =
                 Just
                     (Type.function
                          [ Type.int, Type.list (Type.var "a") ]
                          (Type.maybe (Type.var "a"))
                     )
             }
        )
        [ Elm.int getAtArg_, Elm.list getAtArg_0 ]


{-| Adds the first element of the tuple to the head of the list.

    cons (1, [2, 3])
    --> [1, 2, 3]

Useful for dealing with non-empty lists such as produced by `group` and `groupWhile`.

cons: ( a, List a ) -> List a
-}
cons : Elm.Expression -> Elm.Expression
cons consArg_ =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "cons"
             , annotation =
                 Just
                     (Type.function
                          [ Type.tuple (Type.var "a") (Type.list (Type.var "a"))
                          ]
                          (Type.list (Type.var "a"))
                     )
             }
        )
        [ consArg_ ]


{-| Decompose a list into its head and tail. If the list is empty, return `Nothing`. Otherwise, return `Just (x, xs)`, where `x` is head and `xs` is tail.

    uncons [1,2,3]
    --> Just (1, [2,3])

    uncons []
    --> Nothing

uncons: List a -> Maybe ( a, List a )
-}
uncons : List Elm.Expression -> Elm.Expression
uncons unconsArg_ =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "uncons"
             , annotation =
                 Just
                     (Type.function
                          [ Type.list (Type.var "a") ]
                          (Type.maybe
                               (Type.tuple
                                    (Type.var "a")
                                    (Type.list (Type.var "a"))
                               )
                          )
                     )
             }
        )
        [ Elm.list unconsArg_ ]


{-| Decompose a list into its body and last element. If the list is empty, return `Nothing`. Otherwise, return `Just (x, xs)`, where `x` is the last element and `xs` is the body.

    unconsLast [1,2,3]
    --> Just (3, [1,2])

    unconsLast []
    --> Nothing

unconsLast: List a -> Maybe ( a, List a )
-}
unconsLast : List Elm.Expression -> Elm.Expression
unconsLast unconsLastArg_ =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "unconsLast"
             , annotation =
                 Just
                     (Type.function
                          [ Type.list (Type.var "a") ]
                          (Type.maybe
                               (Type.tuple
                                    (Type.var "a")
                                    (Type.list (Type.var "a"))
                               )
                          )
                     )
             }
        )
        [ Elm.list unconsLastArg_ ]


{-| Adds an element to the end of a list. Not terribly efficient, but comes up a lot in UI programming:

    someItems
        |> List.map viewItem
        |> List.Extra.push addNewItemButton
        |> Html.ul []

push: a -> List a -> List a
-}
push : Elm.Expression -> List Elm.Expression -> Elm.Expression
push pushArg_ pushArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "push"
             , annotation =
                 Just
                     (Type.function
                          [ Type.var "a", Type.list (Type.var "a") ]
                          (Type.list (Type.var "a"))
                     )
             }
        )
        [ pushArg_, Elm.list pushArg_0 ]


{-| Append with arguments optimised for pipelines.

    [ 4, 5, 6 ]
        |> List.Extra.appendTo [ 1, 2, 3 ]
        --> [ 4, 5, 6, 1, 2, 3 ]

Useful for pipelined code, where the argument order of `List.append` doesn't quite work.

appendTo: List a -> List a -> List a
-}
appendTo : List Elm.Expression -> List Elm.Expression -> Elm.Expression
appendTo appendToArg_ appendToArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "appendTo"
             , annotation =
                 Just
                     (Type.function
                          [ Type.list (Type.var "a"), Type.list (Type.var "a") ]
                          (Type.list (Type.var "a"))
                     )
             }
        )
        [ Elm.list appendToArg_, Elm.list appendToArg_0 ]


{-| Prepends a list.

    [ 4, 5, 6 ]
        |> List.Extra.prependTo [ 1, 2, 3 ]
        --> [ 1, 2, 3, 4, 5, 6 ]

prependTo: List a -> List a -> List a
-}
prependTo : List Elm.Expression -> List Elm.Expression -> Elm.Expression
prependTo prependToArg_ prependToArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "prependTo"
             , annotation =
                 Just
                     (Type.function
                          [ Type.list (Type.var "a"), Type.list (Type.var "a") ]
                          (Type.list (Type.var "a"))
                     )
             }
        )
        [ Elm.list prependToArg_, Elm.list prependToArg_0 ]


{-| Find the first maximum element in a list using a comparable transformation

maximumBy: (a -> comparable) -> List a -> Maybe a
-}
maximumBy :
    (Elm.Expression -> Elm.Expression) -> List Elm.Expression -> Elm.Expression
maximumBy maximumByArg_ maximumByArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "maximumBy"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function
                              [ Type.var "a" ]
                              (Type.var "comparable")
                          , Type.list (Type.var "a")
                          ]
                          (Type.maybe (Type.var "a"))
                     )
             }
        )
        [ Elm.functionReduced "maximumByUnpack" maximumByArg_
        , Elm.list maximumByArg_0
        ]


{-| Find the first maximum element in a list using a comparison function

    maximumWith compare []
    --> Nothing

    maximumWith
      (\x y -> compare x.val y.val)
      [{id=1, val=1}, {id=2, val=2}, {id=3,val=2}]
    --> Just { id = 2, val = 2 }

maximumWith: (a -> a -> Basics.Order) -> List a -> Maybe a
-}
maximumWith :
    (Elm.Expression -> Elm.Expression -> Elm.Expression)
    -> List Elm.Expression
    -> Elm.Expression
maximumWith maximumWithArg_ maximumWithArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "maximumWith"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function
                              [ Type.var "a", Type.var "a" ]
                              (Type.namedWith [ "Basics" ] "Order" [])
                          , Type.list (Type.var "a")
                          ]
                          (Type.maybe (Type.var "a"))
                     )
             }
        )
        [ Elm.functionReduced
            "maximumWithUnpack"
            (\functionReducedUnpack ->
               Elm.functionReduced
                   "unpack"
                   (maximumWithArg_ functionReducedUnpack)
            )
        , Elm.list maximumWithArg_0
        ]


{-| Find the first minimum element in a list using a comparable transformation

minimumBy: (a -> comparable) -> List a -> Maybe a
-}
minimumBy :
    (Elm.Expression -> Elm.Expression) -> List Elm.Expression -> Elm.Expression
minimumBy minimumByArg_ minimumByArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "minimumBy"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function
                              [ Type.var "a" ]
                              (Type.var "comparable")
                          , Type.list (Type.var "a")
                          ]
                          (Type.maybe (Type.var "a"))
                     )
             }
        )
        [ Elm.functionReduced "minimumByUnpack" minimumByArg_
        , Elm.list minimumByArg_0
        ]


{-| Find the first minimum element in a list using a comparison function

    minimumWith compare []
    --> Nothing
    minimumWith
      (\x y -> compare x.val y.val)
      [{id=1, val=2}, {id=2, val=1}, {id=3,val=1}]
    --> Just { id = 2, val = 1 }

minimumWith: (a -> a -> Basics.Order) -> List a -> Maybe a
-}
minimumWith :
    (Elm.Expression -> Elm.Expression -> Elm.Expression)
    -> List Elm.Expression
    -> Elm.Expression
minimumWith minimumWithArg_ minimumWithArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "minimumWith"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function
                              [ Type.var "a", Type.var "a" ]
                              (Type.namedWith [ "Basics" ] "Order" [])
                          , Type.list (Type.var "a")
                          ]
                          (Type.maybe (Type.var "a"))
                     )
             }
        )
        [ Elm.functionReduced
            "minimumWithUnpack"
            (\functionReducedUnpack ->
               Elm.functionReduced
                   "unpack"
                   (minimumWithArg_ functionReducedUnpack)
            )
        , Elm.list minimumWithArg_0
        ]


{-| Map functions taking multiple arguments over multiple lists. Each list should be of the same length.

    toIntFunctions : List (Float -> Int)
    toIntFunctions =
        [ round
        , floor
        , ceiling
        , truncate
        ]

    toIntFunctions
        |> andMap [ -1.5, -1.5, -1.5, -1.5 ]
        --> [ -1, -2, -1, -1 ]


    math : List (Int -> Int)
    math =
        [ (+) 1
        , (*) 2
        , (*) 3 >> (+) 1
        ]

    math
        |> andMap [ 1, 2, 3 ]
        --> [ 2, 4, 10 ]

andMap: List a -> List (a -> b) -> List b
-}
andMap : List Elm.Expression -> List Elm.Expression -> Elm.Expression
andMap andMapArg_ andMapArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "andMap"
             , annotation =
                 Just
                     (Type.function
                          [ Type.list (Type.var "a")
                          , Type.list
                              (Type.function [ Type.var "a" ] (Type.var "b"))
                          ]
                          (Type.list (Type.var "b"))
                     )
             }
        )
        [ Elm.list andMapArg_, Elm.list andMapArg_0 ]


{-| Equivalent to `concatMap`. For example, suppose you want to have a cartesian product of [1,2] and [3,4]:

    [ 1, 2 ]
        |> andThen
            (\x ->
                [ 3, 4 ]
                    |> andThen (\y -> [ ( x, y ) ])
            )
        --> [ ( 1, 3 ), ( 1, 4 ), ( 2, 3 ), ( 2, 4 ) ]

Now suppose we want to have a cartesian product between the first list and the second list and its doubles:

    [ 1, 2 ]
        |> andThen
            (\x ->
                [ 3, 4 ]
                    |> andThen
                        (\y ->
                            [ y, y * 2 ]
                                |> andThen (\z -> [ ( x, z ) ])
                        )
            )
        --> [ ( 1, 3 ), ( 1, 6 ), ( 1, 4 ), ( 1, 8 ), ( 2, 3 ), ( 2, 6 ), ( 2, 4 ), ( 2, 8 )]

Advanced functional programmers will recognize this as the implementation of bind operator (>>=) for lists from the `Monad` typeclass.

andThen: (a -> List b) -> List a -> List b
-}
andThen :
    (Elm.Expression -> Elm.Expression) -> List Elm.Expression -> Elm.Expression
andThen andThenArg_ andThenArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "andThen"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function
                              [ Type.var "a" ]
                              (Type.list (Type.var "b"))
                          , Type.list (Type.var "a")
                          ]
                          (Type.list (Type.var "b"))
                     )
             }
        )
        [ Elm.functionReduced "andThenUnpack" andThenArg_
        , Elm.list andThenArg_0
        ]


{-| `reverseMap f xs` gives the same result as `List.reverse (List.map f xs)`,
but is tail-recursive and slightly more efficient.

    reverseMap sqrt [ 1, 4, 9 ]
    --> [ 3, 2, 1 ]

reverseMap: (a -> b) -> List a -> List b
-}
reverseMap :
    (Elm.Expression -> Elm.Expression) -> List Elm.Expression -> Elm.Expression
reverseMap reverseMapArg_ reverseMapArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "reverseMap"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function [ Type.var "a" ] (Type.var "b")
                          , Type.list (Type.var "a")
                          ]
                          (Type.list (Type.var "b"))
                     )
             }
        )
        [ Elm.functionReduced "reverseMapUnpack" reverseMapArg_
        , Elm.list reverseMapArg_0
        ]


{-| Take elements in order as long as the predicate evaluates to `True`

takeWhile: (a -> Bool) -> List a -> List a
-}
takeWhile :
    (Elm.Expression -> Elm.Expression) -> List Elm.Expression -> Elm.Expression
takeWhile takeWhileArg_ takeWhileArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "takeWhile"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function [ Type.var "a" ] Type.bool
                          , Type.list (Type.var "a")
                          ]
                          (Type.list (Type.var "a"))
                     )
             }
        )
        [ Elm.functionReduced "takeWhileUnpack" takeWhileArg_
        , Elm.list takeWhileArg_0
        ]


{-| Drop elements in order as long as the predicate evaluates to `True`

dropWhile: (a -> Bool) -> List a -> List a
-}
dropWhile :
    (Elm.Expression -> Elm.Expression) -> List Elm.Expression -> Elm.Expression
dropWhile dropWhileArg_ dropWhileArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "dropWhile"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function [ Type.var "a" ] Type.bool
                          , Type.list (Type.var "a")
                          ]
                          (Type.list (Type.var "a"))
                     )
             }
        )
        [ Elm.functionReduced "dropWhileUnpack" dropWhileArg_
        , Elm.list dropWhileArg_0
        ]


{-| Remove duplicate values, keeping the first instance of each element which appears more than once.

    unique [ 0, 1, 1, 0, 1 ]
    --> [ 0, 1 ]

unique: List a -> List a
-}
unique : List Elm.Expression -> Elm.Expression
unique uniqueArg_ =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "unique"
             , annotation =
                 Just
                     (Type.function
                          [ Type.list (Type.var "a") ]
                          (Type.list (Type.var "a"))
                     )
             }
        )
        [ Elm.list uniqueArg_ ]


{-| Drop duplicates where what is considered to be a duplicate is the result of first applying the supplied function to the elements of the list.

uniqueBy: (a -> b) -> List a -> List a
-}
uniqueBy :
    (Elm.Expression -> Elm.Expression) -> List Elm.Expression -> Elm.Expression
uniqueBy uniqueByArg_ uniqueByArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "uniqueBy"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function [ Type.var "a" ] (Type.var "b")
                          , Type.list (Type.var "a")
                          ]
                          (Type.list (Type.var "a"))
                     )
             }
        )
        [ Elm.functionReduced "uniqueByUnpack" uniqueByArg_
        , Elm.list uniqueByArg_0
        ]


{-| Indicate if list has duplicate values.

    allDifferent [ 0, 1, 1, 0, 1 ]
    --> False

    allDifferent [ 0, 1, 2]
    --> True

allDifferent: List a -> Bool
-}
allDifferent : List Elm.Expression -> Elm.Expression
allDifferent allDifferentArg_ =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "allDifferent"
             , annotation =
                 Just (Type.function [ Type.list (Type.var "a") ] Type.bool)
             }
        )
        [ Elm.list allDifferentArg_ ]


{-| Indicate if list has duplicate values when supplied function are applied on each values.

allDifferentBy: (a -> b) -> List a -> Bool
-}
allDifferentBy :
    (Elm.Expression -> Elm.Expression) -> List Elm.Expression -> Elm.Expression
allDifferentBy allDifferentByArg_ allDifferentByArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "allDifferentBy"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function [ Type.var "a" ] (Type.var "b")
                          , Type.list (Type.var "a")
                          ]
                          Type.bool
                     )
             }
        )
        [ Elm.functionReduced "allDifferentByUnpack" allDifferentByArg_
        , Elm.list allDifferentByArg_0
        ]


{-| Replace all values that satisfy a predicate with a replacement value.

setIf: (a -> Bool) -> a -> List a -> List a
-}
setIf :
    (Elm.Expression -> Elm.Expression)
    -> Elm.Expression
    -> List Elm.Expression
    -> Elm.Expression
setIf setIfArg_ setIfArg_0 setIfArg_1 =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "setIf"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function [ Type.var "a" ] Type.bool
                          , Type.var "a"
                          , Type.list (Type.var "a")
                          ]
                          (Type.list (Type.var "a"))
                     )
             }
        )
        [ Elm.functionReduced "setIfUnpack" setIfArg_
        , setIfArg_0
        , Elm.list setIfArg_1
        ]


{-| Set a value in a list by index. Return the original list if the index is out of range.

    setAt 0 42 [ 1, 2, 3 ]
    --> [ 42, 2, 3 ]

setAt: Int -> a -> List a -> List a
-}
setAt : Int -> Elm.Expression -> List Elm.Expression -> Elm.Expression
setAt setAtArg_ setAtArg_0 setAtArg_1 =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "setAt"
             , annotation =
                 Just
                     (Type.function
                          [ Type.int, Type.var "a", Type.list (Type.var "a") ]
                          (Type.list (Type.var "a"))
                     )
             }
        )
        [ Elm.int setAtArg_, setAtArg_0, Elm.list setAtArg_1 ]


{-| Remove the first occurrence of a value from a list.

remove: a -> List a -> List a
-}
remove : Elm.Expression -> List Elm.Expression -> Elm.Expression
remove removeArg_ removeArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "remove"
             , annotation =
                 Just
                     (Type.function
                          [ Type.var "a", Type.list (Type.var "a") ]
                          (Type.list (Type.var "a"))
                     )
             }
        )
        [ removeArg_, Elm.list removeArg_0 ]


{-| Replace all values that satisfy a predicate by calling an update function.

updateIf: (a -> Bool) -> (a -> a) -> List a -> List a
-}
updateIf :
    (Elm.Expression -> Elm.Expression)
    -> (Elm.Expression -> Elm.Expression)
    -> List Elm.Expression
    -> Elm.Expression
updateIf updateIfArg_ updateIfArg_0 updateIfArg_1 =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "updateIf"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function [ Type.var "a" ] Type.bool
                          , Type.function [ Type.var "a" ] (Type.var "a")
                          , Type.list (Type.var "a")
                          ]
                          (Type.list (Type.var "a"))
                     )
             }
        )
        [ Elm.functionReduced "updateIfUnpack" updateIfArg_
        , Elm.functionReduced "updateIfUnpack" updateIfArg_0
        , Elm.list updateIfArg_1
        ]


{-| Replace a value at a specific index by calling an update function. Return the original list if the index is out of range.

    updateAt 0 ((+) 1) [ 1, 2, 3 ]
    --> [ 2, 2, 3 ]

See also `updateIfIndex`.

updateAt: Int -> (a -> a) -> List a -> List a
-}
updateAt :
    Int
    -> (Elm.Expression -> Elm.Expression)
    -> List Elm.Expression
    -> Elm.Expression
updateAt updateAtArg_ updateAtArg_0 updateAtArg_1 =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "updateAt"
             , annotation =
                 Just
                     (Type.function
                          [ Type.int
                          , Type.function [ Type.var "a" ] (Type.var "a")
                          , Type.list (Type.var "a")
                          ]
                          (Type.list (Type.var "a"))
                     )
             }
        )
        [ Elm.int updateAtArg_
        , Elm.functionReduced "updateAtUnpack" updateAtArg_0
        , Elm.list updateAtArg_1
        ]


{-| Replace a value at an index that satisfies a predicate, by calling an update function.

    updateIfIndex ((==) 2) ((+) 1) [ 1, 2, 3 ]
    --> [ 1, 2, 4 ]

See also `updateAt`.

updateIfIndex: (Int -> Bool) -> (a -> a) -> List a -> List a
-}
updateIfIndex :
    (Elm.Expression -> Elm.Expression)
    -> (Elm.Expression -> Elm.Expression)
    -> List Elm.Expression
    -> Elm.Expression
updateIfIndex updateIfIndexArg_ updateIfIndexArg_0 updateIfIndexArg_1 =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "updateIfIndex"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function [ Type.int ] Type.bool
                          , Type.function [ Type.var "a" ] (Type.var "a")
                          , Type.list (Type.var "a")
                          ]
                          (Type.list (Type.var "a"))
                     )
             }
        )
        [ Elm.functionReduced "updateIfIndexUnpack" updateIfIndexArg_
        , Elm.functionReduced "updateIfIndexUnpack" updateIfIndexArg_0
        , Elm.list updateIfIndexArg_1
        ]


{-| Remove the element at an index from a list. Return the original list if the index is out of range.

    removeAt 0 [ 1, 2, 3 ]
    --> [ 2, 3 ]

See also `removeIfIndex`.

removeAt: Int -> List a -> List a
-}
removeAt : Int -> List Elm.Expression -> Elm.Expression
removeAt removeAtArg_ removeAtArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "removeAt"
             , annotation =
                 Just
                     (Type.function
                          [ Type.int, Type.list (Type.var "a") ]
                          (Type.list (Type.var "a"))
                     )
             }
        )
        [ Elm.int removeAtArg_, Elm.list removeAtArg_0 ]


{-| Remove an element at an index that satisfies a predicate.

    removeIfIndex ((==) 2) [ 1, 2, 3 ]
    --> [ 1, 2 ]

See also `removeAt`.

removeIfIndex: (Int -> Bool) -> List a -> List a
-}
removeIfIndex :
    (Elm.Expression -> Elm.Expression) -> List Elm.Expression -> Elm.Expression
removeIfIndex removeIfIndexArg_ removeIfIndexArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "removeIfIndex"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function [ Type.int ] Type.bool
                          , Type.list (Type.var "a")
                          ]
                          (Type.list (Type.var "a"))
                     )
             }
        )
        [ Elm.functionReduced "removeIfIndexUnpack" removeIfIndexArg_
        , Elm.list removeIfIndexArg_0
        ]


{-| Take a predicate and a list, and return a list that contains elements which fails to satisfy the predicate.
This is equivalent to `List.filter (not << predicate) list`.

    isEven : Int -> Bool
    isEven i =
        modBy 2 i == 0

    removeWhen isEven [ 1, 2, 3, 4 ]
    --> [ 1, 3 ]

removeWhen: (a -> Bool) -> List a -> List a
-}
removeWhen :
    (Elm.Expression -> Elm.Expression) -> List Elm.Expression -> Elm.Expression
removeWhen removeWhenArg_ removeWhenArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "removeWhen"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function [ Type.var "a" ] Type.bool
                          , Type.list (Type.var "a")
                          ]
                          (Type.list (Type.var "a"))
                     )
             }
        )
        [ Elm.functionReduced "removeWhenUnpack" removeWhenArg_
        , Elm.list removeWhenArg_0
        ]


{-| Swap two values in a list by index. Return the original list if the index is out of range.
If the same index is supplied twice the operation has no effect.

    swapAt 1 2 [ 1, 2, 3 ]
    --> [ 1, 3, 2 ]

swapAt: Int -> Int -> List a -> List a
-}
swapAt : Int -> Int -> List Elm.Expression -> Elm.Expression
swapAt swapAtArg_ swapAtArg_0 swapAtArg_1 =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "swapAt"
             , annotation =
                 Just
                     (Type.function
                          [ Type.int, Type.int, Type.list (Type.var "a") ]
                          (Type.list (Type.var "a"))
                     )
             }
        )
        [ Elm.int swapAtArg_, Elm.int swapAtArg_0, Elm.list swapAtArg_1 ]


{-| Similar to List.sortWith, this sorts values with a custom comparison function.
Unlike List.sortWith, this sort is guaranteed to be a stable sort.
Note that List.sortWith is faster and is preferred if sort stability is not required.

stableSortWith: (a -> a -> Basics.Order) -> List a -> List a
-}
stableSortWith :
    (Elm.Expression -> Elm.Expression -> Elm.Expression)
    -> List Elm.Expression
    -> Elm.Expression
stableSortWith stableSortWithArg_ stableSortWithArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "stableSortWith"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function
                              [ Type.var "a", Type.var "a" ]
                              (Type.namedWith [ "Basics" ] "Order" [])
                          , Type.list (Type.var "a")
                          ]
                          (Type.list (Type.var "a"))
                     )
             }
        )
        [ Elm.functionReduced
            "stableSortWithUnpack"
            (\functionReducedUnpack ->
               Elm.functionReduced
                   "unpack"
                   (stableSortWithArg_ functionReducedUnpack)
            )
        , Elm.list stableSortWithArg_0
        ]


{-| Take a list and a list of lists, insert that list between every list in the list of lists, concatenate the result. `intercalate xs xss` is equivalent to `concat (intersperse xs xss)`.

    intercalate [ 0, 0 ] [ [ 1, 2 ], [ 3, 4 ], [ 5, 6 ] ]
    --> [ 1, 2, 0, 0, 3, 4, 0, 0, 5, 6 ]

intercalate: List a -> List (List a) -> List a
-}
intercalate :
    List Elm.Expression -> List (List Elm.Expression) -> Elm.Expression
intercalate intercalateArg_ intercalateArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "intercalate"
             , annotation =
                 Just
                     (Type.function
                          [ Type.list (Type.var "a")
                          , Type.list (Type.list (Type.var "a"))
                          ]
                          (Type.list (Type.var "a"))
                     )
             }
        )
        [ Elm.list intercalateArg_
        , Elm.list (List.map Elm.list intercalateArg_0)
        ]


{-| Transpose rows and columns of the list of lists.

    transpose [ [ 1, 2, 3 ], [ 4, 5, 6 ] ]
    --> [ [ 1, 4 ], [ 2, 5 ], [ 3, 6 ] ]

    transpose [ [ 10, 11 ], [ 20, 40 ], [ 30, 31, 32, 400 ] ]
    --> [ [ 10, 20, 30 ], [ 11, 40, 31 ] ]

transpose: List (List a) -> List (List a)
-}
transpose : List (List Elm.Expression) -> Elm.Expression
transpose transposeArg_ =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "transpose"
             , annotation =
                 Just
                     (Type.function
                          [ Type.list (Type.list (Type.var "a")) ]
                          (Type.list (Type.list (Type.var "a")))
                     )
             }
        )
        [ Elm.list (List.map Elm.list transposeArg_) ]


{-| Return the list of all subsequences of a list.

    subsequences [ 1, 2, 3 ]
    --> [ [], [ 1 ], [ 2 ], [ 1, 2 ], [ 3 ], [ 1, 3 ], [ 2, 3 ], [ 1, 2, 3 ] ]

subsequences: List a -> List (List a)
-}
subsequences : List Elm.Expression -> Elm.Expression
subsequences subsequencesArg_ =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "subsequences"
             , annotation =
                 Just
                     (Type.function
                          [ Type.list (Type.var "a") ]
                          (Type.list (Type.list (Type.var "a")))
                     )
             }
        )
        [ Elm.list subsequencesArg_ ]


{-| Return the list of of all permutations of a list. The result is in lexicographic order.

    permutations [ 1, 2, 3 ]
    --> [ [ 1, 2, 3 ], [ 1, 3, 2 ], [ 2, 1, 3 ], [ 2, 3, 1 ], [ 3, 1, 2 ], [ 3, 2, 1 ] ]

permutations: List a -> List (List a)
-}
permutations : List Elm.Expression -> Elm.Expression
permutations permutationsArg_ =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "permutations"
             , annotation =
                 Just
                     (Type.function
                          [ Type.list (Type.var "a") ]
                          (Type.list (Type.list (Type.var "a")))
                     )
             }
        )
        [ Elm.list permutationsArg_ ]


{-| Return a list that contains elements from the two provided, in alternate order.
If one list runs out of items, append the items from the remaining list.

    interweave [ 1, 3 ] [ 2, 4 ]
    --> [ 1, 2, 3, 4 ]

    interweave [ 1, 3, 5, 7 ] [ 2, 4 ]
    --> [ 1, 2, 3, 4, 5, 7 ]

    interweave [ 4, 9, 16 ] [ 2, 3, 5, 7 ]
    --> [ 4, 2, 9, 3, 16, 5, 7 ]

interweave: List a -> List a -> List a
-}
interweave : List Elm.Expression -> List Elm.Expression -> Elm.Expression
interweave interweaveArg_ interweaveArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "interweave"
             , annotation =
                 Just
                     (Type.function
                          [ Type.list (Type.var "a"), Type.list (Type.var "a") ]
                          (Type.list (Type.var "a"))
                     )
             }
        )
        [ Elm.list interweaveArg_, Elm.list interweaveArg_0 ]


{-| Return the cartesian product of a list of lists.
If one list is empty, the result is an empty list.
If the list of lists is empty, the result is an empty singleton.

    cartesianProduct [ [ 1, 2 ], [ 3, 4, 5 ], [ 6 ] ]
    --> [ [ 1, 3, 6 ], [ 1, 4, 6 ], [ 1, 5, 6 ], [ 2, 3, 6 ], [ 2, 4, 6 ], [ 2, 5, 6 ] ]

    cartesianProduct [ [ 1, 2 ] ]
    --> [ [ 1 ], [ 2 ] ]

    cartesianProduct [ [ 1, 2 ], [], [ 6 ] ]
    --> []

    cartesianProduct [ [] ]
    --> []

    cartesianProduct []
    --> [ [] ]

cartesianProduct: List (List a) -> List (List a)
-}
cartesianProduct : List (List Elm.Expression) -> Elm.Expression
cartesianProduct cartesianProductArg_ =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "cartesianProduct"
             , annotation =
                 Just
                     (Type.function
                          [ Type.list (Type.list (Type.var "a")) ]
                          (Type.list (Type.list (Type.var "a")))
                     )
             }
        )
        [ Elm.list (List.map Elm.list cartesianProductArg_) ]


{-| Return all ways to pair the elements of the list.
(Essentially, enumerate the possible "handshakes.")

The order of the pair elements doesn't matter, so if `(1,2)` is a returned pair,
we don't return `(2,1)`.

In more mathematical terms these are 2-combinations without repetition.

    uniquePairs [ 1, 2, 3, 4 ]
    --> [ ( 1, 2 ), ( 1, 3 ), ( 1, 4 ), ( 2, 3 ), ( 2, 4 ), ( 3, 4 ) ]

In this example, everybody shakes hands with three other people.

uniquePairs: List a -> List ( a, a )
-}
uniquePairs : List Elm.Expression -> Elm.Expression
uniquePairs uniquePairsArg_ =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "uniquePairs"
             , annotation =
                 Just
                     (Type.function
                          [ Type.list (Type.var "a") ]
                          (Type.list (Type.tuple (Type.var "a") (Type.var "a")))
                     )
             }
        )
        [ Elm.list uniquePairsArg_ ]


{-| Variant of `foldl` that has no starting value argument and treats the head of the list as its starting value. If the list is empty, return `Nothing`.

    foldl1 (-) [ 1, 2, 3, 4 ]
    --> Just 2

    foldl1 (++) [ "a", "b", "c" ]
    --> Just "cba"

    foldl1 min []
    --> Nothing

**Note:** This function changed in a major way between version 7.0.0 and 8.0.0 of this package. The function `foldl1` took in 7.0.0 was `b -> a -> b` consistent with the Haskell implementation of `foldl`, but now its `a -> b -> b`, consistent with `List.foldl`. This function behaves differently in a breaking way, even though its type signature is the same.

foldl1: (a -> a -> a) -> List a -> Maybe a
-}
foldl1 :
    (Elm.Expression -> Elm.Expression -> Elm.Expression)
    -> List Elm.Expression
    -> Elm.Expression
foldl1 foldl1Arg_ foldl1Arg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "foldl1"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function
                              [ Type.var "a", Type.var "a" ]
                              (Type.var "a")
                          , Type.list (Type.var "a")
                          ]
                          (Type.maybe (Type.var "a"))
                     )
             }
        )
        [ Elm.functionReduced
            "foldl1Unpack"
            (\functionReducedUnpack ->
               Elm.functionReduced "unpack" (foldl1Arg_ functionReducedUnpack)
            )
        , Elm.list foldl1Arg_0
        ]


{-| Variant of `foldr` that has no starting value argument and treats the last element of the list as its starting value. If the list is empty, return `Nothing`.

    foldr1 (-) [ 1, 2, 3, 4 ]
    --> Just -2

    foldr1 (++) [ "a", "b", "c" ]
    --> Just "abc"

    foldr1 min []
    --> Nothing

foldr1: (a -> a -> a) -> List a -> Maybe a
-}
foldr1 :
    (Elm.Expression -> Elm.Expression -> Elm.Expression)
    -> List Elm.Expression
    -> Elm.Expression
foldr1 foldr1Arg_ foldr1Arg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "foldr1"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function
                              [ Type.var "a", Type.var "a" ]
                              (Type.var "a")
                          , Type.list (Type.var "a")
                          ]
                          (Type.maybe (Type.var "a"))
                     )
             }
        )
        [ Elm.functionReduced
            "foldr1Unpack"
            (\functionReducedUnpack ->
               Elm.functionReduced "unpack" (foldr1Arg_ functionReducedUnpack)
            )
        , Elm.list foldr1Arg_0
        ]


{-| Variant of `foldl` that passes the index of the current element to the step function. `indexedFoldl` is to `List.foldl` as `List.indexedMap` is to `List.map`.

indexedFoldl: (Int -> a -> b -> b) -> b -> List a -> b
-}
indexedFoldl :
    (Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression)
    -> Elm.Expression
    -> List Elm.Expression
    -> Elm.Expression
indexedFoldl indexedFoldlArg_ indexedFoldlArg_0 indexedFoldlArg_1 =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "indexedFoldl"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function
                              [ Type.int, Type.var "a", Type.var "b" ]
                              (Type.var "b")
                          , Type.var "b"
                          , Type.list (Type.var "a")
                          ]
                          (Type.var "b")
                     )
             }
        )
        [ Elm.functionReduced
            "indexedFoldlUnpack"
            (\functionReducedUnpack ->
               Elm.functionReduced
                   "unpack"
                   (\functionReducedUnpack0 ->
                        Elm.functionReduced
                            "unpack"
                            ((indexedFoldlArg_ functionReducedUnpack)
                                 functionReducedUnpack0
                            )
                   )
            )
        , indexedFoldlArg_0
        , Elm.list indexedFoldlArg_1
        ]


{-| Variant of `foldr` that passes the index of the current element to the step function. `indexedFoldr` is to `List.foldr` as `List.indexedMap` is to `List.map`.

indexedFoldr: (Int -> a -> b -> b) -> b -> List a -> b
-}
indexedFoldr :
    (Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression)
    -> Elm.Expression
    -> List Elm.Expression
    -> Elm.Expression
indexedFoldr indexedFoldrArg_ indexedFoldrArg_0 indexedFoldrArg_1 =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "indexedFoldr"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function
                              [ Type.int, Type.var "a", Type.var "b" ]
                              (Type.var "b")
                          , Type.var "b"
                          , Type.list (Type.var "a")
                          ]
                          (Type.var "b")
                     )
             }
        )
        [ Elm.functionReduced
            "indexedFoldrUnpack"
            (\functionReducedUnpack ->
               Elm.functionReduced
                   "unpack"
                   (\functionReducedUnpack0 ->
                        Elm.functionReduced
                            "unpack"
                            ((indexedFoldrArg_ functionReducedUnpack)
                                 functionReducedUnpack0
                            )
                   )
            )
        , indexedFoldrArg_0
        , Elm.list indexedFoldrArg_1
        ]


{-| A `foldl` that can stop early instead of traversing the whole list.

    stoppableFoldl
        (\n acc ->
            if acc >= 50 then
                Stop acc
            else
                Continue (n + acc)
        )
        0
        (List.range 1 10000)
    --> 55

stoppableFoldl: (a -> b -> List.Extra.Step b) -> b -> List a -> b
-}
stoppableFoldl :
    (Elm.Expression -> Elm.Expression -> Elm.Expression)
    -> Elm.Expression
    -> List Elm.Expression
    -> Elm.Expression
stoppableFoldl stoppableFoldlArg_ stoppableFoldlArg_0 stoppableFoldlArg_1 =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "stoppableFoldl"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function
                              [ Type.var "a", Type.var "b" ]
                              (Type.namedWith
                                 [ "List", "Extra" ]
                                 "Step"
                                 [ Type.var "b" ]
                              )
                          , Type.var "b"
                          , Type.list (Type.var "a")
                          ]
                          (Type.var "b")
                     )
             }
        )
        [ Elm.functionReduced
            "stoppableFoldlUnpack"
            (\functionReducedUnpack ->
               Elm.functionReduced
                   "unpack"
                   (stoppableFoldlArg_ functionReducedUnpack)
            )
        , stoppableFoldlArg_0
        , Elm.list stoppableFoldlArg_1
        ]


{-| Reduce a list from the left, building up all of the intermediate results into a list.

    scanl (+) 0 [ 1, 2, 3, 4 ]
    --> [ 0, 1, 3, 6, 10 ]

scanl: (a -> b -> b) -> b -> List a -> List b
-}
scanl :
    (Elm.Expression -> Elm.Expression -> Elm.Expression)
    -> Elm.Expression
    -> List Elm.Expression
    -> Elm.Expression
scanl scanlArg_ scanlArg_0 scanlArg_1 =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "scanl"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function
                              [ Type.var "a", Type.var "b" ]
                              (Type.var "b")
                          , Type.var "b"
                          , Type.list (Type.var "a")
                          ]
                          (Type.list (Type.var "b"))
                     )
             }
        )
        [ Elm.functionReduced
            "scanlUnpack"
            (\functionReducedUnpack ->
               Elm.functionReduced "unpack" (scanlArg_ functionReducedUnpack)
            )
        , scanlArg_0
        , Elm.list scanlArg_1
        ]


{-| `scanl1` is a variant of `scanl` that has no starting value argument.

Compare:

    scanl (+) 0 [ 1, 2, 3 ]
    --> [ 0, 1, 3, 6 ]

    scanl1 (+) [ 1, 2, 3 ]
    --> [ 1, 3, 6 ]

    scanl (-) 0 [ 1, 2, 3 ]
    --> [ 0, 1, 1, 2 ]

    scanl1 (-) [ 1, 2, 3 ]
    --> [ 1, 1, 2 ]

scanl1: (a -> a -> a) -> List a -> List a
-}
scanl1 :
    (Elm.Expression -> Elm.Expression -> Elm.Expression)
    -> List Elm.Expression
    -> Elm.Expression
scanl1 scanl1Arg_ scanl1Arg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "scanl1"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function
                              [ Type.var "a", Type.var "a" ]
                              (Type.var "a")
                          , Type.list (Type.var "a")
                          ]
                          (Type.list (Type.var "a"))
                     )
             }
        )
        [ Elm.functionReduced
            "scanl1Unpack"
            (\functionReducedUnpack ->
               Elm.functionReduced "unpack" (scanl1Arg_ functionReducedUnpack)
            )
        , Elm.list scanl1Arg_0
        ]


{-| `scanr` is a right-to-left dual of `scanl`. Note that:

    head (scanr f z xs) == foldr f z xs

Examples:

    scanr (+) 0 [ 1, 2, 3 ]
    --> [ 6, 5, 3, 0 ]

    scanr (-) 0 [ 1, 2, 3 ]
    --> [ 2, -1, 3, 0 ]

scanr: (a -> b -> b) -> b -> List a -> List b
-}
scanr :
    (Elm.Expression -> Elm.Expression -> Elm.Expression)
    -> Elm.Expression
    -> List Elm.Expression
    -> Elm.Expression
scanr scanrArg_ scanrArg_0 scanrArg_1 =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "scanr"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function
                              [ Type.var "a", Type.var "b" ]
                              (Type.var "b")
                          , Type.var "b"
                          , Type.list (Type.var "a")
                          ]
                          (Type.list (Type.var "b"))
                     )
             }
        )
        [ Elm.functionReduced
            "scanrUnpack"
            (\functionReducedUnpack ->
               Elm.functionReduced "unpack" (scanrArg_ functionReducedUnpack)
            )
        , scanrArg_0
        , Elm.list scanrArg_1
        ]


{-| `scanr1` is a variant of `scanr` that has no starting value argument.

    scanr1 (+) [ 1, 2, 3 ]
    --> [ 6, 5, 3 ]

    scanr1 (-) [ 1, 2, 3 ]
    --> [ 2, -1, 3 ]

scanr1: (a -> a -> a) -> List a -> List a
-}
scanr1 :
    (Elm.Expression -> Elm.Expression -> Elm.Expression)
    -> List Elm.Expression
    -> Elm.Expression
scanr1 scanr1Arg_ scanr1Arg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "scanr1"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function
                              [ Type.var "a", Type.var "a" ]
                              (Type.var "a")
                          , Type.list (Type.var "a")
                          ]
                          (Type.list (Type.var "a"))
                     )
             }
        )
        [ Elm.functionReduced
            "scanr1Unpack"
            (\functionReducedUnpack ->
               Elm.functionReduced "unpack" (scanr1Arg_ functionReducedUnpack)
            )
        , Elm.list scanr1Arg_0
        ]


{-| The mapAccuml function behaves like a combination of map and foldl; it applies a
function to each element of a list, passing an accumulating parameter from left to right,
and returning a final value of this accumulator together with the new list.

    mapAccuml f a0 [ x1, x2, x3 ] == ( a3, [ y1, y2, y3 ] )

    --        x1    x2    x3
    --        |     |     |
    --  a0 -- f --- f --- f -> a3
    --        |     |     |
    --        y1    y2    y3

Add a running total to a list of numbers:

    mapAccuml (\a x -> ( a + x, ( x, a + x ) )) 0 [ 2, 4, 8 ]
        --> ( 14, [ ( 2, 2 ), ( 4, 6 ), ( 8, 14 ) ] )

Map number by multiplying with accumulated sum:

    mapAccuml (\a x -> ( a + x, a * x )) 5 [ 2, 4, 8 ]
        --> ( 19, [ 10, 28, 88 ] )

mapAccuml: (a -> b -> ( a, c )) -> a -> List b -> ( a, List c )
-}
mapAccuml :
    (Elm.Expression -> Elm.Expression -> Elm.Expression)
    -> Elm.Expression
    -> List Elm.Expression
    -> Elm.Expression
mapAccuml mapAccumlArg_ mapAccumlArg_0 mapAccumlArg_1 =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "mapAccuml"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function
                              [ Type.var "a", Type.var "b" ]
                              (Type.tuple (Type.var "a") (Type.var "c"))
                          , Type.var "a"
                          , Type.list (Type.var "b")
                          ]
                          (Type.tuple (Type.var "a") (Type.list (Type.var "c")))
                     )
             }
        )
        [ Elm.functionReduced
            "mapAccumlUnpack"
            (\functionReducedUnpack ->
               Elm.functionReduced
                   "unpack"
                   (mapAccumlArg_ functionReducedUnpack)
            )
        , mapAccumlArg_0
        , Elm.list mapAccumlArg_1
        ]


{-| The mapAccumr function behaves like a combination of map and foldr; it applies a
function to each element of a list, passing an accumulating parameter from right to left,
and returning a final value of this accumulator together with the new list.

    mapAccumr f a0 [ x1, x2, x3 ] == ( a3, [ y1, y2, y3 ] )

    --        x1    x2    x3
    --        |     |     |
    --  a3 <- f --- f --- f -- a0
    --        |     |     |
    --        y1    y2    y3

Add a count of remaining elements:

    mapAccumr (\a x -> ( a + 1, ( x, a ) )) 0 [ 2, 4, 8 ]
        --> ( 3, [ ( 2, 2 ), ( 4, 1 ), ( 8, 0 ) ] )

Map number by multiplying with right-to-left accumulated sum:

    mapAccumr (\a x -> ( a + x, a * x )) 5 [ 2, 4, 8 ]
        --> ( 19, [ 34, 52, 40 ] )

mapAccumr: (a -> b -> ( a, c )) -> a -> List b -> ( a, List c )
-}
mapAccumr :
    (Elm.Expression -> Elm.Expression -> Elm.Expression)
    -> Elm.Expression
    -> List Elm.Expression
    -> Elm.Expression
mapAccumr mapAccumrArg_ mapAccumrArg_0 mapAccumrArg_1 =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "mapAccumr"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function
                              [ Type.var "a", Type.var "b" ]
                              (Type.tuple (Type.var "a") (Type.var "c"))
                          , Type.var "a"
                          , Type.list (Type.var "b")
                          ]
                          (Type.tuple (Type.var "a") (Type.list (Type.var "c")))
                     )
             }
        )
        [ Elm.functionReduced
            "mapAccumrUnpack"
            (\functionReducedUnpack ->
               Elm.functionReduced
                   "unpack"
                   (mapAccumrArg_ functionReducedUnpack)
            )
        , mapAccumrArg_0
        , Elm.list mapAccumrArg_1
        ]


{-| The `unfoldr` function is "dual" to `foldr`. `foldr` reduces a list to a summary value, `unfoldr` builds a list from a seed. The function takes a function and a starting element. It applies the function to the element. If the result is `Just (a, b)`, `a` is accumulated and the function is applied to `b`. If the result is `Nothing`, the list accumulated so far is returned.

    subtractOneUntilZero : Int -> Maybe (Int, Int)
    subtractOneUntilZero i =
        if i /= 0 then
            Just (i, i - 1)
        else
            Nothing

    unfoldr subtractOneUntilZero 5
    --> [ 5, 4, 3, 2, 1 ]

unfoldr: (b -> Maybe ( a, b )) -> b -> List a
-}
unfoldr : (Elm.Expression -> Elm.Expression) -> Elm.Expression -> Elm.Expression
unfoldr unfoldrArg_ unfoldrArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "unfoldr"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function
                              [ Type.var "b" ]
                              (Type.maybe
                                 (Type.tuple (Type.var "a") (Type.var "b"))
                              )
                          , Type.var "b"
                          ]
                          (Type.list (Type.var "a"))
                     )
             }
        )
        [ Elm.functionReduced "unfoldrUnpack" unfoldrArg_, unfoldrArg_0 ]


{-| Returns a list of repeated applications of `f`. If `f` returns `Nothing`
the iteration will stop. If it returns `Just y` then `y` will be added to the
list and the iteration will continue with `f y`.

    collatz : Int -> Maybe Int
    collatz n =
        if n == 1 then
            Nothing
        else
            Just <|
                if modBy 2 n == 0 then
                    n // 2
                else
                    3 * n + 1

    iterate collatz 13
    --> [13,40,20,10,5,16,8,4,2,1]

iterate: (a -> Maybe a) -> a -> List a
-}
iterate : (Elm.Expression -> Elm.Expression) -> Elm.Expression -> Elm.Expression
iterate iterateArg_ iterateArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "iterate"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function
                              [ Type.var "a" ]
                              (Type.maybe (Type.var "a"))
                          , Type.var "a"
                          ]
                          (Type.list (Type.var "a"))
                     )
             }
        )
        [ Elm.functionReduced "iterateUnpack" iterateArg_, iterateArg_0 ]


{-| Initialize a list of some length with some function.

`initialize n f` creates a list of length `n` with the element at index `i` initialized to the result of `f i`.

initialize: Int -> (Int -> a) -> List a
-}
initialize : Int -> (Elm.Expression -> Elm.Expression) -> Elm.Expression
initialize initializeArg_ initializeArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "initialize"
             , annotation =
                 Just
                     (Type.function
                          [ Type.int
                          , Type.function [ Type.int ] (Type.var "a")
                          ]
                          (Type.list (Type.var "a"))
                     )
             }
        )
        [ Elm.int initializeArg_
        , Elm.functionReduced "initializeUnpack" initializeArg_0
        ]


{-| Creates a list of the given length whose elements are obtained by cycling
through the elements of the given list. If the given list is empty, the
resulting list will be empty.

    cycle 6 [ 4, 7, 8 ]
    --> [ 4, 7, 8, 4, 7, 8 ]

    cycle 4 [ 'a', 'b', 'c' ]
    --> [ 'a', 'b', 'c', 'a' ]

    cycle 9001 []
    --> []

    cycle 2 [ 1, 2, 3, 4, 5 ]
    --> [ 1, 2 ]

cycle: Int -> List a -> List a
-}
cycle : Int -> List Elm.Expression -> Elm.Expression
cycle cycleArg_ cycleArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "cycle"
             , annotation =
                 Just
                     (Type.function
                          [ Type.int, Type.list (Type.var "a") ]
                          (Type.list (Type.var "a"))
                     )
             }
        )
        [ Elm.int cycleArg_, Elm.list cycleArg_0 ]


{-| Create a list of numbers, every element decreasing by one.
You give the highest and lowest number that should be in the list.
More efficient than calling `List.reverse (List.range lo hi)`

    range 6 3 == [ 6, 5, 4, 3 ]

    range 3 3 == [ 3 ]

    range 3 6 == []

reverseRange: Int -> Int -> List Int
-}
reverseRange : Int -> Int -> Elm.Expression
reverseRange reverseRangeArg_ reverseRangeArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "reverseRange"
             , annotation =
                 Just
                     (Type.function [ Type.int, Type.int ] (Type.list Type.int))
             }
        )
        [ Elm.int reverseRangeArg_, Elm.int reverseRangeArg_0 ]


{-| Take a number and a list, return a tuple of lists, where first part is prefix of the list of length equal the number, and second part is the remainder of the list. `splitAt n xs` is equivalent to `(take n xs, drop n xs)`.

    splitAt 3 [ 1, 2, 3, 4, 5 ]
    --> ( [ 1, 2, 3 ], [ 4, 5 ] )

    splitAt 1 [ 1, 2, 3 ]
    --> ( [ 1 ], [ 2, 3 ] )

    splitAt 3 [ 1, 2, 3 ]
    --> ( [ 1, 2, 3 ], [] )

    splitAt 4 [ 1, 2, 3 ]
    --> ( [ 1, 2, 3 ], [] )

    splitAt 0 [ 1, 2, 3 ]
    --> ( [], [ 1, 2, 3 ] )

    splitAt -1 [ 1, 2, 3 ]
    --> ( [], [ 1, 2, 3 ] )

splitAt: Int -> List a -> ( List a, List a )
-}
splitAt : Int -> List Elm.Expression -> Elm.Expression
splitAt splitAtArg_ splitAtArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "splitAt"
             , annotation =
                 Just
                     (Type.function
                          [ Type.int, Type.list (Type.var "a") ]
                          (Type.tuple
                               (Type.list (Type.var "a"))
                               (Type.list (Type.var "a"))
                          )
                     )
             }
        )
        [ Elm.int splitAtArg_, Elm.list splitAtArg_0 ]


{-| Attempts to split the list at the first element where the given predicate is true. If the predicate is not true for any elements in the list, return nothing. Otherwise, return the split list.

    splitWhen (\n -> n == 3) [ 1, 2, 3, 4, 5 ]
    --> Just ( [ 1, 2 ], [ 3, 4, 5 ] )

    splitWhen (\n -> n == 6) [ 1, 2, 3, 4, 5 ]
    --> Nothing

splitWhen: (a -> Bool) -> List a -> Maybe ( List a, List a )
-}
splitWhen :
    (Elm.Expression -> Elm.Expression) -> List Elm.Expression -> Elm.Expression
splitWhen splitWhenArg_ splitWhenArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "splitWhen"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function [ Type.var "a" ] Type.bool
                          , Type.list (Type.var "a")
                          ]
                          (Type.maybe
                               (Type.tuple
                                    (Type.list (Type.var "a"))
                                    (Type.list (Type.var "a"))
                               )
                          )
                     )
             }
        )
        [ Elm.functionReduced "splitWhenUnpack" splitWhenArg_
        , Elm.list splitWhenArg_0
        ]


{-| Take elements from the right, while predicate still holds.

    takeWhileRight ((<) 5) (List.range 1 10)
    --> [ 6, 7, 8, 9, 10 ]

takeWhileRight: (a -> Bool) -> List a -> List a
-}
takeWhileRight :
    (Elm.Expression -> Elm.Expression) -> List Elm.Expression -> Elm.Expression
takeWhileRight takeWhileRightArg_ takeWhileRightArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "takeWhileRight"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function [ Type.var "a" ] Type.bool
                          , Type.list (Type.var "a")
                          ]
                          (Type.list (Type.var "a"))
                     )
             }
        )
        [ Elm.functionReduced "takeWhileRightUnpack" takeWhileRightArg_
        , Elm.list takeWhileRightArg_0
        ]


{-| Drop elements from the right, while predicate still holds.

    dropWhileRight ((<) 5) (List.range 1 10)
    --> [ 1, 2, 3, 4, 5 ]

dropWhileRight: (a -> Bool) -> List a -> List a
-}
dropWhileRight :
    (Elm.Expression -> Elm.Expression) -> List Elm.Expression -> Elm.Expression
dropWhileRight dropWhileRightArg_ dropWhileRightArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "dropWhileRight"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function [ Type.var "a" ] Type.bool
                          , Type.list (Type.var "a")
                          ]
                          (Type.list (Type.var "a"))
                     )
             }
        )
        [ Elm.functionReduced "dropWhileRightUnpack" dropWhileRightArg_
        , Elm.list dropWhileRightArg_0
        ]


{-| Take a predicate and a list, return a tuple. The first part of the tuple is the longest prefix of that list, for each element of which the predicate holds. The second part of the tuple is the remainder of the list. `span p xs` is equivalent to `(takeWhile p xs, dropWhile p xs)`.

    span ((>) 3) [ 1, 2, 3, 4, 1, 2, 3, 4 ]
    --> ( [ 1, 2 ], [ 3, 4, 1, 2, 3, 4 ] )

    span ((>) 5) [ 1, 2, 3 ]
    --> ( [ 1, 2, 3 ], [] )

    span ((>) 0) [ 1, 2, 3 ]
    --> ( [], [ 1, 2, 3 ] )

span: (a -> Bool) -> List a -> ( List a, List a )
-}
span :
    (Elm.Expression -> Elm.Expression) -> List Elm.Expression -> Elm.Expression
span spanArg_ spanArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "span"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function [ Type.var "a" ] Type.bool
                          , Type.list (Type.var "a")
                          ]
                          (Type.tuple
                               (Type.list (Type.var "a"))
                               (Type.list (Type.var "a"))
                          )
                     )
             }
        )
        [ Elm.functionReduced "spanUnpack" spanArg_, Elm.list spanArg_0 ]


{-| Take a predicate and a list, return a tuple. The first part of the tuple is the longest prefix of that list, for each element of which the predicate _does not_ hold. The second part of the tuple is the remainder of the list. `break p xs` is equivalent to `(takeWhile (not p) xs, dropWhile (not p) xs)`.

    break ((<) 3) [ 1, 2, 3, 4, 1, 2, 3, 4 ]
    --> ( [ 1, 2, 3 ], [ 4, 1, 2, 3, 4 ] )

    break ((>) 5) [ 1, 2, 3 ]
    --> ( [], [ 1, 2, 3 ] )

    break ((<) 5) [ 1, 2, 3 ]
    --> ( [ 1, 2, 3 ], [] )

break: (a -> Bool) -> List a -> ( List a, List a )
-}
break :
    (Elm.Expression -> Elm.Expression) -> List Elm.Expression -> Elm.Expression
break breakArg_ breakArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "break"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function [ Type.var "a" ] Type.bool
                          , Type.list (Type.var "a")
                          ]
                          (Type.tuple
                               (Type.list (Type.var "a"))
                               (Type.list (Type.var "a"))
                          )
                     )
             }
        )
        [ Elm.functionReduced "breakUnpack" breakArg_, Elm.list breakArg_0 ]


{-| Drop the given prefix from the list. If the list doesn't start with that prefix, return `Nothing`.

    stripPrefix [ 1, 2 ] [ 1, 2, 3, 4 ]
    --> Just [ 3, 4 ]

    stripPrefix [ 1, 2, 3 ] [ 1, 2, 3, 4, 5 ]
    --> Just [ 4, 5 ]

    stripPrefix [ 1, 2, 3 ] [ 1, 2, 3 ]
    --> Just []

    stripPrefix [ 1, 2, 3 ] [ 1, 2 ]
    --> Nothing

    stripPrefix [ 3, 2, 1 ] [ 1, 2, 3, 4, 5 ]
    --> Nothing

stripPrefix: List a -> List a -> Maybe (List a)
-}
stripPrefix : List Elm.Expression -> List Elm.Expression -> Elm.Expression
stripPrefix stripPrefixArg_ stripPrefixArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "stripPrefix"
             , annotation =
                 Just
                     (Type.function
                          [ Type.list (Type.var "a"), Type.list (Type.var "a") ]
                          (Type.maybe (Type.list (Type.var "a")))
                     )
             }
        )
        [ Elm.list stripPrefixArg_, Elm.list stripPrefixArg_0 ]


{-| Group similar elements together. `group` is equivalent to `groupWhile (==)`.

    group [ 1, 2, 2, 3, 3, 3, 2, 2, 1 ]
    --> [ (1, []), (2, [ 2 ]), (3, [ 3, 3 ]), (2, [ 2 ]), ( 1,  []) ]

group: List a -> List ( a, List a )
-}
group : List Elm.Expression -> Elm.Expression
group groupArg_ =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "group"
             , annotation =
                 Just
                     (Type.function
                          [ Type.list (Type.var "a") ]
                          (Type.list
                               (Type.tuple
                                    (Type.var "a")
                                    (Type.list (Type.var "a"))
                               )
                          )
                     )
             }
        )
        [ Elm.list groupArg_ ]


{-| Group elements together, using a custom comparison test (`a -> a -> Bool`). Start a new group each time the comparison test doesn't hold for two adjacent elements.

`groupWhile` uses a non-empty list type `(a, List a)` since groups necessarily must have at least one member since they are determined by comparing two members.

    groupWhile
        (==)
        [ 1, 2, 3 ]
    --> [ ( 1, [] ), ( 2, [] ), ( 3, [] ) ]

    groupWhile
        (<)
        [ 1, 2, 3, 2, 4, 1, 3, 2, 1 ]
    --> [ ( 1, [ 2, 3 ] ), ( 2, [ 4 ] ), ( 1, [ 3 ] ), ( 2, [] ), ( 1, [] ) ]

    groupWhile
        (\a b -> a.id == b.id)
        [ { value = 4, id = 9 }, { value = 7, id = 2 }, { value = 1, id = 2 } ]
    --> [ ( { value = 4, id = 9 }, [] ), ( { value = 7, id = 2 }, [ { value = 1, id = 2 } ] ) ]

**Note:**
The behavior of this function has changed between major versions 7 and 8. In version 7 there was `groupWhile` and `groupWhileTransitively`. The behavior of the two was almost identical, however the transitive function was closer to what users found intuitive about grouping. `groupWhileTransitively` has been deleted, and `groupWhile` has been replaced with the version 7s `groupWhileTransitively` behavior. Furthermore the group type was changed from `List a` to the non-empty list type `(a, List a)`. Sorry for any inconvenience this may cause.

groupWhile: (a -> a -> Bool) -> List a -> List ( a, List a )
-}
groupWhile :
    (Elm.Expression -> Elm.Expression -> Elm.Expression)
    -> List Elm.Expression
    -> Elm.Expression
groupWhile groupWhileArg_ groupWhileArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "groupWhile"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function
                              [ Type.var "a", Type.var "a" ]
                              Type.bool
                          , Type.list (Type.var "a")
                          ]
                          (Type.list
                               (Type.tuple
                                    (Type.var "a")
                                    (Type.list (Type.var "a"))
                               )
                          )
                     )
             }
        )
        [ Elm.functionReduced
            "groupWhileUnpack"
            (\functionReducedUnpack ->
               Elm.functionReduced
                   "unpack"
                   (groupWhileArg_ functionReducedUnpack)
            )
        , Elm.list groupWhileArg_0
        ]


{-| Return all initial segments of a list, from shortest to longest, empty list first, the list itself last.

    inits [ 1, 2, 3 ]
    --> [ [], [ 1 ], [ 1, 2 ], [ 1, 2, 3 ] ]

inits: List a -> List (List a)
-}
inits : List Elm.Expression -> Elm.Expression
inits initsArg_ =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "inits"
             , annotation =
                 Just
                     (Type.function
                          [ Type.list (Type.var "a") ]
                          (Type.list (Type.list (Type.var "a")))
                     )
             }
        )
        [ Elm.list initsArg_ ]


{-| Return all final segments of a list, from longest to shortest, the list itself first, empty list last.

    tails [ 1, 2, 3 ]
    --> [ [ 1, 2, 3 ], [ 2, 3 ], [ 3 ], [] ]

tails: List a -> List (List a)
-}
tails : List Elm.Expression -> Elm.Expression
tails tailsArg_ =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "tails"
             , annotation =
                 Just
                     (Type.function
                          [ Type.list (Type.var "a") ]
                          (Type.list (Type.list (Type.var "a")))
                     )
             }
        )
        [ Elm.list tailsArg_ ]


{-| Primary useful with literals in view style code.

Sometimes you want to include attributes conditionally:

    Html.div
        ((if isStylish then
            [ Html.Attributes.class "foo" ]

          else
            [ Html.Attributes.id "bar" ]
         )
            ++ (if isFancy then
                    [ Html.Attribute.attribute "aria-description" "A very fancy div" ]

                else
                    []
               )
        )
        [ Html.text "Hello" ]

But this is quite awkward and verbose. But with this helper you can write:

    Html.div
        (List.Extra.conditional
            [ ( Html.Attributes.class "foo", isStylish )
            , ( Html.Attributes.id "bar", not isStylish )
            , ( Html.Attribute.attribute "aria-description" "A very fancy div", isFancy )
            ]
        )
        [ Html.text "Hello" ]

conditional: List ( a, Bool ) -> List a
-}
conditional : List Elm.Expression -> Elm.Expression
conditional conditionalArg_ =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "conditional"
             , annotation =
                 Just
                     (Type.function
                          [ Type.list (Type.tuple (Type.var "a") Type.bool) ]
                          (Type.list (Type.var "a"))
                     )
             }
        )
        [ Elm.list conditionalArg_ ]


{-| Return all combinations in the form of (element, rest of the list). Read [Haskell Libraries proposal](https://mail.haskell.org/pipermail/libraries/2008-February/009270.html) for further ideas on how to use this function.

    select [ 1, 2, 3, 4 ]
    --> [ ( 1, [ 2, 3, 4 ] ), ( 2, [ 1, 3, 4 ] ), ( 3, [ 1, 2, 4 ] ), ( 4, [ 1, 2, 3 ] ) ]

select: List a -> List ( a, List a )
-}
select : List Elm.Expression -> Elm.Expression
select selectArg_ =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "select"
             , annotation =
                 Just
                     (Type.function
                          [ Type.list (Type.var "a") ]
                          (Type.list
                               (Type.tuple
                                    (Type.var "a")
                                    (Type.list (Type.var "a"))
                               )
                          )
                     )
             }
        )
        [ Elm.list selectArg_ ]


{-| Return all combinations in the form of (elements before, element, elements after).

    selectSplit [ 1, 2, 3 ]
    --> [ ( [], 1, [ 2, 3 ] ), ( [ 1 ], 2, [ 3 ] ), ( [ 1, 2 ], 3, [] ) ]

selectSplit: List a -> List ( List a, a, List a )
-}
selectSplit : List Elm.Expression -> Elm.Expression
selectSplit selectSplitArg_ =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "selectSplit"
             , annotation =
                 Just
                     (Type.function
                          [ Type.list (Type.var "a") ]
                          (Type.list
                               (Type.triple
                                    (Type.list (Type.var "a"))
                                    (Type.var "a")
                                    (Type.list (Type.var "a"))
                               )
                          )
                     )
             }
        )
        [ Elm.list selectSplitArg_ ]


{-| Group equal elements together. This is different from `group` as each sublist
will contain _all_ equal elements of the original list. Elements will be grouped
in the same order as they appear in the original list. The same applies to elements
within each group.

    gatherEquals [1,2,1,3,2]
    --> [(1,[1]),(2,[2]),(3,[])]

gatherEquals: List a -> List ( a, List a )
-}
gatherEquals : List Elm.Expression -> Elm.Expression
gatherEquals gatherEqualsArg_ =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "gatherEquals"
             , annotation =
                 Just
                     (Type.function
                          [ Type.list (Type.var "a") ]
                          (Type.list
                               (Type.tuple
                                    (Type.var "a")
                                    (Type.list (Type.var "a"))
                               )
                          )
                     )
             }
        )
        [ Elm.list gatherEqualsArg_ ]


{-| Group equal elements together. A function is applied to each element of the list
and then the equality check is performed against the results of that function evaluation.
Elements will be grouped in the same order as they appear in the original list. The
same applies to elements within each group.

    gatherEqualsBy .age [{age=25},{age=23},{age=25}]
    --> [({age=25},[{age=25}]),({age=23},[])]

**See also:** [`Dict.Extra.groupBy`](./Dict-Extra#groupBy).

gatherEqualsBy: (a -> b) -> List a -> List ( a, List a )
-}
gatherEqualsBy :
    (Elm.Expression -> Elm.Expression) -> List Elm.Expression -> Elm.Expression
gatherEqualsBy gatherEqualsByArg_ gatherEqualsByArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "gatherEqualsBy"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function [ Type.var "a" ] (Type.var "b")
                          , Type.list (Type.var "a")
                          ]
                          (Type.list
                               (Type.tuple
                                    (Type.var "a")
                                    (Type.list (Type.var "a"))
                               )
                          )
                     )
             }
        )
        [ Elm.functionReduced "gatherEqualsByUnpack" gatherEqualsByArg_
        , Elm.list gatherEqualsByArg_0
        ]


{-| Group equal elements together using a custom equality function. Elements will be
grouped in the same order as they appear in the original list. The same applies to
elements within each group.

    gatherWith (==) [1,2,1,3,2]
    --> [(1,[1]),(2,[2]),(3,[])]

gatherWith: (a -> a -> Bool) -> List a -> List ( a, List a )
-}
gatherWith :
    (Elm.Expression -> Elm.Expression -> Elm.Expression)
    -> List Elm.Expression
    -> Elm.Expression
gatherWith gatherWithArg_ gatherWithArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "gatherWith"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function
                              [ Type.var "a", Type.var "a" ]
                              Type.bool
                          , Type.list (Type.var "a")
                          ]
                          (Type.list
                               (Type.tuple
                                    (Type.var "a")
                                    (Type.list (Type.var "a"))
                               )
                          )
                     )
             }
        )
        [ Elm.functionReduced
            "gatherWithUnpack"
            (\functionReducedUnpack ->
               Elm.functionReduced
                   "unpack"
                   (gatherWithArg_ functionReducedUnpack)
            )
        , Elm.list gatherWithArg_0
        ]


{-| Return the list of all subsequences of the argument, except for the empty list.

    subsequencesNonEmpty [ 1, 2, 3 ]
        == [ [ 1 ], [ 2 ], [ 1, 2 ], [ 3 ], [ 1, 3 ], [ 2, 3 ], [ 1, 2, 3 ] ]

subsequencesNonEmpty: List a -> List ( a, List a )
-}
subsequencesNonEmpty : List Elm.Expression -> Elm.Expression
subsequencesNonEmpty subsequencesNonEmptyArg_ =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "subsequencesNonEmpty"
             , annotation =
                 Just
                     (Type.function
                          [ Type.list (Type.var "a") ]
                          (Type.list
                               (Type.tuple
                                    (Type.var "a")
                                    (Type.list (Type.var "a"))
                               )
                          )
                     )
             }
        )
        [ Elm.list subsequencesNonEmptyArg_ ]


{-| Calculate the number of occurences for each element in a list. Elements
will be ordered ascendingly, then grouped in a tuple with the number of
occurences.

    frequencies [2,1,3,2,3,3]
    --> [(1,1),(2,2),(3,3)]

frequencies: List comparable -> List ( comparable, Int )
-}
frequencies : List Elm.Expression -> Elm.Expression
frequencies frequenciesArg_ =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "frequencies"
             , annotation =
                 Just
                     (Type.function
                          [ Type.list (Type.var "comparable") ]
                          (Type.list
                               (Type.tuple (Type.var "comparable") Type.int)
                          )
                     )
             }
        )
        [ Elm.list frequenciesArg_ ]


{-| Take two lists and return `True`, if the first list is the prefix of the second list.

isPrefixOf: List a -> List a -> Bool
-}
isPrefixOf : List Elm.Expression -> List Elm.Expression -> Elm.Expression
isPrefixOf isPrefixOfArg_ isPrefixOfArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "isPrefixOf"
             , annotation =
                 Just
                     (Type.function
                          [ Type.list (Type.var "a"), Type.list (Type.var "a") ]
                          Type.bool
                     )
             }
        )
        [ Elm.list isPrefixOfArg_, Elm.list isPrefixOfArg_0 ]


{-| Take two lists and return `True`, if the first list is the suffix of the second list.

isSuffixOf: List a -> List a -> Bool
-}
isSuffixOf : List Elm.Expression -> List Elm.Expression -> Elm.Expression
isSuffixOf isSuffixOfArg_ isSuffixOfArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "isSuffixOf"
             , annotation =
                 Just
                     (Type.function
                          [ Type.list (Type.var "a"), Type.list (Type.var "a") ]
                          Type.bool
                     )
             }
        )
        [ Elm.list isSuffixOfArg_, Elm.list isSuffixOfArg_0 ]


{-| Return True if all the elements of the first list occur in-order and
consecutively anywhere within the second.

    isInfixOf [ 5, 7, 11 ] [ 2, 3, 5, 7, 11, 13 ]
    --> True

    isInfixOf [ 5, 7, 13 ] [ 2, 3, 5, 7, 11, 13 ]
    --> False

    isInfixOf [ 3, 5, 2 ] [ 2, 3, 5, 7, 11, 13 ]
    --> False

isInfixOf: List a -> List a -> Bool
-}
isInfixOf : List Elm.Expression -> List Elm.Expression -> Elm.Expression
isInfixOf isInfixOfArg_ isInfixOfArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "isInfixOf"
             , annotation =
                 Just
                     (Type.function
                          [ Type.list (Type.var "a"), Type.list (Type.var "a") ]
                          Type.bool
                     )
             }
        )
        [ Elm.list isInfixOfArg_, Elm.list isInfixOfArg_0 ]


{-| Return True if all the elements of the first list occur, in order, in the
second. The elements do not have to occur consecutively.

    isSubsequenceOf
        [ "E", "l", "m" ]
        [ "E", "a", "t", " ", "l", "i", "m", "e", "s" ]
    --> True

    isSubsequenceOf
        [ "E", "l", "m" ]
        [ "E", "m", "a", "i", "l" ]
    --> False

isSubsequenceOf: List a -> List a -> Bool
-}
isSubsequenceOf : List Elm.Expression -> List Elm.Expression -> Elm.Expression
isSubsequenceOf isSubsequenceOfArg_ isSubsequenceOfArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "isSubsequenceOf"
             , annotation =
                 Just
                     (Type.function
                          [ Type.list (Type.var "a"), Type.list (Type.var "a") ]
                          Type.bool
                     )
             }
        )
        [ Elm.list isSubsequenceOfArg_, Elm.list isSubsequenceOfArg_0 ]


{-| Take two lists and return `True`, if the first list is a permutation of the second list.
In other words: Do the 2 `List`s contain the same elements but in a different order?

    [ 3, 1, 2 ]
        |> isPermutationOf
            [ 1, 2, 3 ]
    --> True

    [ 3, 1, 0 ]
        |> isPermutationOf
            [ 1, 2, 3 ]
    --> False

    [ 3, 1, 2, 2 ]
        |> isPermutationOf
            [ 1, 2, 3 ]
    --> False

isPermutationOf: List a -> List a -> Bool
-}
isPermutationOf : List Elm.Expression -> List Elm.Expression -> Elm.Expression
isPermutationOf isPermutationOfArg_ isPermutationOfArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "isPermutationOf"
             , annotation =
                 Just
                     (Type.function
                          [ Type.list (Type.var "a"), Type.list (Type.var "a") ]
                          Type.bool
                     )
             }
        )
        [ Elm.list isPermutationOfArg_, Elm.list isPermutationOfArg_0 ]


{-| Negation of `member`.

    notMember 1 [ 1, 2, 3 ]
    --> False

    notMember 4 [ 1, 2, 3 ]
    --> True

notMember: a -> List a -> Bool
-}
notMember : Elm.Expression -> List Elm.Expression -> Elm.Expression
notMember notMemberArg_ notMemberArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "notMember"
             , annotation =
                 Just
                     (Type.function
                          [ Type.var "a", Type.list (Type.var "a") ]
                          Type.bool
                     )
             }
        )
        [ notMemberArg_, Elm.list notMemberArg_0 ]


{-| Find the first element that satisfies a predicate and return
Just that element. If none match, return Nothing.

    find (\num -> num > 5) [ 2, 4, 6, 8 ]
    --> Just 6

find: (a -> Bool) -> List a -> Maybe a
-}
find :
    (Elm.Expression -> Elm.Expression) -> List Elm.Expression -> Elm.Expression
find findArg_ findArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "find"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function [ Type.var "a" ] Type.bool
                          , Type.list (Type.var "a")
                          ]
                          (Type.maybe (Type.var "a"))
                     )
             }
        )
        [ Elm.functionReduced "findUnpack" findArg_, Elm.list findArg_0 ]


{-| Return the index of the first occurrence of the element. Otherwise, return `Nothing`. Indexing starts from 0.

    elemIndex 1 [ 1, 2, 3 ]
    --> Just 0

    elemIndex 4 [ 1, 2, 3 ]
    --> Nothing

    elemIndex 1 [ 1, 2, 1 ]
    --> Just 0

elemIndex: a -> List a -> Maybe Int
-}
elemIndex : Elm.Expression -> List Elm.Expression -> Elm.Expression
elemIndex elemIndexArg_ elemIndexArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "elemIndex"
             , annotation =
                 Just
                     (Type.function
                          [ Type.var "a", Type.list (Type.var "a") ]
                          (Type.maybe Type.int)
                     )
             }
        )
        [ elemIndexArg_, Elm.list elemIndexArg_0 ]


{-| Return all indices of occurrences of the element. If element is not found, return empty list. Indexing starts from 0.

    elemIndices 1 [ 1, 2, 3 ]
    --> [ 0 ]

    elemIndices 4 [ 1, 2, 3 ]
    --> []

    elemIndices 1 [ 1, 2, 1 ]
    --> [ 0, 2 ]

elemIndices: a -> List a -> List Int
-}
elemIndices : Elm.Expression -> List Elm.Expression -> Elm.Expression
elemIndices elemIndicesArg_ elemIndicesArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "elemIndices"
             , annotation =
                 Just
                     (Type.function
                          [ Type.var "a", Type.list (Type.var "a") ]
                          (Type.list Type.int)
                     )
             }
        )
        [ elemIndicesArg_, Elm.list elemIndicesArg_0 ]


{-| Take a predicate and a list, return the index of the first element that satisfies the predicate. Otherwise, return `Nothing`. Indexing starts from 0.

    isEven : Int -> Bool
    isEven i =
        modBy 2 i == 0

    findIndex isEven [ 1, 2, 3 ]
    --> Just 1

    findIndex isEven [ 1, 3, 5 ]
    --> Nothing

    findIndex isEven [ 1, 2, 4 ]
    --> Just 1

findIndex: (a -> Bool) -> List a -> Maybe Int
-}
findIndex :
    (Elm.Expression -> Elm.Expression) -> List Elm.Expression -> Elm.Expression
findIndex findIndexArg_ findIndexArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "findIndex"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function [ Type.var "a" ] Type.bool
                          , Type.list (Type.var "a")
                          ]
                          (Type.maybe Type.int)
                     )
             }
        )
        [ Elm.functionReduced "findIndexUnpack" findIndexArg_
        , Elm.list findIndexArg_0
        ]


{-| Take a predicate and a list, return indices of all elements satisfying the predicate. Otherwise, return empty list. Indexing starts from 0.

    isEven : Int -> Bool
    isEven i =
        modBy 2 i == 0

    findIndices isEven [ 1, 2, 3 ]
    --> [ 1 ]

    findIndices isEven [ 1, 3, 5 ]
    --> []

    findIndices isEven [ 1, 2, 4 ]
    --> [ 1, 2 ]

findIndices: (a -> Bool) -> List a -> List Int
-}
findIndices :
    (Elm.Expression -> Elm.Expression) -> List Elm.Expression -> Elm.Expression
findIndices findIndicesArg_ findIndicesArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "findIndices"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function [ Type.var "a" ] Type.bool
                          , Type.list (Type.var "a")
                          ]
                          (Type.list Type.int)
                     )
             }
        )
        [ Elm.functionReduced "findIndicesUnpack" findIndicesArg_
        , Elm.list findIndicesArg_0
        ]


{-| Apply a function that may succeed to values in the list and return the result of the first successful match. If none match, then return Nothing.

    mapOverFive : Int -> Maybe Int
    mapOverFive num =
        if num > 5 then
            Just (num * 2)
        else
            Nothing

    findMap mapOverFive [2, 4, 6, 8]
    --> Just 12

This is particularly useful in cases where you have a complex type in a list, and you need to pick out the the first one

    type alias HouseModel =
        {}

    type Property
        = Rental
        | House HouseModel
        | Commercial

    toHouse : Property -> Maybe HouseModel
    toHouse property =
        case property of
            House house ->
                Just house

            _ ->
                Nothing

    viewFirstHomeOfInterest : Viewer -> List Property -> Html msg
    viewFirstHomeOfInterest viewer propertiesQuery =
        propertiesQuery
            |> findMap toHouse
            |> Maybe.map homeView
            |> Maybe.withDefault noHomeView

findMap: (a -> Maybe b) -> List a -> Maybe b
-}
findMap :
    (Elm.Expression -> Elm.Expression) -> List Elm.Expression -> Elm.Expression
findMap findMapArg_ findMapArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "findMap"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function
                              [ Type.var "a" ]
                              (Type.maybe (Type.var "b"))
                          , Type.list (Type.var "a")
                          ]
                          (Type.maybe (Type.var "b"))
                     )
             }
        )
        [ Elm.functionReduced "findMapUnpack" findMapArg_
        , Elm.list findMapArg_0
        ]


{-| Returns the number of elements in a list that satisfy a given predicate.
Equivalent to `List.length (List.filter pred list)` but more efficient.

    count
        (modBy 2 >> (==) 1) [ 1, 2, 3, 4, 5, 6, 7 ]
    --> 4

    count
        ((==) "yeah")
        [ "She", "loves", "you", "yeah", "yeah", "yeah" ]
    --> 3

count: (a -> Bool) -> List a -> Int
-}
count :
    (Elm.Expression -> Elm.Expression) -> List Elm.Expression -> Elm.Expression
count countArg_ countArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "count"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function [ Type.var "a" ] Type.bool
                          , Type.list (Type.var "a")
                          ]
                          Type.int
                     )
             }
        )
        [ Elm.functionReduced "countUnpack" countArg_, Elm.list countArg_0 ]


{-| Take two lists and returns a list of corresponding pairs

zip: List a -> List b -> List ( a, b )
-}
zip : List Elm.Expression -> List Elm.Expression -> Elm.Expression
zip zipArg_ zipArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "zip"
             , annotation =
                 Just
                     (Type.function
                          [ Type.list (Type.var "a"), Type.list (Type.var "b") ]
                          (Type.list (Type.tuple (Type.var "a") (Type.var "b")))
                     )
             }
        )
        [ Elm.list zipArg_, Elm.list zipArg_0 ]


{-| Take three lists and returns a list of triples

zip3: List a -> List b -> List c -> List ( a, b, c )
-}
zip3 :
    List Elm.Expression
    -> List Elm.Expression
    -> List Elm.Expression
    -> Elm.Expression
zip3 zip3Arg_ zip3Arg_0 zip3Arg_1 =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "zip3"
             , annotation =
                 Just
                     (Type.function
                          [ Type.list (Type.var "a")
                          , Type.list (Type.var "b")
                          , Type.list (Type.var "c")
                          ]
                          (Type.list
                               (Type.triple
                                    (Type.var "a")
                                    (Type.var "b")
                                    (Type.var "c")
                               )
                          )
                     )
             }
        )
        [ Elm.list zip3Arg_, Elm.list zip3Arg_0, Elm.list zip3Arg_1 ]


{-| Map functions taking multiple arguments over multiple lists, regardless of list length.
All possible combinations will be explored.

    lift2 (+) [1,2,3][4,5]
    --> [5,6,6,7,7,8]

lift2: (a -> b -> c) -> List a -> List b -> List c
-}
lift2 :
    (Elm.Expression -> Elm.Expression -> Elm.Expression)
    -> List Elm.Expression
    -> List Elm.Expression
    -> Elm.Expression
lift2 lift2Arg_ lift2Arg_0 lift2Arg_1 =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "lift2"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function
                              [ Type.var "a", Type.var "b" ]
                              (Type.var "c")
                          , Type.list (Type.var "a")
                          , Type.list (Type.var "b")
                          ]
                          (Type.list (Type.var "c"))
                     )
             }
        )
        [ Elm.functionReduced
            "lift2Unpack"
            (\functionReducedUnpack ->
               Elm.functionReduced "unpack" (lift2Arg_ functionReducedUnpack)
            )
        , Elm.list lift2Arg_0
        , Elm.list lift2Arg_1
        ]


{-| Maps a function over three lists, exploring all possible combinations.

lift3: (a -> b -> c -> d) -> List a -> List b -> List c -> List d
-}
lift3 :
    (Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression)
    -> List Elm.Expression
    -> List Elm.Expression
    -> List Elm.Expression
    -> Elm.Expression
lift3 lift3Arg_ lift3Arg_0 lift3Arg_1 lift3Arg_2 =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "lift3"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function
                              [ Type.var "a", Type.var "b", Type.var "c" ]
                              (Type.var "d")
                          , Type.list (Type.var "a")
                          , Type.list (Type.var "b")
                          , Type.list (Type.var "c")
                          ]
                          (Type.list (Type.var "d"))
                     )
             }
        )
        [ Elm.functionReduced
            "lift3Unpack"
            (\functionReducedUnpack ->
               Elm.functionReduced
                   "unpack"
                   (\functionReducedUnpack0 ->
                        Elm.functionReduced
                            "unpack"
                            ((lift3Arg_ functionReducedUnpack)
                                 functionReducedUnpack0
                            )
                   )
            )
        , Elm.list lift3Arg_0
        , Elm.list lift3Arg_1
        , Elm.list lift3Arg_2
        ]


{-| Maps a function over four lists, exploring all possible combinations.

lift4: (a -> b -> c -> d -> e) -> List a -> List b -> List c -> List d -> List e
-}
lift4 :
    (Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression)
    -> List Elm.Expression
    -> List Elm.Expression
    -> List Elm.Expression
    -> List Elm.Expression
    -> Elm.Expression
lift4 lift4Arg_ lift4Arg_0 lift4Arg_1 lift4Arg_2 lift4Arg_3 =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "lift4"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function
                              [ Type.var "a"
                              , Type.var "b"
                              , Type.var "c"
                              , Type.var "d"
                              ]
                              (Type.var "e")
                          , Type.list (Type.var "a")
                          , Type.list (Type.var "b")
                          , Type.list (Type.var "c")
                          , Type.list (Type.var "d")
                          ]
                          (Type.list (Type.var "e"))
                     )
             }
        )
        [ Elm.functionReduced
            "lift4Unpack"
            (\functionReducedUnpack ->
               Elm.functionReduced
                   "unpack"
                   (\functionReducedUnpack0 ->
                        Elm.functionReduced
                            "unpack"
                            (\functionReducedUnpack_2_1_2_0_2_0_2_0_0 ->
                                 Elm.functionReduced
                                     "unpack"
                                     (((lift4Arg_ functionReducedUnpack)
                                           functionReducedUnpack0
                                      )
                                          functionReducedUnpack_2_1_2_0_2_0_2_0_0
                                     )
                            )
                   )
            )
        , Elm.list lift4Arg_0
        , Elm.list lift4Arg_1
        , Elm.list lift4Arg_2
        , Elm.list lift4Arg_3
        ]


{-| Split list into groups of length `size`. If there are not enough elements
to completely fill the last group, it will not be included. This is equivalent
to calling `groupsOfWithStep` with the same `size` and `step`.

    groupsOf 3 (List.range 1 10)
    --> [ [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] ]

groupsOf: Int -> List a -> List (List a)
-}
groupsOf : Int -> List Elm.Expression -> Elm.Expression
groupsOf groupsOfArg_ groupsOfArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "groupsOf"
             , annotation =
                 Just
                     (Type.function
                          [ Type.int, Type.list (Type.var "a") ]
                          (Type.list (Type.list (Type.var "a")))
                     )
             }
        )
        [ Elm.int groupsOfArg_, Elm.list groupsOfArg_0 ]


{-| Split list into groups of length `size` at offsets `step` apart. If there
are not enough elements to completely fill the last group, it will not be
included. (See `greedyGroupsOfWithStep` if you would like the last group to be
included regardless.)

    groupsOfWithStep 4 4 (List.range 1 10)
    --> [ [ 1, 2, 3, 4 ], [ 5, 6, 7, 8 ] ]

    groupsOfWithStep 3 1 (List.range 1 5)
    --> [ [ 1, 2, 3 ], [ 2, 3, 4 ], [ 3, 4, 5 ] ]

    groupsOfWithStep 3 6 (List.range 1 20)
    --> [ [ 1, 2, 3 ], [ 7, 8, 9 ], [ 13, 14, 15 ] ]

If `step == size`, every element (except for perhaps the last few due to the
non-greedy behavior) will appear in exactly one group. If `step < size`, there
will be an overlap between groups. If `step > size`, some elements will be
skipped and not appear in any groups.

groupsOfWithStep: Int -> Int -> List a -> List (List a)
-}
groupsOfWithStep : Int -> Int -> List Elm.Expression -> Elm.Expression
groupsOfWithStep groupsOfWithStepArg_ groupsOfWithStepArg_0 groupsOfWithStepArg_1 =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "groupsOfWithStep"
             , annotation =
                 Just
                     (Type.function
                          [ Type.int, Type.int, Type.list (Type.var "a") ]
                          (Type.list (Type.list (Type.var "a")))
                     )
             }
        )
        [ Elm.int groupsOfWithStepArg_
        , Elm.int groupsOfWithStepArg_0
        , Elm.list groupsOfWithStepArg_1
        ]


{-| `groupsOfVarying ns` takes `n` elements from a list for each `n` in `ns`, splitting the list into variably sized segments

    groupsOfVarying [ 2, 3, 1 ] [ "a", "b", "c", "d", "e", "f" ]
    --> [ [ "a", "b" ], [ "c", "d", "e" ], [ "f" ] ]

    groupsOfVarying [ 2 ] [ "a", "b", "c", "d", "e", "f" ]
    --> [ [ "a", "b" ] ]

    groupsOfVarying [ 2, 3, 1, 5, 6 ] [ "a", "b", "c", "d", "e" ]
    --> [ [ "a", "b" ], [ "c", "d", "e" ] ]

groupsOfVarying: List Int -> List a -> List (List a)
-}
groupsOfVarying : List Int -> List Elm.Expression -> Elm.Expression
groupsOfVarying groupsOfVaryingArg_ groupsOfVaryingArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "groupsOfVarying"
             , annotation =
                 Just
                     (Type.function
                          [ Type.list Type.int, Type.list (Type.var "a") ]
                          (Type.list (Type.list (Type.var "a")))
                     )
             }
        )
        [ Elm.list (List.map Elm.int groupsOfVaryingArg_)
        , Elm.list groupsOfVaryingArg_0
        ]


{-| Greedily split list into groups of length `size`. The last group of
elements will be included regardless of whether there are enough elements in
the list to completely fill it. This is equivalent to calling
`greedyGroupsOfWithStep` with the same `size` and `step`.

    greedyGroupsOf 3 (List.range 1 10)
    --> [ [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ], [ 10 ] ]

greedyGroupsOf: Int -> List a -> List (List a)
-}
greedyGroupsOf : Int -> List Elm.Expression -> Elm.Expression
greedyGroupsOf greedyGroupsOfArg_ greedyGroupsOfArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "greedyGroupsOf"
             , annotation =
                 Just
                     (Type.function
                          [ Type.int, Type.list (Type.var "a") ]
                          (Type.list (Type.list (Type.var "a")))
                     )
             }
        )
        [ Elm.int greedyGroupsOfArg_, Elm.list greedyGroupsOfArg_0 ]


{-| Greedily split list into groups of length `size` at offsets `step` apart.
The last group of elements will be included regardless of whether there are
enough elements in the list to completely fill it. (See `groupsOfWithStep`
for the non-greedy version of this function).

    greedyGroupsOfWithStep 4 4 (List.range 1 10)
    --> [ [ 1, 2, 3, 4 ], [ 5, 6, 7, 8 ], [ 9, 10 ] ]

    greedyGroupsOfWithStep 3 2 (List.range 1 6)
    --> [ [ 1, 2, 3 ], [ 3, 4, 5 ], [ 5, 6 ] ]

    greedyGroupsOfWithStep 3 6 (List.range 1 20)
    --> [ [ 1, 2, 3 ], [ 7, 8, 9 ], [ 13, 14, 15 ], [ 19, 20 ] ]

If `step == size`, every element will appear in exactly one group. If
`step < size`, there will be an overlap between groups. If `step > size`, some
elements will be skipped and not appear in any groups.

greedyGroupsOfWithStep: Int -> Int -> List a -> List (List a)
-}
greedyGroupsOfWithStep : Int -> Int -> List Elm.Expression -> Elm.Expression
greedyGroupsOfWithStep greedyGroupsOfWithStepArg_ greedyGroupsOfWithStepArg_0 greedyGroupsOfWithStepArg_1 =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "greedyGroupsOfWithStep"
             , annotation =
                 Just
                     (Type.function
                          [ Type.int, Type.int, Type.list (Type.var "a") ]
                          (Type.list (Type.list (Type.var "a")))
                     )
             }
        )
        [ Elm.int greedyGroupsOfWithStepArg_
        , Elm.int greedyGroupsOfWithStepArg_0
        , Elm.list greedyGroupsOfWithStepArg_1
        ]


{-| Performs an inner join, combining data items from both lists if they match by their respective key functions.

    employees : List { name : String, departmentId : Int }
    employees =
        [ { name = "Rafferty", departmentId = 31 }
        , { name = "Jones", departmentId = 33 }
        , { name = "Heisenberg", departmentId = 33 }
        , { name = "Robinson", departmentId = 34 }
        , { name = "Smith", departmentId = 34 }
        ]

    departments : List { name : String, departmentId : Int }
    departments =
        [ { departmentId = 31, name = "Sales" }
        , { departmentId = 33, name = "Engineering" }
        , { departmentId = 34, name = "Clerical" }
        , { departmentId = 35, name = "Marketing" }
        ]

    joinOn (\empl dep -> { employee = empl.name, department = dep.name}) .departmentId .departmentId employees departments
    --> [ { department = "Clerical", employee = "Robinson" }
    --> , { department = "Clerical", employee = "Smith" }
    --> , { department = "Engineering", employee = "Jones" }
    --> , { department = "Engineering", employee = "Heisenberg" }
    --> , { department = "Sales", employee = "Rafferty" }
    --> ]

This is akin to the SQL query:

    SELECT employee.name, department.name
    FROM employee
    INNER JOIN department
    ON employee.departmentId = department.departmentId

joinOn: 
    (a -> b -> c)
    -> (a -> comparable)
    -> (b -> comparable)
    -> List a
    -> List b
    -> List c
-}
joinOn :
    (Elm.Expression -> Elm.Expression -> Elm.Expression)
    -> (Elm.Expression -> Elm.Expression)
    -> (Elm.Expression -> Elm.Expression)
    -> List Elm.Expression
    -> List Elm.Expression
    -> Elm.Expression
joinOn joinOnArg_ joinOnArg_0 joinOnArg_1 joinOnArg_2 joinOnArg_3 =
    Elm.apply
        (Elm.value
             { importFrom = [ "List", "Extra" ]
             , name = "joinOn"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function
                              [ Type.var "a", Type.var "b" ]
                              (Type.var "c")
                          , Type.function
                              [ Type.var "a" ]
                              (Type.var "comparable")
                          , Type.function
                              [ Type.var "b" ]
                              (Type.var "comparable")
                          , Type.list (Type.var "a")
                          , Type.list (Type.var "b")
                          ]
                          (Type.list (Type.var "c"))
                     )
             }
        )
        [ Elm.functionReduced
            "joinOnUnpack"
            (\functionReducedUnpack ->
               Elm.functionReduced "unpack" (joinOnArg_ functionReducedUnpack)
            )
        , Elm.functionReduced "joinOnUnpack" joinOnArg_0
        , Elm.functionReduced "joinOnUnpack" joinOnArg_1
        , Elm.list joinOnArg_2
        , Elm.list joinOnArg_3
        ]


annotation_ : { step : Type.Annotation -> Type.Annotation }
annotation_ =
    { step = \stepArg0 -> Type.namedWith [ "List", "Extra" ] "Step" [ stepArg0 ]
    }


make_ :
    { continue : Elm.Expression -> Elm.Expression
    , stop : Elm.Expression -> Elm.Expression
    }
make_ =
    { continue =
        \ar0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "Continue"
                     , annotation =
                         Just (Type.namedWith [] "Step" [ Type.var "a" ])
                     }
                )
                [ ar0 ]
    , stop =
        \ar0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "Stop"
                     , annotation =
                         Just (Type.namedWith [] "Step" [ Type.var "a" ])
                     }
                )
                [ ar0 ]
    }


caseOf_ :
    { step :
        Elm.Expression
        -> { continue : Elm.Expression -> Elm.Expression
        , stop : Elm.Expression -> Elm.Expression
        }
        -> Elm.Expression
    }
caseOf_ =
    { step =
        \stepExpression stepTags ->
            Elm.Case.custom
                stepExpression
                (Type.namedWith [ "List", "Extra" ] "Step" [ Type.var "a" ])
                [ Elm.Case.branch
                    (Elm.Arg.customType
                       "Continue"
                       stepTags.continue |> Elm.Arg.item
                                                  (Elm.Arg.varWith
                                                         "a"
                                                         (Type.var "a")
                                                  )
                    )
                    Basics.identity
                , Elm.Case.branch
                    (Elm.Arg.customType "Stop" stepTags.stop |> Elm.Arg.item
                                                                      (Elm.Arg.varWith
                                                                             "a"
                                                                             (Type.var
                                                                                    "a"
                                                                             )
                                                                      )
                    )
                    Basics.identity
                ]
    }


call_ :
    { last : Elm.Expression -> Elm.Expression
    , init : Elm.Expression -> Elm.Expression
    , getAt : Elm.Expression -> Elm.Expression -> Elm.Expression
    , cons : Elm.Expression -> Elm.Expression
    , uncons : Elm.Expression -> Elm.Expression
    , unconsLast : Elm.Expression -> Elm.Expression
    , push : Elm.Expression -> Elm.Expression -> Elm.Expression
    , appendTo : Elm.Expression -> Elm.Expression -> Elm.Expression
    , prependTo : Elm.Expression -> Elm.Expression -> Elm.Expression
    , maximumBy : Elm.Expression -> Elm.Expression -> Elm.Expression
    , maximumWith : Elm.Expression -> Elm.Expression -> Elm.Expression
    , minimumBy : Elm.Expression -> Elm.Expression -> Elm.Expression
    , minimumWith : Elm.Expression -> Elm.Expression -> Elm.Expression
    , andMap : Elm.Expression -> Elm.Expression -> Elm.Expression
    , andThen : Elm.Expression -> Elm.Expression -> Elm.Expression
    , reverseMap : Elm.Expression -> Elm.Expression -> Elm.Expression
    , takeWhile : Elm.Expression -> Elm.Expression -> Elm.Expression
    , dropWhile : Elm.Expression -> Elm.Expression -> Elm.Expression
    , unique : Elm.Expression -> Elm.Expression
    , uniqueBy : Elm.Expression -> Elm.Expression -> Elm.Expression
    , allDifferent : Elm.Expression -> Elm.Expression
    , allDifferentBy : Elm.Expression -> Elm.Expression -> Elm.Expression
    , setIf :
        Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
    , setAt :
        Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
    , remove : Elm.Expression -> Elm.Expression -> Elm.Expression
    , updateIf :
        Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
    , updateAt :
        Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
    , updateIfIndex :
        Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
    , removeAt : Elm.Expression -> Elm.Expression -> Elm.Expression
    , removeIfIndex : Elm.Expression -> Elm.Expression -> Elm.Expression
    , removeWhen : Elm.Expression -> Elm.Expression -> Elm.Expression
    , swapAt :
        Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
    , stableSortWith : Elm.Expression -> Elm.Expression -> Elm.Expression
    , intercalate : Elm.Expression -> Elm.Expression -> Elm.Expression
    , transpose : Elm.Expression -> Elm.Expression
    , subsequences : Elm.Expression -> Elm.Expression
    , permutations : Elm.Expression -> Elm.Expression
    , interweave : Elm.Expression -> Elm.Expression -> Elm.Expression
    , cartesianProduct : Elm.Expression -> Elm.Expression
    , uniquePairs : Elm.Expression -> Elm.Expression
    , foldl1 : Elm.Expression -> Elm.Expression -> Elm.Expression
    , foldr1 : Elm.Expression -> Elm.Expression -> Elm.Expression
    , indexedFoldl :
        Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
    , indexedFoldr :
        Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
    , stoppableFoldl :
        Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
    , scanl :
        Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
    , scanl1 : Elm.Expression -> Elm.Expression -> Elm.Expression
    , scanr :
        Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
    , scanr1 : Elm.Expression -> Elm.Expression -> Elm.Expression
    , mapAccuml :
        Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
    , mapAccumr :
        Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
    , unfoldr : Elm.Expression -> Elm.Expression -> Elm.Expression
    , iterate : Elm.Expression -> Elm.Expression -> Elm.Expression
    , initialize : Elm.Expression -> Elm.Expression -> Elm.Expression
    , cycle : Elm.Expression -> Elm.Expression -> Elm.Expression
    , reverseRange : Elm.Expression -> Elm.Expression -> Elm.Expression
    , splitAt : Elm.Expression -> Elm.Expression -> Elm.Expression
    , splitWhen : Elm.Expression -> Elm.Expression -> Elm.Expression
    , takeWhileRight : Elm.Expression -> Elm.Expression -> Elm.Expression
    , dropWhileRight : Elm.Expression -> Elm.Expression -> Elm.Expression
    , span : Elm.Expression -> Elm.Expression -> Elm.Expression
    , break : Elm.Expression -> Elm.Expression -> Elm.Expression
    , stripPrefix : Elm.Expression -> Elm.Expression -> Elm.Expression
    , group : Elm.Expression -> Elm.Expression
    , groupWhile : Elm.Expression -> Elm.Expression -> Elm.Expression
    , inits : Elm.Expression -> Elm.Expression
    , tails : Elm.Expression -> Elm.Expression
    , conditional : Elm.Expression -> Elm.Expression
    , select : Elm.Expression -> Elm.Expression
    , selectSplit : Elm.Expression -> Elm.Expression
    , gatherEquals : Elm.Expression -> Elm.Expression
    , gatherEqualsBy : Elm.Expression -> Elm.Expression -> Elm.Expression
    , gatherWith : Elm.Expression -> Elm.Expression -> Elm.Expression
    , subsequencesNonEmpty : Elm.Expression -> Elm.Expression
    , frequencies : Elm.Expression -> Elm.Expression
    , isPrefixOf : Elm.Expression -> Elm.Expression -> Elm.Expression
    , isSuffixOf : Elm.Expression -> Elm.Expression -> Elm.Expression
    , isInfixOf : Elm.Expression -> Elm.Expression -> Elm.Expression
    , isSubsequenceOf : Elm.Expression -> Elm.Expression -> Elm.Expression
    , isPermutationOf : Elm.Expression -> Elm.Expression -> Elm.Expression
    , notMember : Elm.Expression -> Elm.Expression -> Elm.Expression
    , find : Elm.Expression -> Elm.Expression -> Elm.Expression
    , elemIndex : Elm.Expression -> Elm.Expression -> Elm.Expression
    , elemIndices : Elm.Expression -> Elm.Expression -> Elm.Expression
    , findIndex : Elm.Expression -> Elm.Expression -> Elm.Expression
    , findIndices : Elm.Expression -> Elm.Expression -> Elm.Expression
    , findMap : Elm.Expression -> Elm.Expression -> Elm.Expression
    , count : Elm.Expression -> Elm.Expression -> Elm.Expression
    , zip : Elm.Expression -> Elm.Expression -> Elm.Expression
    , zip3 :
        Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
    , lift2 :
        Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
    , lift3 :
        Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
    , lift4 :
        Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
    , groupsOf : Elm.Expression -> Elm.Expression -> Elm.Expression
    , groupsOfWithStep :
        Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
    , groupsOfVarying : Elm.Expression -> Elm.Expression -> Elm.Expression
    , greedyGroupsOf : Elm.Expression -> Elm.Expression -> Elm.Expression
    , greedyGroupsOfWithStep :
        Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
    , joinOn :
        Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
    }
call_ =
    { last =
        \lastArg_ ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "last"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.list (Type.var "a") ]
                                  (Type.maybe (Type.var "a"))
                             )
                     }
                )
                [ lastArg_ ]
    , init =
        \initArg_ ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "init"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.list (Type.var "a") ]
                                  (Type.maybe (Type.list (Type.var "a")))
                             )
                     }
                )
                [ initArg_ ]
    , getAt =
        \getAtArg_ getAtArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "getAt"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.int, Type.list (Type.var "a") ]
                                  (Type.maybe (Type.var "a"))
                             )
                     }
                )
                [ getAtArg_, getAtArg_0 ]
    , cons =
        \consArg_ ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "cons"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.tuple
                                      (Type.var "a")
                                      (Type.list (Type.var "a"))
                                  ]
                                  (Type.list (Type.var "a"))
                             )
                     }
                )
                [ consArg_ ]
    , uncons =
        \unconsArg_ ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "uncons"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.list (Type.var "a") ]
                                  (Type.maybe
                                       (Type.tuple
                                            (Type.var "a")
                                            (Type.list (Type.var "a"))
                                       )
                                  )
                             )
                     }
                )
                [ unconsArg_ ]
    , unconsLast =
        \unconsLastArg_ ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "unconsLast"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.list (Type.var "a") ]
                                  (Type.maybe
                                       (Type.tuple
                                            (Type.var "a")
                                            (Type.list (Type.var "a"))
                                       )
                                  )
                             )
                     }
                )
                [ unconsLastArg_ ]
    , push =
        \pushArg_ pushArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "push"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.var "a", Type.list (Type.var "a") ]
                                  (Type.list (Type.var "a"))
                             )
                     }
                )
                [ pushArg_, pushArg_0 ]
    , appendTo =
        \appendToArg_ appendToArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "appendTo"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.list (Type.var "a")
                                  , Type.list (Type.var "a")
                                  ]
                                  (Type.list (Type.var "a"))
                             )
                     }
                )
                [ appendToArg_, appendToArg_0 ]
    , prependTo =
        \prependToArg_ prependToArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "prependTo"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.list (Type.var "a")
                                  , Type.list (Type.var "a")
                                  ]
                                  (Type.list (Type.var "a"))
                             )
                     }
                )
                [ prependToArg_, prependToArg_0 ]
    , maximumBy =
        \maximumByArg_ maximumByArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "maximumBy"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function
                                      [ Type.var "a" ]
                                      (Type.var "comparable")
                                  , Type.list (Type.var "a")
                                  ]
                                  (Type.maybe (Type.var "a"))
                             )
                     }
                )
                [ maximumByArg_, maximumByArg_0 ]
    , maximumWith =
        \maximumWithArg_ maximumWithArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "maximumWith"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function
                                      [ Type.var "a", Type.var "a" ]
                                      (Type.namedWith [ "Basics" ] "Order" [])
                                  , Type.list (Type.var "a")
                                  ]
                                  (Type.maybe (Type.var "a"))
                             )
                     }
                )
                [ maximumWithArg_, maximumWithArg_0 ]
    , minimumBy =
        \minimumByArg_ minimumByArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "minimumBy"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function
                                      [ Type.var "a" ]
                                      (Type.var "comparable")
                                  , Type.list (Type.var "a")
                                  ]
                                  (Type.maybe (Type.var "a"))
                             )
                     }
                )
                [ minimumByArg_, minimumByArg_0 ]
    , minimumWith =
        \minimumWithArg_ minimumWithArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "minimumWith"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function
                                      [ Type.var "a", Type.var "a" ]
                                      (Type.namedWith [ "Basics" ] "Order" [])
                                  , Type.list (Type.var "a")
                                  ]
                                  (Type.maybe (Type.var "a"))
                             )
                     }
                )
                [ minimumWithArg_, minimumWithArg_0 ]
    , andMap =
        \andMapArg_ andMapArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "andMap"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.list (Type.var "a")
                                  , Type.list
                                      (Type.function
                                         [ Type.var "a" ]
                                         (Type.var "b")
                                      )
                                  ]
                                  (Type.list (Type.var "b"))
                             )
                     }
                )
                [ andMapArg_, andMapArg_0 ]
    , andThen =
        \andThenArg_ andThenArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "andThen"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function
                                      [ Type.var "a" ]
                                      (Type.list (Type.var "b"))
                                  , Type.list (Type.var "a")
                                  ]
                                  (Type.list (Type.var "b"))
                             )
                     }
                )
                [ andThenArg_, andThenArg_0 ]
    , reverseMap =
        \reverseMapArg_ reverseMapArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "reverseMap"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function
                                      [ Type.var "a" ]
                                      (Type.var "b")
                                  , Type.list (Type.var "a")
                                  ]
                                  (Type.list (Type.var "b"))
                             )
                     }
                )
                [ reverseMapArg_, reverseMapArg_0 ]
    , takeWhile =
        \takeWhileArg_ takeWhileArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "takeWhile"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function [ Type.var "a" ] Type.bool
                                  , Type.list (Type.var "a")
                                  ]
                                  (Type.list (Type.var "a"))
                             )
                     }
                )
                [ takeWhileArg_, takeWhileArg_0 ]
    , dropWhile =
        \dropWhileArg_ dropWhileArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "dropWhile"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function [ Type.var "a" ] Type.bool
                                  , Type.list (Type.var "a")
                                  ]
                                  (Type.list (Type.var "a"))
                             )
                     }
                )
                [ dropWhileArg_, dropWhileArg_0 ]
    , unique =
        \uniqueArg_ ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "unique"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.list (Type.var "a") ]
                                  (Type.list (Type.var "a"))
                             )
                     }
                )
                [ uniqueArg_ ]
    , uniqueBy =
        \uniqueByArg_ uniqueByArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "uniqueBy"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function
                                      [ Type.var "a" ]
                                      (Type.var "b")
                                  , Type.list (Type.var "a")
                                  ]
                                  (Type.list (Type.var "a"))
                             )
                     }
                )
                [ uniqueByArg_, uniqueByArg_0 ]
    , allDifferent =
        \allDifferentArg_ ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "allDifferent"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.list (Type.var "a") ]
                                  Type.bool
                             )
                     }
                )
                [ allDifferentArg_ ]
    , allDifferentBy =
        \allDifferentByArg_ allDifferentByArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "allDifferentBy"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function
                                      [ Type.var "a" ]
                                      (Type.var "b")
                                  , Type.list (Type.var "a")
                                  ]
                                  Type.bool
                             )
                     }
                )
                [ allDifferentByArg_, allDifferentByArg_0 ]
    , setIf =
        \setIfArg_ setIfArg_0 setIfArg_1 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "setIf"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function [ Type.var "a" ] Type.bool
                                  , Type.var "a"
                                  , Type.list (Type.var "a")
                                  ]
                                  (Type.list (Type.var "a"))
                             )
                     }
                )
                [ setIfArg_, setIfArg_0, setIfArg_1 ]
    , setAt =
        \setAtArg_ setAtArg_0 setAtArg_1 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "setAt"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.int
                                  , Type.var "a"
                                  , Type.list (Type.var "a")
                                  ]
                                  (Type.list (Type.var "a"))
                             )
                     }
                )
                [ setAtArg_, setAtArg_0, setAtArg_1 ]
    , remove =
        \removeArg_ removeArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "remove"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.var "a", Type.list (Type.var "a") ]
                                  (Type.list (Type.var "a"))
                             )
                     }
                )
                [ removeArg_, removeArg_0 ]
    , updateIf =
        \updateIfArg_ updateIfArg_0 updateIfArg_1 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "updateIf"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function [ Type.var "a" ] Type.bool
                                  , Type.function
                                      [ Type.var "a" ]
                                      (Type.var "a")
                                  , Type.list (Type.var "a")
                                  ]
                                  (Type.list (Type.var "a"))
                             )
                     }
                )
                [ updateIfArg_, updateIfArg_0, updateIfArg_1 ]
    , updateAt =
        \updateAtArg_ updateAtArg_0 updateAtArg_1 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "updateAt"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.int
                                  , Type.function
                                      [ Type.var "a" ]
                                      (Type.var "a")
                                  , Type.list (Type.var "a")
                                  ]
                                  (Type.list (Type.var "a"))
                             )
                     }
                )
                [ updateAtArg_, updateAtArg_0, updateAtArg_1 ]
    , updateIfIndex =
        \updateIfIndexArg_ updateIfIndexArg_0 updateIfIndexArg_1 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "updateIfIndex"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function [ Type.int ] Type.bool
                                  , Type.function
                                      [ Type.var "a" ]
                                      (Type.var "a")
                                  , Type.list (Type.var "a")
                                  ]
                                  (Type.list (Type.var "a"))
                             )
                     }
                )
                [ updateIfIndexArg_, updateIfIndexArg_0, updateIfIndexArg_1 ]
    , removeAt =
        \removeAtArg_ removeAtArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "removeAt"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.int, Type.list (Type.var "a") ]
                                  (Type.list (Type.var "a"))
                             )
                     }
                )
                [ removeAtArg_, removeAtArg_0 ]
    , removeIfIndex =
        \removeIfIndexArg_ removeIfIndexArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "removeIfIndex"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function [ Type.int ] Type.bool
                                  , Type.list (Type.var "a")
                                  ]
                                  (Type.list (Type.var "a"))
                             )
                     }
                )
                [ removeIfIndexArg_, removeIfIndexArg_0 ]
    , removeWhen =
        \removeWhenArg_ removeWhenArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "removeWhen"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function [ Type.var "a" ] Type.bool
                                  , Type.list (Type.var "a")
                                  ]
                                  (Type.list (Type.var "a"))
                             )
                     }
                )
                [ removeWhenArg_, removeWhenArg_0 ]
    , swapAt =
        \swapAtArg_ swapAtArg_0 swapAtArg_1 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "swapAt"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.int
                                  , Type.int
                                  , Type.list (Type.var "a")
                                  ]
                                  (Type.list (Type.var "a"))
                             )
                     }
                )
                [ swapAtArg_, swapAtArg_0, swapAtArg_1 ]
    , stableSortWith =
        \stableSortWithArg_ stableSortWithArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "stableSortWith"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function
                                      [ Type.var "a", Type.var "a" ]
                                      (Type.namedWith [ "Basics" ] "Order" [])
                                  , Type.list (Type.var "a")
                                  ]
                                  (Type.list (Type.var "a"))
                             )
                     }
                )
                [ stableSortWithArg_, stableSortWithArg_0 ]
    , intercalate =
        \intercalateArg_ intercalateArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "intercalate"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.list (Type.var "a")
                                  , Type.list (Type.list (Type.var "a"))
                                  ]
                                  (Type.list (Type.var "a"))
                             )
                     }
                )
                [ intercalateArg_, intercalateArg_0 ]
    , transpose =
        \transposeArg_ ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "transpose"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.list (Type.list (Type.var "a")) ]
                                  (Type.list (Type.list (Type.var "a")))
                             )
                     }
                )
                [ transposeArg_ ]
    , subsequences =
        \subsequencesArg_ ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "subsequences"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.list (Type.var "a") ]
                                  (Type.list (Type.list (Type.var "a")))
                             )
                     }
                )
                [ subsequencesArg_ ]
    , permutations =
        \permutationsArg_ ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "permutations"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.list (Type.var "a") ]
                                  (Type.list (Type.list (Type.var "a")))
                             )
                     }
                )
                [ permutationsArg_ ]
    , interweave =
        \interweaveArg_ interweaveArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "interweave"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.list (Type.var "a")
                                  , Type.list (Type.var "a")
                                  ]
                                  (Type.list (Type.var "a"))
                             )
                     }
                )
                [ interweaveArg_, interweaveArg_0 ]
    , cartesianProduct =
        \cartesianProductArg_ ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "cartesianProduct"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.list (Type.list (Type.var "a")) ]
                                  (Type.list (Type.list (Type.var "a")))
                             )
                     }
                )
                [ cartesianProductArg_ ]
    , uniquePairs =
        \uniquePairsArg_ ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "uniquePairs"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.list (Type.var "a") ]
                                  (Type.list
                                       (Type.tuple (Type.var "a") (Type.var "a")
                                       )
                                  )
                             )
                     }
                )
                [ uniquePairsArg_ ]
    , foldl1 =
        \foldl1Arg_ foldl1Arg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "foldl1"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function
                                      [ Type.var "a", Type.var "a" ]
                                      (Type.var "a")
                                  , Type.list (Type.var "a")
                                  ]
                                  (Type.maybe (Type.var "a"))
                             )
                     }
                )
                [ foldl1Arg_, foldl1Arg_0 ]
    , foldr1 =
        \foldr1Arg_ foldr1Arg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "foldr1"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function
                                      [ Type.var "a", Type.var "a" ]
                                      (Type.var "a")
                                  , Type.list (Type.var "a")
                                  ]
                                  (Type.maybe (Type.var "a"))
                             )
                     }
                )
                [ foldr1Arg_, foldr1Arg_0 ]
    , indexedFoldl =
        \indexedFoldlArg_ indexedFoldlArg_0 indexedFoldlArg_1 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "indexedFoldl"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function
                                      [ Type.int, Type.var "a", Type.var "b" ]
                                      (Type.var "b")
                                  , Type.var "b"
                                  , Type.list (Type.var "a")
                                  ]
                                  (Type.var "b")
                             )
                     }
                )
                [ indexedFoldlArg_, indexedFoldlArg_0, indexedFoldlArg_1 ]
    , indexedFoldr =
        \indexedFoldrArg_ indexedFoldrArg_0 indexedFoldrArg_1 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "indexedFoldr"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function
                                      [ Type.int, Type.var "a", Type.var "b" ]
                                      (Type.var "b")
                                  , Type.var "b"
                                  , Type.list (Type.var "a")
                                  ]
                                  (Type.var "b")
                             )
                     }
                )
                [ indexedFoldrArg_, indexedFoldrArg_0, indexedFoldrArg_1 ]
    , stoppableFoldl =
        \stoppableFoldlArg_ stoppableFoldlArg_0 stoppableFoldlArg_1 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "stoppableFoldl"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function
                                      [ Type.var "a", Type.var "b" ]
                                      (Type.namedWith
                                         [ "List", "Extra" ]
                                         "Step"
                                         [ Type.var "b" ]
                                      )
                                  , Type.var "b"
                                  , Type.list (Type.var "a")
                                  ]
                                  (Type.var "b")
                             )
                     }
                )
                [ stoppableFoldlArg_, stoppableFoldlArg_0, stoppableFoldlArg_1 ]
    , scanl =
        \scanlArg_ scanlArg_0 scanlArg_1 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "scanl"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function
                                      [ Type.var "a", Type.var "b" ]
                                      (Type.var "b")
                                  , Type.var "b"
                                  , Type.list (Type.var "a")
                                  ]
                                  (Type.list (Type.var "b"))
                             )
                     }
                )
                [ scanlArg_, scanlArg_0, scanlArg_1 ]
    , scanl1 =
        \scanl1Arg_ scanl1Arg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "scanl1"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function
                                      [ Type.var "a", Type.var "a" ]
                                      (Type.var "a")
                                  , Type.list (Type.var "a")
                                  ]
                                  (Type.list (Type.var "a"))
                             )
                     }
                )
                [ scanl1Arg_, scanl1Arg_0 ]
    , scanr =
        \scanrArg_ scanrArg_0 scanrArg_1 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "scanr"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function
                                      [ Type.var "a", Type.var "b" ]
                                      (Type.var "b")
                                  , Type.var "b"
                                  , Type.list (Type.var "a")
                                  ]
                                  (Type.list (Type.var "b"))
                             )
                     }
                )
                [ scanrArg_, scanrArg_0, scanrArg_1 ]
    , scanr1 =
        \scanr1Arg_ scanr1Arg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "scanr1"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function
                                      [ Type.var "a", Type.var "a" ]
                                      (Type.var "a")
                                  , Type.list (Type.var "a")
                                  ]
                                  (Type.list (Type.var "a"))
                             )
                     }
                )
                [ scanr1Arg_, scanr1Arg_0 ]
    , mapAccuml =
        \mapAccumlArg_ mapAccumlArg_0 mapAccumlArg_1 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "mapAccuml"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function
                                      [ Type.var "a", Type.var "b" ]
                                      (Type.tuple (Type.var "a") (Type.var "c"))
                                  , Type.var "a"
                                  , Type.list (Type.var "b")
                                  ]
                                  (Type.tuple
                                       (Type.var "a")
                                       (Type.list (Type.var "c"))
                                  )
                             )
                     }
                )
                [ mapAccumlArg_, mapAccumlArg_0, mapAccumlArg_1 ]
    , mapAccumr =
        \mapAccumrArg_ mapAccumrArg_0 mapAccumrArg_1 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "mapAccumr"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function
                                      [ Type.var "a", Type.var "b" ]
                                      (Type.tuple (Type.var "a") (Type.var "c"))
                                  , Type.var "a"
                                  , Type.list (Type.var "b")
                                  ]
                                  (Type.tuple
                                       (Type.var "a")
                                       (Type.list (Type.var "c"))
                                  )
                             )
                     }
                )
                [ mapAccumrArg_, mapAccumrArg_0, mapAccumrArg_1 ]
    , unfoldr =
        \unfoldrArg_ unfoldrArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "unfoldr"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function
                                      [ Type.var "b" ]
                                      (Type.maybe
                                         (Type.tuple
                                            (Type.var "a")
                                            (Type.var "b")
                                         )
                                      )
                                  , Type.var "b"
                                  ]
                                  (Type.list (Type.var "a"))
                             )
                     }
                )
                [ unfoldrArg_, unfoldrArg_0 ]
    , iterate =
        \iterateArg_ iterateArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "iterate"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function
                                      [ Type.var "a" ]
                                      (Type.maybe (Type.var "a"))
                                  , Type.var "a"
                                  ]
                                  (Type.list (Type.var "a"))
                             )
                     }
                )
                [ iterateArg_, iterateArg_0 ]
    , initialize =
        \initializeArg_ initializeArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "initialize"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.int
                                  , Type.function [ Type.int ] (Type.var "a")
                                  ]
                                  (Type.list (Type.var "a"))
                             )
                     }
                )
                [ initializeArg_, initializeArg_0 ]
    , cycle =
        \cycleArg_ cycleArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "cycle"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.int, Type.list (Type.var "a") ]
                                  (Type.list (Type.var "a"))
                             )
                     }
                )
                [ cycleArg_, cycleArg_0 ]
    , reverseRange =
        \reverseRangeArg_ reverseRangeArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "reverseRange"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.int, Type.int ]
                                  (Type.list Type.int)
                             )
                     }
                )
                [ reverseRangeArg_, reverseRangeArg_0 ]
    , splitAt =
        \splitAtArg_ splitAtArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "splitAt"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.int, Type.list (Type.var "a") ]
                                  (Type.tuple
                                       (Type.list (Type.var "a"))
                                       (Type.list (Type.var "a"))
                                  )
                             )
                     }
                )
                [ splitAtArg_, splitAtArg_0 ]
    , splitWhen =
        \splitWhenArg_ splitWhenArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "splitWhen"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function [ Type.var "a" ] Type.bool
                                  , Type.list (Type.var "a")
                                  ]
                                  (Type.maybe
                                       (Type.tuple
                                            (Type.list (Type.var "a"))
                                            (Type.list (Type.var "a"))
                                       )
                                  )
                             )
                     }
                )
                [ splitWhenArg_, splitWhenArg_0 ]
    , takeWhileRight =
        \takeWhileRightArg_ takeWhileRightArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "takeWhileRight"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function [ Type.var "a" ] Type.bool
                                  , Type.list (Type.var "a")
                                  ]
                                  (Type.list (Type.var "a"))
                             )
                     }
                )
                [ takeWhileRightArg_, takeWhileRightArg_0 ]
    , dropWhileRight =
        \dropWhileRightArg_ dropWhileRightArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "dropWhileRight"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function [ Type.var "a" ] Type.bool
                                  , Type.list (Type.var "a")
                                  ]
                                  (Type.list (Type.var "a"))
                             )
                     }
                )
                [ dropWhileRightArg_, dropWhileRightArg_0 ]
    , span =
        \spanArg_ spanArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "span"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function [ Type.var "a" ] Type.bool
                                  , Type.list (Type.var "a")
                                  ]
                                  (Type.tuple
                                       (Type.list (Type.var "a"))
                                       (Type.list (Type.var "a"))
                                  )
                             )
                     }
                )
                [ spanArg_, spanArg_0 ]
    , break =
        \breakArg_ breakArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "break"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function [ Type.var "a" ] Type.bool
                                  , Type.list (Type.var "a")
                                  ]
                                  (Type.tuple
                                       (Type.list (Type.var "a"))
                                       (Type.list (Type.var "a"))
                                  )
                             )
                     }
                )
                [ breakArg_, breakArg_0 ]
    , stripPrefix =
        \stripPrefixArg_ stripPrefixArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "stripPrefix"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.list (Type.var "a")
                                  , Type.list (Type.var "a")
                                  ]
                                  (Type.maybe (Type.list (Type.var "a")))
                             )
                     }
                )
                [ stripPrefixArg_, stripPrefixArg_0 ]
    , group =
        \groupArg_ ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "group"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.list (Type.var "a") ]
                                  (Type.list
                                       (Type.tuple
                                            (Type.var "a")
                                            (Type.list (Type.var "a"))
                                       )
                                  )
                             )
                     }
                )
                [ groupArg_ ]
    , groupWhile =
        \groupWhileArg_ groupWhileArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "groupWhile"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function
                                      [ Type.var "a", Type.var "a" ]
                                      Type.bool
                                  , Type.list (Type.var "a")
                                  ]
                                  (Type.list
                                       (Type.tuple
                                            (Type.var "a")
                                            (Type.list (Type.var "a"))
                                       )
                                  )
                             )
                     }
                )
                [ groupWhileArg_, groupWhileArg_0 ]
    , inits =
        \initsArg_ ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "inits"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.list (Type.var "a") ]
                                  (Type.list (Type.list (Type.var "a")))
                             )
                     }
                )
                [ initsArg_ ]
    , tails =
        \tailsArg_ ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "tails"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.list (Type.var "a") ]
                                  (Type.list (Type.list (Type.var "a")))
                             )
                     }
                )
                [ tailsArg_ ]
    , conditional =
        \conditionalArg_ ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "conditional"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.list
                                      (Type.tuple (Type.var "a") Type.bool)
                                  ]
                                  (Type.list (Type.var "a"))
                             )
                     }
                )
                [ conditionalArg_ ]
    , select =
        \selectArg_ ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "select"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.list (Type.var "a") ]
                                  (Type.list
                                       (Type.tuple
                                            (Type.var "a")
                                            (Type.list (Type.var "a"))
                                       )
                                  )
                             )
                     }
                )
                [ selectArg_ ]
    , selectSplit =
        \selectSplitArg_ ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "selectSplit"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.list (Type.var "a") ]
                                  (Type.list
                                       (Type.triple
                                            (Type.list (Type.var "a"))
                                            (Type.var "a")
                                            (Type.list (Type.var "a"))
                                       )
                                  )
                             )
                     }
                )
                [ selectSplitArg_ ]
    , gatherEquals =
        \gatherEqualsArg_ ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "gatherEquals"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.list (Type.var "a") ]
                                  (Type.list
                                       (Type.tuple
                                            (Type.var "a")
                                            (Type.list (Type.var "a"))
                                       )
                                  )
                             )
                     }
                )
                [ gatherEqualsArg_ ]
    , gatherEqualsBy =
        \gatherEqualsByArg_ gatherEqualsByArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "gatherEqualsBy"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function
                                      [ Type.var "a" ]
                                      (Type.var "b")
                                  , Type.list (Type.var "a")
                                  ]
                                  (Type.list
                                       (Type.tuple
                                            (Type.var "a")
                                            (Type.list (Type.var "a"))
                                       )
                                  )
                             )
                     }
                )
                [ gatherEqualsByArg_, gatherEqualsByArg_0 ]
    , gatherWith =
        \gatherWithArg_ gatherWithArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "gatherWith"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function
                                      [ Type.var "a", Type.var "a" ]
                                      Type.bool
                                  , Type.list (Type.var "a")
                                  ]
                                  (Type.list
                                       (Type.tuple
                                            (Type.var "a")
                                            (Type.list (Type.var "a"))
                                       )
                                  )
                             )
                     }
                )
                [ gatherWithArg_, gatherWithArg_0 ]
    , subsequencesNonEmpty =
        \subsequencesNonEmptyArg_ ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "subsequencesNonEmpty"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.list (Type.var "a") ]
                                  (Type.list
                                       (Type.tuple
                                            (Type.var "a")
                                            (Type.list (Type.var "a"))
                                       )
                                  )
                             )
                     }
                )
                [ subsequencesNonEmptyArg_ ]
    , frequencies =
        \frequenciesArg_ ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "frequencies"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.list (Type.var "comparable") ]
                                  (Type.list
                                       (Type.tuple
                                            (Type.var "comparable")
                                            Type.int
                                       )
                                  )
                             )
                     }
                )
                [ frequenciesArg_ ]
    , isPrefixOf =
        \isPrefixOfArg_ isPrefixOfArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "isPrefixOf"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.list (Type.var "a")
                                  , Type.list (Type.var "a")
                                  ]
                                  Type.bool
                             )
                     }
                )
                [ isPrefixOfArg_, isPrefixOfArg_0 ]
    , isSuffixOf =
        \isSuffixOfArg_ isSuffixOfArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "isSuffixOf"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.list (Type.var "a")
                                  , Type.list (Type.var "a")
                                  ]
                                  Type.bool
                             )
                     }
                )
                [ isSuffixOfArg_, isSuffixOfArg_0 ]
    , isInfixOf =
        \isInfixOfArg_ isInfixOfArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "isInfixOf"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.list (Type.var "a")
                                  , Type.list (Type.var "a")
                                  ]
                                  Type.bool
                             )
                     }
                )
                [ isInfixOfArg_, isInfixOfArg_0 ]
    , isSubsequenceOf =
        \isSubsequenceOfArg_ isSubsequenceOfArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "isSubsequenceOf"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.list (Type.var "a")
                                  , Type.list (Type.var "a")
                                  ]
                                  Type.bool
                             )
                     }
                )
                [ isSubsequenceOfArg_, isSubsequenceOfArg_0 ]
    , isPermutationOf =
        \isPermutationOfArg_ isPermutationOfArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "isPermutationOf"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.list (Type.var "a")
                                  , Type.list (Type.var "a")
                                  ]
                                  Type.bool
                             )
                     }
                )
                [ isPermutationOfArg_, isPermutationOfArg_0 ]
    , notMember =
        \notMemberArg_ notMemberArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "notMember"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.var "a", Type.list (Type.var "a") ]
                                  Type.bool
                             )
                     }
                )
                [ notMemberArg_, notMemberArg_0 ]
    , find =
        \findArg_ findArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "find"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function [ Type.var "a" ] Type.bool
                                  , Type.list (Type.var "a")
                                  ]
                                  (Type.maybe (Type.var "a"))
                             )
                     }
                )
                [ findArg_, findArg_0 ]
    , elemIndex =
        \elemIndexArg_ elemIndexArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "elemIndex"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.var "a", Type.list (Type.var "a") ]
                                  (Type.maybe Type.int)
                             )
                     }
                )
                [ elemIndexArg_, elemIndexArg_0 ]
    , elemIndices =
        \elemIndicesArg_ elemIndicesArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "elemIndices"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.var "a", Type.list (Type.var "a") ]
                                  (Type.list Type.int)
                             )
                     }
                )
                [ elemIndicesArg_, elemIndicesArg_0 ]
    , findIndex =
        \findIndexArg_ findIndexArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "findIndex"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function [ Type.var "a" ] Type.bool
                                  , Type.list (Type.var "a")
                                  ]
                                  (Type.maybe Type.int)
                             )
                     }
                )
                [ findIndexArg_, findIndexArg_0 ]
    , findIndices =
        \findIndicesArg_ findIndicesArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "findIndices"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function [ Type.var "a" ] Type.bool
                                  , Type.list (Type.var "a")
                                  ]
                                  (Type.list Type.int)
                             )
                     }
                )
                [ findIndicesArg_, findIndicesArg_0 ]
    , findMap =
        \findMapArg_ findMapArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "findMap"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function
                                      [ Type.var "a" ]
                                      (Type.maybe (Type.var "b"))
                                  , Type.list (Type.var "a")
                                  ]
                                  (Type.maybe (Type.var "b"))
                             )
                     }
                )
                [ findMapArg_, findMapArg_0 ]
    , count =
        \countArg_ countArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "count"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function [ Type.var "a" ] Type.bool
                                  , Type.list (Type.var "a")
                                  ]
                                  Type.int
                             )
                     }
                )
                [ countArg_, countArg_0 ]
    , zip =
        \zipArg_ zipArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "zip"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.list (Type.var "a")
                                  , Type.list (Type.var "b")
                                  ]
                                  (Type.list
                                       (Type.tuple (Type.var "a") (Type.var "b")
                                       )
                                  )
                             )
                     }
                )
                [ zipArg_, zipArg_0 ]
    , zip3 =
        \zip3Arg_ zip3Arg_0 zip3Arg_1 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "zip3"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.list (Type.var "a")
                                  , Type.list (Type.var "b")
                                  , Type.list (Type.var "c")
                                  ]
                                  (Type.list
                                       (Type.triple
                                            (Type.var "a")
                                            (Type.var "b")
                                            (Type.var "c")
                                       )
                                  )
                             )
                     }
                )
                [ zip3Arg_, zip3Arg_0, zip3Arg_1 ]
    , lift2 =
        \lift2Arg_ lift2Arg_0 lift2Arg_1 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "lift2"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function
                                      [ Type.var "a", Type.var "b" ]
                                      (Type.var "c")
                                  , Type.list (Type.var "a")
                                  , Type.list (Type.var "b")
                                  ]
                                  (Type.list (Type.var "c"))
                             )
                     }
                )
                [ lift2Arg_, lift2Arg_0, lift2Arg_1 ]
    , lift3 =
        \lift3Arg_ lift3Arg_0 lift3Arg_1 lift3Arg_2 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "lift3"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function
                                      [ Type.var "a"
                                      , Type.var "b"
                                      , Type.var "c"
                                      ]
                                      (Type.var "d")
                                  , Type.list (Type.var "a")
                                  , Type.list (Type.var "b")
                                  , Type.list (Type.var "c")
                                  ]
                                  (Type.list (Type.var "d"))
                             )
                     }
                )
                [ lift3Arg_, lift3Arg_0, lift3Arg_1, lift3Arg_2 ]
    , lift4 =
        \lift4Arg_ lift4Arg_0 lift4Arg_1 lift4Arg_2 lift4Arg_3 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "lift4"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function
                                      [ Type.var "a"
                                      , Type.var "b"
                                      , Type.var "c"
                                      , Type.var "d"
                                      ]
                                      (Type.var "e")
                                  , Type.list (Type.var "a")
                                  , Type.list (Type.var "b")
                                  , Type.list (Type.var "c")
                                  , Type.list (Type.var "d")
                                  ]
                                  (Type.list (Type.var "e"))
                             )
                     }
                )
                [ lift4Arg_, lift4Arg_0, lift4Arg_1, lift4Arg_2, lift4Arg_3 ]
    , groupsOf =
        \groupsOfArg_ groupsOfArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "groupsOf"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.int, Type.list (Type.var "a") ]
                                  (Type.list (Type.list (Type.var "a")))
                             )
                     }
                )
                [ groupsOfArg_, groupsOfArg_0 ]
    , groupsOfWithStep =
        \groupsOfWithStepArg_ groupsOfWithStepArg_0 groupsOfWithStepArg_1 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "groupsOfWithStep"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.int
                                  , Type.int
                                  , Type.list (Type.var "a")
                                  ]
                                  (Type.list (Type.list (Type.var "a")))
                             )
                     }
                )
                [ groupsOfWithStepArg_
                , groupsOfWithStepArg_0
                , groupsOfWithStepArg_1
                ]
    , groupsOfVarying =
        \groupsOfVaryingArg_ groupsOfVaryingArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "groupsOfVarying"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.list Type.int
                                  , Type.list (Type.var "a")
                                  ]
                                  (Type.list (Type.list (Type.var "a")))
                             )
                     }
                )
                [ groupsOfVaryingArg_, groupsOfVaryingArg_0 ]
    , greedyGroupsOf =
        \greedyGroupsOfArg_ greedyGroupsOfArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "greedyGroupsOf"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.int, Type.list (Type.var "a") ]
                                  (Type.list (Type.list (Type.var "a")))
                             )
                     }
                )
                [ greedyGroupsOfArg_, greedyGroupsOfArg_0 ]
    , greedyGroupsOfWithStep =
        \greedyGroupsOfWithStepArg_ greedyGroupsOfWithStepArg_0 greedyGroupsOfWithStepArg_1 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "greedyGroupsOfWithStep"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.int
                                  , Type.int
                                  , Type.list (Type.var "a")
                                  ]
                                  (Type.list (Type.list (Type.var "a")))
                             )
                     }
                )
                [ greedyGroupsOfWithStepArg_
                , greedyGroupsOfWithStepArg_0
                , greedyGroupsOfWithStepArg_1
                ]
    , joinOn =
        \joinOnArg_ joinOnArg_0 joinOnArg_1 joinOnArg_2 joinOnArg_3 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "List", "Extra" ]
                     , name = "joinOn"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function
                                      [ Type.var "a", Type.var "b" ]
                                      (Type.var "c")
                                  , Type.function
                                      [ Type.var "a" ]
                                      (Type.var "comparable")
                                  , Type.function
                                      [ Type.var "b" ]
                                      (Type.var "comparable")
                                  , Type.list (Type.var "a")
                                  , Type.list (Type.var "b")
                                  ]
                                  (Type.list (Type.var "c"))
                             )
                     }
                )
                [ joinOnArg_
                , joinOnArg_0
                , joinOnArg_1
                , joinOnArg_2
                , joinOnArg_3
                ]
    }


values_ :
    { last : Elm.Expression
    , init : Elm.Expression
    , getAt : Elm.Expression
    , cons : Elm.Expression
    , uncons : Elm.Expression
    , unconsLast : Elm.Expression
    , push : Elm.Expression
    , appendTo : Elm.Expression
    , prependTo : Elm.Expression
    , maximumBy : Elm.Expression
    , maximumWith : Elm.Expression
    , minimumBy : Elm.Expression
    , minimumWith : Elm.Expression
    , andMap : Elm.Expression
    , andThen : Elm.Expression
    , reverseMap : Elm.Expression
    , takeWhile : Elm.Expression
    , dropWhile : Elm.Expression
    , unique : Elm.Expression
    , uniqueBy : Elm.Expression
    , allDifferent : Elm.Expression
    , allDifferentBy : Elm.Expression
    , setIf : Elm.Expression
    , setAt : Elm.Expression
    , remove : Elm.Expression
    , updateIf : Elm.Expression
    , updateAt : Elm.Expression
    , updateIfIndex : Elm.Expression
    , removeAt : Elm.Expression
    , removeIfIndex : Elm.Expression
    , removeWhen : Elm.Expression
    , swapAt : Elm.Expression
    , stableSortWith : Elm.Expression
    , intercalate : Elm.Expression
    , transpose : Elm.Expression
    , subsequences : Elm.Expression
    , permutations : Elm.Expression
    , interweave : Elm.Expression
    , cartesianProduct : Elm.Expression
    , uniquePairs : Elm.Expression
    , foldl1 : Elm.Expression
    , foldr1 : Elm.Expression
    , indexedFoldl : Elm.Expression
    , indexedFoldr : Elm.Expression
    , stoppableFoldl : Elm.Expression
    , scanl : Elm.Expression
    , scanl1 : Elm.Expression
    , scanr : Elm.Expression
    , scanr1 : Elm.Expression
    , mapAccuml : Elm.Expression
    , mapAccumr : Elm.Expression
    , unfoldr : Elm.Expression
    , iterate : Elm.Expression
    , initialize : Elm.Expression
    , cycle : Elm.Expression
    , reverseRange : Elm.Expression
    , splitAt : Elm.Expression
    , splitWhen : Elm.Expression
    , takeWhileRight : Elm.Expression
    , dropWhileRight : Elm.Expression
    , span : Elm.Expression
    , break : Elm.Expression
    , stripPrefix : Elm.Expression
    , group : Elm.Expression
    , groupWhile : Elm.Expression
    , inits : Elm.Expression
    , tails : Elm.Expression
    , conditional : Elm.Expression
    , select : Elm.Expression
    , selectSplit : Elm.Expression
    , gatherEquals : Elm.Expression
    , gatherEqualsBy : Elm.Expression
    , gatherWith : Elm.Expression
    , subsequencesNonEmpty : Elm.Expression
    , frequencies : Elm.Expression
    , isPrefixOf : Elm.Expression
    , isSuffixOf : Elm.Expression
    , isInfixOf : Elm.Expression
    , isSubsequenceOf : Elm.Expression
    , isPermutationOf : Elm.Expression
    , notMember : Elm.Expression
    , find : Elm.Expression
    , elemIndex : Elm.Expression
    , elemIndices : Elm.Expression
    , findIndex : Elm.Expression
    , findIndices : Elm.Expression
    , findMap : Elm.Expression
    , count : Elm.Expression
    , zip : Elm.Expression
    , zip3 : Elm.Expression
    , lift2 : Elm.Expression
    , lift3 : Elm.Expression
    , lift4 : Elm.Expression
    , groupsOf : Elm.Expression
    , groupsOfWithStep : Elm.Expression
    , groupsOfVarying : Elm.Expression
    , greedyGroupsOf : Elm.Expression
    , greedyGroupsOfWithStep : Elm.Expression
    , joinOn : Elm.Expression
    }
values_ =
    { last =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "last"
            , annotation =
                Just
                    (Type.function
                         [ Type.list (Type.var "a") ]
                         (Type.maybe (Type.var "a"))
                    )
            }
    , init =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "init"
            , annotation =
                Just
                    (Type.function
                         [ Type.list (Type.var "a") ]
                         (Type.maybe (Type.list (Type.var "a")))
                    )
            }
    , getAt =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "getAt"
            , annotation =
                Just
                    (Type.function
                         [ Type.int, Type.list (Type.var "a") ]
                         (Type.maybe (Type.var "a"))
                    )
            }
    , cons =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "cons"
            , annotation =
                Just
                    (Type.function
                         [ Type.tuple (Type.var "a") (Type.list (Type.var "a"))
                         ]
                         (Type.list (Type.var "a"))
                    )
            }
    , uncons =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "uncons"
            , annotation =
                Just
                    (Type.function
                         [ Type.list (Type.var "a") ]
                         (Type.maybe
                              (Type.tuple
                                   (Type.var "a")
                                   (Type.list (Type.var "a"))
                              )
                         )
                    )
            }
    , unconsLast =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "unconsLast"
            , annotation =
                Just
                    (Type.function
                         [ Type.list (Type.var "a") ]
                         (Type.maybe
                              (Type.tuple
                                   (Type.var "a")
                                   (Type.list (Type.var "a"))
                              )
                         )
                    )
            }
    , push =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "push"
            , annotation =
                Just
                    (Type.function
                         [ Type.var "a", Type.list (Type.var "a") ]
                         (Type.list (Type.var "a"))
                    )
            }
    , appendTo =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "appendTo"
            , annotation =
                Just
                    (Type.function
                         [ Type.list (Type.var "a"), Type.list (Type.var "a") ]
                         (Type.list (Type.var "a"))
                    )
            }
    , prependTo =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "prependTo"
            , annotation =
                Just
                    (Type.function
                         [ Type.list (Type.var "a"), Type.list (Type.var "a") ]
                         (Type.list (Type.var "a"))
                    )
            }
    , maximumBy =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "maximumBy"
            , annotation =
                Just
                    (Type.function
                         [ Type.function
                             [ Type.var "a" ]
                             (Type.var "comparable")
                         , Type.list (Type.var "a")
                         ]
                         (Type.maybe (Type.var "a"))
                    )
            }
    , maximumWith =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "maximumWith"
            , annotation =
                Just
                    (Type.function
                         [ Type.function
                             [ Type.var "a", Type.var "a" ]
                             (Type.namedWith [ "Basics" ] "Order" [])
                         , Type.list (Type.var "a")
                         ]
                         (Type.maybe (Type.var "a"))
                    )
            }
    , minimumBy =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "minimumBy"
            , annotation =
                Just
                    (Type.function
                         [ Type.function
                             [ Type.var "a" ]
                             (Type.var "comparable")
                         , Type.list (Type.var "a")
                         ]
                         (Type.maybe (Type.var "a"))
                    )
            }
    , minimumWith =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "minimumWith"
            , annotation =
                Just
                    (Type.function
                         [ Type.function
                             [ Type.var "a", Type.var "a" ]
                             (Type.namedWith [ "Basics" ] "Order" [])
                         , Type.list (Type.var "a")
                         ]
                         (Type.maybe (Type.var "a"))
                    )
            }
    , andMap =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "andMap"
            , annotation =
                Just
                    (Type.function
                         [ Type.list (Type.var "a")
                         , Type.list
                             (Type.function [ Type.var "a" ] (Type.var "b"))
                         ]
                         (Type.list (Type.var "b"))
                    )
            }
    , andThen =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "andThen"
            , annotation =
                Just
                    (Type.function
                         [ Type.function
                             [ Type.var "a" ]
                             (Type.list (Type.var "b"))
                         , Type.list (Type.var "a")
                         ]
                         (Type.list (Type.var "b"))
                    )
            }
    , reverseMap =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "reverseMap"
            , annotation =
                Just
                    (Type.function
                         [ Type.function [ Type.var "a" ] (Type.var "b")
                         , Type.list (Type.var "a")
                         ]
                         (Type.list (Type.var "b"))
                    )
            }
    , takeWhile =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "takeWhile"
            , annotation =
                Just
                    (Type.function
                         [ Type.function [ Type.var "a" ] Type.bool
                         , Type.list (Type.var "a")
                         ]
                         (Type.list (Type.var "a"))
                    )
            }
    , dropWhile =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "dropWhile"
            , annotation =
                Just
                    (Type.function
                         [ Type.function [ Type.var "a" ] Type.bool
                         , Type.list (Type.var "a")
                         ]
                         (Type.list (Type.var "a"))
                    )
            }
    , unique =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "unique"
            , annotation =
                Just
                    (Type.function
                         [ Type.list (Type.var "a") ]
                         (Type.list (Type.var "a"))
                    )
            }
    , uniqueBy =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "uniqueBy"
            , annotation =
                Just
                    (Type.function
                         [ Type.function [ Type.var "a" ] (Type.var "b")
                         , Type.list (Type.var "a")
                         ]
                         (Type.list (Type.var "a"))
                    )
            }
    , allDifferent =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "allDifferent"
            , annotation =
                Just (Type.function [ Type.list (Type.var "a") ] Type.bool)
            }
    , allDifferentBy =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "allDifferentBy"
            , annotation =
                Just
                    (Type.function
                         [ Type.function [ Type.var "a" ] (Type.var "b")
                         , Type.list (Type.var "a")
                         ]
                         Type.bool
                    )
            }
    , setIf =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "setIf"
            , annotation =
                Just
                    (Type.function
                         [ Type.function [ Type.var "a" ] Type.bool
                         , Type.var "a"
                         , Type.list (Type.var "a")
                         ]
                         (Type.list (Type.var "a"))
                    )
            }
    , setAt =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "setAt"
            , annotation =
                Just
                    (Type.function
                         [ Type.int, Type.var "a", Type.list (Type.var "a") ]
                         (Type.list (Type.var "a"))
                    )
            }
    , remove =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "remove"
            , annotation =
                Just
                    (Type.function
                         [ Type.var "a", Type.list (Type.var "a") ]
                         (Type.list (Type.var "a"))
                    )
            }
    , updateIf =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "updateIf"
            , annotation =
                Just
                    (Type.function
                         [ Type.function [ Type.var "a" ] Type.bool
                         , Type.function [ Type.var "a" ] (Type.var "a")
                         , Type.list (Type.var "a")
                         ]
                         (Type.list (Type.var "a"))
                    )
            }
    , updateAt =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "updateAt"
            , annotation =
                Just
                    (Type.function
                         [ Type.int
                         , Type.function [ Type.var "a" ] (Type.var "a")
                         , Type.list (Type.var "a")
                         ]
                         (Type.list (Type.var "a"))
                    )
            }
    , updateIfIndex =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "updateIfIndex"
            , annotation =
                Just
                    (Type.function
                         [ Type.function [ Type.int ] Type.bool
                         , Type.function [ Type.var "a" ] (Type.var "a")
                         , Type.list (Type.var "a")
                         ]
                         (Type.list (Type.var "a"))
                    )
            }
    , removeAt =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "removeAt"
            , annotation =
                Just
                    (Type.function
                         [ Type.int, Type.list (Type.var "a") ]
                         (Type.list (Type.var "a"))
                    )
            }
    , removeIfIndex =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "removeIfIndex"
            , annotation =
                Just
                    (Type.function
                         [ Type.function [ Type.int ] Type.bool
                         , Type.list (Type.var "a")
                         ]
                         (Type.list (Type.var "a"))
                    )
            }
    , removeWhen =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "removeWhen"
            , annotation =
                Just
                    (Type.function
                         [ Type.function [ Type.var "a" ] Type.bool
                         , Type.list (Type.var "a")
                         ]
                         (Type.list (Type.var "a"))
                    )
            }
    , swapAt =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "swapAt"
            , annotation =
                Just
                    (Type.function
                         [ Type.int, Type.int, Type.list (Type.var "a") ]
                         (Type.list (Type.var "a"))
                    )
            }
    , stableSortWith =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "stableSortWith"
            , annotation =
                Just
                    (Type.function
                         [ Type.function
                             [ Type.var "a", Type.var "a" ]
                             (Type.namedWith [ "Basics" ] "Order" [])
                         , Type.list (Type.var "a")
                         ]
                         (Type.list (Type.var "a"))
                    )
            }
    , intercalate =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "intercalate"
            , annotation =
                Just
                    (Type.function
                         [ Type.list (Type.var "a")
                         , Type.list (Type.list (Type.var "a"))
                         ]
                         (Type.list (Type.var "a"))
                    )
            }
    , transpose =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "transpose"
            , annotation =
                Just
                    (Type.function
                         [ Type.list (Type.list (Type.var "a")) ]
                         (Type.list (Type.list (Type.var "a")))
                    )
            }
    , subsequences =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "subsequences"
            , annotation =
                Just
                    (Type.function
                         [ Type.list (Type.var "a") ]
                         (Type.list (Type.list (Type.var "a")))
                    )
            }
    , permutations =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "permutations"
            , annotation =
                Just
                    (Type.function
                         [ Type.list (Type.var "a") ]
                         (Type.list (Type.list (Type.var "a")))
                    )
            }
    , interweave =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "interweave"
            , annotation =
                Just
                    (Type.function
                         [ Type.list (Type.var "a"), Type.list (Type.var "a") ]
                         (Type.list (Type.var "a"))
                    )
            }
    , cartesianProduct =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "cartesianProduct"
            , annotation =
                Just
                    (Type.function
                         [ Type.list (Type.list (Type.var "a")) ]
                         (Type.list (Type.list (Type.var "a")))
                    )
            }
    , uniquePairs =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "uniquePairs"
            , annotation =
                Just
                    (Type.function
                         [ Type.list (Type.var "a") ]
                         (Type.list (Type.tuple (Type.var "a") (Type.var "a")))
                    )
            }
    , foldl1 =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "foldl1"
            , annotation =
                Just
                    (Type.function
                         [ Type.function
                             [ Type.var "a", Type.var "a" ]
                             (Type.var "a")
                         , Type.list (Type.var "a")
                         ]
                         (Type.maybe (Type.var "a"))
                    )
            }
    , foldr1 =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "foldr1"
            , annotation =
                Just
                    (Type.function
                         [ Type.function
                             [ Type.var "a", Type.var "a" ]
                             (Type.var "a")
                         , Type.list (Type.var "a")
                         ]
                         (Type.maybe (Type.var "a"))
                    )
            }
    , indexedFoldl =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "indexedFoldl"
            , annotation =
                Just
                    (Type.function
                         [ Type.function
                             [ Type.int, Type.var "a", Type.var "b" ]
                             (Type.var "b")
                         , Type.var "b"
                         , Type.list (Type.var "a")
                         ]
                         (Type.var "b")
                    )
            }
    , indexedFoldr =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "indexedFoldr"
            , annotation =
                Just
                    (Type.function
                         [ Type.function
                             [ Type.int, Type.var "a", Type.var "b" ]
                             (Type.var "b")
                         , Type.var "b"
                         , Type.list (Type.var "a")
                         ]
                         (Type.var "b")
                    )
            }
    , stoppableFoldl =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "stoppableFoldl"
            , annotation =
                Just
                    (Type.function
                         [ Type.function
                             [ Type.var "a", Type.var "b" ]
                             (Type.namedWith
                                [ "List", "Extra" ]
                                "Step"
                                [ Type.var "b" ]
                             )
                         , Type.var "b"
                         , Type.list (Type.var "a")
                         ]
                         (Type.var "b")
                    )
            }
    , scanl =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "scanl"
            , annotation =
                Just
                    (Type.function
                         [ Type.function
                             [ Type.var "a", Type.var "b" ]
                             (Type.var "b")
                         , Type.var "b"
                         , Type.list (Type.var "a")
                         ]
                         (Type.list (Type.var "b"))
                    )
            }
    , scanl1 =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "scanl1"
            , annotation =
                Just
                    (Type.function
                         [ Type.function
                             [ Type.var "a", Type.var "a" ]
                             (Type.var "a")
                         , Type.list (Type.var "a")
                         ]
                         (Type.list (Type.var "a"))
                    )
            }
    , scanr =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "scanr"
            , annotation =
                Just
                    (Type.function
                         [ Type.function
                             [ Type.var "a", Type.var "b" ]
                             (Type.var "b")
                         , Type.var "b"
                         , Type.list (Type.var "a")
                         ]
                         (Type.list (Type.var "b"))
                    )
            }
    , scanr1 =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "scanr1"
            , annotation =
                Just
                    (Type.function
                         [ Type.function
                             [ Type.var "a", Type.var "a" ]
                             (Type.var "a")
                         , Type.list (Type.var "a")
                         ]
                         (Type.list (Type.var "a"))
                    )
            }
    , mapAccuml =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "mapAccuml"
            , annotation =
                Just
                    (Type.function
                         [ Type.function
                             [ Type.var "a", Type.var "b" ]
                             (Type.tuple (Type.var "a") (Type.var "c"))
                         , Type.var "a"
                         , Type.list (Type.var "b")
                         ]
                         (Type.tuple (Type.var "a") (Type.list (Type.var "c")))
                    )
            }
    , mapAccumr =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "mapAccumr"
            , annotation =
                Just
                    (Type.function
                         [ Type.function
                             [ Type.var "a", Type.var "b" ]
                             (Type.tuple (Type.var "a") (Type.var "c"))
                         , Type.var "a"
                         , Type.list (Type.var "b")
                         ]
                         (Type.tuple (Type.var "a") (Type.list (Type.var "c")))
                    )
            }
    , unfoldr =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "unfoldr"
            , annotation =
                Just
                    (Type.function
                         [ Type.function
                             [ Type.var "b" ]
                             (Type.maybe
                                (Type.tuple (Type.var "a") (Type.var "b"))
                             )
                         , Type.var "b"
                         ]
                         (Type.list (Type.var "a"))
                    )
            }
    , iterate =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "iterate"
            , annotation =
                Just
                    (Type.function
                         [ Type.function
                             [ Type.var "a" ]
                             (Type.maybe (Type.var "a"))
                         , Type.var "a"
                         ]
                         (Type.list (Type.var "a"))
                    )
            }
    , initialize =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "initialize"
            , annotation =
                Just
                    (Type.function
                         [ Type.int, Type.function [ Type.int ] (Type.var "a") ]
                         (Type.list (Type.var "a"))
                    )
            }
    , cycle =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "cycle"
            , annotation =
                Just
                    (Type.function
                         [ Type.int, Type.list (Type.var "a") ]
                         (Type.list (Type.var "a"))
                    )
            }
    , reverseRange =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "reverseRange"
            , annotation =
                Just (Type.function [ Type.int, Type.int ] (Type.list Type.int))
            }
    , splitAt =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "splitAt"
            , annotation =
                Just
                    (Type.function
                         [ Type.int, Type.list (Type.var "a") ]
                         (Type.tuple
                              (Type.list (Type.var "a"))
                              (Type.list (Type.var "a"))
                         )
                    )
            }
    , splitWhen =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "splitWhen"
            , annotation =
                Just
                    (Type.function
                         [ Type.function [ Type.var "a" ] Type.bool
                         , Type.list (Type.var "a")
                         ]
                         (Type.maybe
                              (Type.tuple
                                   (Type.list (Type.var "a"))
                                   (Type.list (Type.var "a"))
                              )
                         )
                    )
            }
    , takeWhileRight =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "takeWhileRight"
            , annotation =
                Just
                    (Type.function
                         [ Type.function [ Type.var "a" ] Type.bool
                         , Type.list (Type.var "a")
                         ]
                         (Type.list (Type.var "a"))
                    )
            }
    , dropWhileRight =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "dropWhileRight"
            , annotation =
                Just
                    (Type.function
                         [ Type.function [ Type.var "a" ] Type.bool
                         , Type.list (Type.var "a")
                         ]
                         (Type.list (Type.var "a"))
                    )
            }
    , span =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "span"
            , annotation =
                Just
                    (Type.function
                         [ Type.function [ Type.var "a" ] Type.bool
                         , Type.list (Type.var "a")
                         ]
                         (Type.tuple
                              (Type.list (Type.var "a"))
                              (Type.list (Type.var "a"))
                         )
                    )
            }
    , break =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "break"
            , annotation =
                Just
                    (Type.function
                         [ Type.function [ Type.var "a" ] Type.bool
                         , Type.list (Type.var "a")
                         ]
                         (Type.tuple
                              (Type.list (Type.var "a"))
                              (Type.list (Type.var "a"))
                         )
                    )
            }
    , stripPrefix =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "stripPrefix"
            , annotation =
                Just
                    (Type.function
                         [ Type.list (Type.var "a"), Type.list (Type.var "a") ]
                         (Type.maybe (Type.list (Type.var "a")))
                    )
            }
    , group =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "group"
            , annotation =
                Just
                    (Type.function
                         [ Type.list (Type.var "a") ]
                         (Type.list
                              (Type.tuple
                                   (Type.var "a")
                                   (Type.list (Type.var "a"))
                              )
                         )
                    )
            }
    , groupWhile =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "groupWhile"
            , annotation =
                Just
                    (Type.function
                         [ Type.function
                             [ Type.var "a", Type.var "a" ]
                             Type.bool
                         , Type.list (Type.var "a")
                         ]
                         (Type.list
                              (Type.tuple
                                   (Type.var "a")
                                   (Type.list (Type.var "a"))
                              )
                         )
                    )
            }
    , inits =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "inits"
            , annotation =
                Just
                    (Type.function
                         [ Type.list (Type.var "a") ]
                         (Type.list (Type.list (Type.var "a")))
                    )
            }
    , tails =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "tails"
            , annotation =
                Just
                    (Type.function
                         [ Type.list (Type.var "a") ]
                         (Type.list (Type.list (Type.var "a")))
                    )
            }
    , conditional =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "conditional"
            , annotation =
                Just
                    (Type.function
                         [ Type.list (Type.tuple (Type.var "a") Type.bool) ]
                         (Type.list (Type.var "a"))
                    )
            }
    , select =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "select"
            , annotation =
                Just
                    (Type.function
                         [ Type.list (Type.var "a") ]
                         (Type.list
                              (Type.tuple
                                   (Type.var "a")
                                   (Type.list (Type.var "a"))
                              )
                         )
                    )
            }
    , selectSplit =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "selectSplit"
            , annotation =
                Just
                    (Type.function
                         [ Type.list (Type.var "a") ]
                         (Type.list
                              (Type.triple
                                   (Type.list (Type.var "a"))
                                   (Type.var "a")
                                   (Type.list (Type.var "a"))
                              )
                         )
                    )
            }
    , gatherEquals =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "gatherEquals"
            , annotation =
                Just
                    (Type.function
                         [ Type.list (Type.var "a") ]
                         (Type.list
                              (Type.tuple
                                   (Type.var "a")
                                   (Type.list (Type.var "a"))
                              )
                         )
                    )
            }
    , gatherEqualsBy =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "gatherEqualsBy"
            , annotation =
                Just
                    (Type.function
                         [ Type.function [ Type.var "a" ] (Type.var "b")
                         , Type.list (Type.var "a")
                         ]
                         (Type.list
                              (Type.tuple
                                   (Type.var "a")
                                   (Type.list (Type.var "a"))
                              )
                         )
                    )
            }
    , gatherWith =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "gatherWith"
            , annotation =
                Just
                    (Type.function
                         [ Type.function
                             [ Type.var "a", Type.var "a" ]
                             Type.bool
                         , Type.list (Type.var "a")
                         ]
                         (Type.list
                              (Type.tuple
                                   (Type.var "a")
                                   (Type.list (Type.var "a"))
                              )
                         )
                    )
            }
    , subsequencesNonEmpty =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "subsequencesNonEmpty"
            , annotation =
                Just
                    (Type.function
                         [ Type.list (Type.var "a") ]
                         (Type.list
                              (Type.tuple
                                   (Type.var "a")
                                   (Type.list (Type.var "a"))
                              )
                         )
                    )
            }
    , frequencies =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "frequencies"
            , annotation =
                Just
                    (Type.function
                         [ Type.list (Type.var "comparable") ]
                         (Type.list
                              (Type.tuple (Type.var "comparable") Type.int)
                         )
                    )
            }
    , isPrefixOf =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "isPrefixOf"
            , annotation =
                Just
                    (Type.function
                         [ Type.list (Type.var "a"), Type.list (Type.var "a") ]
                         Type.bool
                    )
            }
    , isSuffixOf =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "isSuffixOf"
            , annotation =
                Just
                    (Type.function
                         [ Type.list (Type.var "a"), Type.list (Type.var "a") ]
                         Type.bool
                    )
            }
    , isInfixOf =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "isInfixOf"
            , annotation =
                Just
                    (Type.function
                         [ Type.list (Type.var "a"), Type.list (Type.var "a") ]
                         Type.bool
                    )
            }
    , isSubsequenceOf =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "isSubsequenceOf"
            , annotation =
                Just
                    (Type.function
                         [ Type.list (Type.var "a"), Type.list (Type.var "a") ]
                         Type.bool
                    )
            }
    , isPermutationOf =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "isPermutationOf"
            , annotation =
                Just
                    (Type.function
                         [ Type.list (Type.var "a"), Type.list (Type.var "a") ]
                         Type.bool
                    )
            }
    , notMember =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "notMember"
            , annotation =
                Just
                    (Type.function
                         [ Type.var "a", Type.list (Type.var "a") ]
                         Type.bool
                    )
            }
    , find =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "find"
            , annotation =
                Just
                    (Type.function
                         [ Type.function [ Type.var "a" ] Type.bool
                         , Type.list (Type.var "a")
                         ]
                         (Type.maybe (Type.var "a"))
                    )
            }
    , elemIndex =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "elemIndex"
            , annotation =
                Just
                    (Type.function
                         [ Type.var "a", Type.list (Type.var "a") ]
                         (Type.maybe Type.int)
                    )
            }
    , elemIndices =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "elemIndices"
            , annotation =
                Just
                    (Type.function
                         [ Type.var "a", Type.list (Type.var "a") ]
                         (Type.list Type.int)
                    )
            }
    , findIndex =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "findIndex"
            , annotation =
                Just
                    (Type.function
                         [ Type.function [ Type.var "a" ] Type.bool
                         , Type.list (Type.var "a")
                         ]
                         (Type.maybe Type.int)
                    )
            }
    , findIndices =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "findIndices"
            , annotation =
                Just
                    (Type.function
                         [ Type.function [ Type.var "a" ] Type.bool
                         , Type.list (Type.var "a")
                         ]
                         (Type.list Type.int)
                    )
            }
    , findMap =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "findMap"
            , annotation =
                Just
                    (Type.function
                         [ Type.function
                             [ Type.var "a" ]
                             (Type.maybe (Type.var "b"))
                         , Type.list (Type.var "a")
                         ]
                         (Type.maybe (Type.var "b"))
                    )
            }
    , count =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "count"
            , annotation =
                Just
                    (Type.function
                         [ Type.function [ Type.var "a" ] Type.bool
                         , Type.list (Type.var "a")
                         ]
                         Type.int
                    )
            }
    , zip =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "zip"
            , annotation =
                Just
                    (Type.function
                         [ Type.list (Type.var "a"), Type.list (Type.var "b") ]
                         (Type.list (Type.tuple (Type.var "a") (Type.var "b")))
                    )
            }
    , zip3 =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "zip3"
            , annotation =
                Just
                    (Type.function
                         [ Type.list (Type.var "a")
                         , Type.list (Type.var "b")
                         , Type.list (Type.var "c")
                         ]
                         (Type.list
                              (Type.triple
                                   (Type.var "a")
                                   (Type.var "b")
                                   (Type.var "c")
                              )
                         )
                    )
            }
    , lift2 =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "lift2"
            , annotation =
                Just
                    (Type.function
                         [ Type.function
                             [ Type.var "a", Type.var "b" ]
                             (Type.var "c")
                         , Type.list (Type.var "a")
                         , Type.list (Type.var "b")
                         ]
                         (Type.list (Type.var "c"))
                    )
            }
    , lift3 =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "lift3"
            , annotation =
                Just
                    (Type.function
                         [ Type.function
                             [ Type.var "a", Type.var "b", Type.var "c" ]
                             (Type.var "d")
                         , Type.list (Type.var "a")
                         , Type.list (Type.var "b")
                         , Type.list (Type.var "c")
                         ]
                         (Type.list (Type.var "d"))
                    )
            }
    , lift4 =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "lift4"
            , annotation =
                Just
                    (Type.function
                         [ Type.function
                             [ Type.var "a"
                             , Type.var "b"
                             , Type.var "c"
                             , Type.var "d"
                             ]
                             (Type.var "e")
                         , Type.list (Type.var "a")
                         , Type.list (Type.var "b")
                         , Type.list (Type.var "c")
                         , Type.list (Type.var "d")
                         ]
                         (Type.list (Type.var "e"))
                    )
            }
    , groupsOf =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "groupsOf"
            , annotation =
                Just
                    (Type.function
                         [ Type.int, Type.list (Type.var "a") ]
                         (Type.list (Type.list (Type.var "a")))
                    )
            }
    , groupsOfWithStep =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "groupsOfWithStep"
            , annotation =
                Just
                    (Type.function
                         [ Type.int, Type.int, Type.list (Type.var "a") ]
                         (Type.list (Type.list (Type.var "a")))
                    )
            }
    , groupsOfVarying =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "groupsOfVarying"
            , annotation =
                Just
                    (Type.function
                         [ Type.list Type.int, Type.list (Type.var "a") ]
                         (Type.list (Type.list (Type.var "a")))
                    )
            }
    , greedyGroupsOf =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "greedyGroupsOf"
            , annotation =
                Just
                    (Type.function
                         [ Type.int, Type.list (Type.var "a") ]
                         (Type.list (Type.list (Type.var "a")))
                    )
            }
    , greedyGroupsOfWithStep =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "greedyGroupsOfWithStep"
            , annotation =
                Just
                    (Type.function
                         [ Type.int, Type.int, Type.list (Type.var "a") ]
                         (Type.list (Type.list (Type.var "a")))
                    )
            }
    , joinOn =
        Elm.value
            { importFrom = [ "List", "Extra" ]
            , name = "joinOn"
            , annotation =
                Just
                    (Type.function
                         [ Type.function
                             [ Type.var "a", Type.var "b" ]
                             (Type.var "c")
                         , Type.function
                             [ Type.var "a" ]
                             (Type.var "comparable")
                         , Type.function
                             [ Type.var "b" ]
                             (Type.var "comparable")
                         , Type.list (Type.var "a")
                         , Type.list (Type.var "b")
                         ]
                         (Type.list (Type.var "c"))
                    )
            }
    }