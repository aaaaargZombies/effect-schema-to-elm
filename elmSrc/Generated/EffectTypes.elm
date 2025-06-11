module Generated.EffectTypes exposing (..)


type alias MyBool =
    Bool


type alias MyChar =
    Char.Char


type MyNewType
    = One Char.Char
    | Two String Char.Char


type alias MyFloat =
    Float


type alias MyInt =
    Int


type alias MyList =
    List String


type alias MyMaybe =
    Maybe Int


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


type alias MyResult =
    Result String Int


type alias MyResult_ =
    Result String (Maybe (List String))


type alias MyString =
    String