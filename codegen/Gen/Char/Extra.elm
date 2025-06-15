module Gen.Char.Extra exposing
    ( moduleName_, isSpace, isControl, call_, values_
    )

{-|
# Generated bindings for Char.Extra

@docs moduleName_, isSpace, isControl, call_, values_
-}


import Elm
import Elm.Annotation as Type


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Char", "Extra" ]


{-| Returns true if the given character is whitespace character.

isSpace: Char.Char -> Bool
-}
isSpace : Char.Char -> Elm.Expression
isSpace isSpaceArg_ =
    Elm.apply
        (Elm.value
             { importFrom = [ "Char", "Extra" ]
             , name = "isSpace"
             , annotation = Just (Type.function [ Type.char ] Type.bool)
             }
        )
        [ Elm.char isSpaceArg_ ]


{-| Returns true if the given character is an ASCII control character.

isControl: Char.Char -> Bool
-}
isControl : Char.Char -> Elm.Expression
isControl isControlArg_ =
    Elm.apply
        (Elm.value
             { importFrom = [ "Char", "Extra" ]
             , name = "isControl"
             , annotation = Just (Type.function [ Type.char ] Type.bool)
             }
        )
        [ Elm.char isControlArg_ ]


call_ :
    { isSpace : Elm.Expression -> Elm.Expression
    , isControl : Elm.Expression -> Elm.Expression
    }
call_ =
    { isSpace =
        \isSpaceArg_ ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Char", "Extra" ]
                     , name = "isSpace"
                     , annotation = Just (Type.function [ Type.char ] Type.bool)
                     }
                )
                [ isSpaceArg_ ]
    , isControl =
        \isControlArg_ ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Char", "Extra" ]
                     , name = "isControl"
                     , annotation = Just (Type.function [ Type.char ] Type.bool)
                     }
                )
                [ isControlArg_ ]
    }


values_ : { isSpace : Elm.Expression, isControl : Elm.Expression }
values_ =
    { isSpace =
        Elm.value
            { importFrom = [ "Char", "Extra" ]
            , name = "isSpace"
            , annotation = Just (Type.function [ Type.char ] Type.bool)
            }
    , isControl =
        Elm.value
            { importFrom = [ "Char", "Extra" ]
            , name = "isControl"
            , annotation = Just (Type.function [ Type.char ] Type.bool)
            }
    }