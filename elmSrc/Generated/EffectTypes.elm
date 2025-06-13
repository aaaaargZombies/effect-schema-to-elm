module Generated.EffectTypes exposing (..)

import Dict


type alias MyBool =
    Bool


type alias MyChar =
    Char.Char


type alias MyComplexDict =
    Dict.Dict (List String) MyNewTypeTwo


type MyNewType
    = One Char.Char
    | Two String Char.Char


type MyNewTypeTwo
    = A String
    | B Int
    | C Int Int String (List (Result String Int))


type alias MyDict =
    Dict.Dict String Int


type alias MyFloat =
    Float


type alias MyInt =
    Int


type alias MyKeyTupleDict =
    Dict.Dict ( String, Float ) Int


type alias MyList =
    List String


type alias MyMaybe =
    Maybe Int


type alias MyNestedDict =
    Dict.Dict String (Dict.Dict String Int)


type alias MyNestedTuple =
    ( Char.Char, ( Char.Char, Bool ) )


type alias MyRecord =
    { one : Char.Char, two : String }


type alias MyRecordComplex =
    { a : Char.Char
    , b : List Char.Char
    , c : Maybe Int
    , d : Char.Char
    , e : Char.Char
    , f : Result String (Result String (Maybe (List String)))
    , g : Char.Char
    , h : Char.Char
    , i : { one : Char.Char, two : String }
    , j : Float
    }


type alias MyRecordLong =
    { a : Char.Char
    , b : Char.Char
    , c : Char.Char
    , d : Char.Char
    , e : Char.Char
    , f : Char.Char
    , g : Char.Char
    , h : Char.Char
    , i : Char.Char
    , j : Char.Char
    }


type alias MyRecordWithCustomType =
    { a : MyNewTypeTwo, b : List (Maybe Float) }


type alias MyResult =
    Result String Int


type alias MyResult_ =
    Result String (Maybe (List String))


type alias MyString =
    String


type alias MyTuple =
    ( String, Float )