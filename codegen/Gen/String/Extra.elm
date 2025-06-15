module Gen.String.Extra exposing
    ( moduleName_, toSentenceCase, toTitleCase, decapitalize, camelize, classify
    , underscored, dasherize, humanize, replaceSlice, insertAt, nonEmpty, nonBlank
    , removeDiacritics, break, softBreak, wrap, wrapWith, softWrap, softWrapWith
    , quote, surround, isBlank, countOccurrences, clean, unquote, unsurround
    , unindent, ellipsis, softEllipsis, ellipsisWith, stripTags, pluralize, toSentence
    , toSentenceOxford, rightOf, leftOf, rightOfBack, leftOfBack, toCodePoints, fromCodePoints
    , call_, values_
    )

{-|
# Generated bindings for String.Extra

@docs moduleName_, toSentenceCase, toTitleCase, decapitalize, camelize, classify
@docs underscored, dasherize, humanize, replaceSlice, insertAt, nonEmpty
@docs nonBlank, removeDiacritics, break, softBreak, wrap, wrapWith
@docs softWrap, softWrapWith, quote, surround, isBlank, countOccurrences
@docs clean, unquote, unsurround, unindent, ellipsis, softEllipsis
@docs ellipsisWith, stripTags, pluralize, toSentence, toSentenceOxford, rightOf
@docs leftOf, rightOfBack, leftOfBack, toCodePoints, fromCodePoints, call_
@docs values_
-}


import Elm
import Elm.Annotation as Type


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "String", "Extra" ]


{-| Capitalize the first letter of a string.

    toSentenceCase "this is a phrase" --> "This is a phrase"

    toSentenceCase "hello, world" --> "Hello, world"

toSentenceCase: String -> String
-}
toSentenceCase : String -> Elm.Expression
toSentenceCase toSentenceCaseArg_ =
    Elm.apply
        (Elm.value
             { importFrom = [ "String", "Extra" ]
             , name = "toSentenceCase"
             , annotation = Just (Type.function [ Type.string ] Type.string)
             }
        )
        [ Elm.string toSentenceCaseArg_ ]


{-| Capitalize the first character of each word in a string.

    toTitleCase "this is a phrase" --> "This Is A Phrase"

    toTitleCase "hello, world" --> "Hello, World"

toTitleCase: String -> String
-}
toTitleCase : String -> Elm.Expression
toTitleCase toTitleCaseArg_ =
    Elm.apply
        (Elm.value
             { importFrom = [ "String", "Extra" ]
             , name = "toTitleCase"
             , annotation = Just (Type.function [ Type.string ] Type.string)
             }
        )
        [ Elm.string toTitleCaseArg_ ]


{-| Decapitalize the first letter of a string.

    decapitalize "This is a phrase" --> "this is a phrase"

    decapitalize "Hello, World" --> "hello, World"

decapitalize: String -> String
-}
decapitalize : String -> Elm.Expression
decapitalize decapitalizeArg_ =
    Elm.apply
        (Elm.value
             { importFrom = [ "String", "Extra" ]
             , name = "decapitalize"
             , annotation = Just (Type.function [ Type.string ] Type.string)
             }
        )
        [ Elm.string decapitalizeArg_ ]


{-| Convert an underscored or dasherized string to a camelized one.

    camelize "-moz-transform" --> "MozTransform"

camelize: String -> String
-}
camelize : String -> Elm.Expression
camelize camelizeArg_ =
    Elm.apply
        (Elm.value
             { importFrom = [ "String", "Extra" ]
             , name = "camelize"
             , annotation = Just (Type.function [ Type.string ] Type.string)
             }
        )
        [ Elm.string camelizeArg_ ]


{-| Convert a string to a camelized string starting with an uppercase letter.
All non-word characters will be stripped out of the original string.

    classify "some_class_name" --> "SomeClassName"

    classify "myLittleCamel.class.name" --> "MyLittleCamelClassName"

classify: String -> String
-}
classify : String -> Elm.Expression
classify classifyArg_ =
    Elm.apply
        (Elm.value
             { importFrom = [ "String", "Extra" ]
             , name = "classify"
             , annotation = Just (Type.function [ Type.string ] Type.string)
             }
        )
        [ Elm.string classifyArg_ ]


{-| Return a string joined by underscores after separating it by its uppercase characters.
Any sequence of spaces or dashes will also be converted to a single underscore.
The final string will be lowercased.

    underscored "SomeClassName" --> "some_class_name"

    underscored "some-class-name" --> "some_class_name"

    underscored "SomeClass name" --> "some_class_name"

underscored: String -> String
-}
underscored : String -> Elm.Expression
underscored underscoredArg_ =
    Elm.apply
        (Elm.value
             { importFrom = [ "String", "Extra" ]
             , name = "underscored"
             , annotation = Just (Type.function [ Type.string ] Type.string)
             }
        )
        [ Elm.string underscoredArg_ ]


{-| Return a string joined by dashes after separating it by its uppercase characters.
Any sequence of spaces or underscores will also be converted to a single dash.
The final string will be lowercased.

    dasherize "SomeClassName" --> "some-class-name"

    dasherize "some_class_name" --> "some-class-name"

    dasherize "someClass name" --> "some-class-name"

dasherize: String -> String
-}
dasherize : String -> Elm.Expression
dasherize dasherizeArg_ =
    Elm.apply
        (Elm.value
             { importFrom = [ "String", "Extra" ]
             , name = "dasherize"
             , annotation = Just (Type.function [ Type.string ] Type.string)
             }
        )
        [ Elm.string dasherizeArg_ ]


{-| Convert an underscored, camelized, or dasherized string into one that can be
read by humans. Also remove beginning and ending whitespace, and removes the
postfix '\_id'. The first character will be capitalized.

    humanize "this_is_great" --> "This is great"

    humanize "ThisIsGreat" --> "This is great"

    humanize "this-is-great" --> "This is great"

    humanize "author_id" --> "Author"

humanize: String -> String
-}
humanize : String -> Elm.Expression
humanize humanizeArg_ =
    Elm.apply
        (Elm.value
             { importFrom = [ "String", "Extra" ]
             , name = "humanize"
             , annotation = Just (Type.function [ Type.string ] Type.string)
             }
        )
        [ Elm.string humanizeArg_ ]


{-| Replace text within a portion of a string given a substitution
string, a start index and an end index. The substitution includes the character
at the start index but not the one at the end index.

    replaceSlice "Sue" 4 7 "Hi, Bob" --> "Hi, Sue"

    replaceSlice "elephants" 0 6 "snakes on a plane!" --> "elephants on a plane!"

    replaceSlice "under" 7 9 "snakes on a plane!" --> "snakes under a plane!"

replaceSlice: String -> Int -> Int -> String -> String
-}
replaceSlice : String -> Int -> Int -> String -> Elm.Expression
replaceSlice replaceSliceArg_ replaceSliceArg_0 replaceSliceArg_1 replaceSliceArg_2 =
    Elm.apply
        (Elm.value
             { importFrom = [ "String", "Extra" ]
             , name = "replaceSlice"
             , annotation =
                 Just
                     (Type.function
                          [ Type.string, Type.int, Type.int, Type.string ]
                          Type.string
                     )
             }
        )
        [ Elm.string replaceSliceArg_
        , Elm.int replaceSliceArg_0
        , Elm.int replaceSliceArg_1
        , Elm.string replaceSliceArg_2
        ]


{-| Insert a substring at the specified index.

    insertAt "world" 6 "Hello " --> "Hello world"

insertAt: String -> Int -> String -> String
-}
insertAt : String -> Int -> String -> Elm.Expression
insertAt insertAtArg_ insertAtArg_0 insertAtArg_1 =
    Elm.apply
        (Elm.value
             { importFrom = [ "String", "Extra" ]
             , name = "insertAt"
             , annotation =
                 Just
                     (Type.function
                          [ Type.string, Type.int, Type.string ]
                          Type.string
                     )
             }
        )
        [ Elm.string insertAtArg_
        , Elm.int insertAtArg_0
        , Elm.string insertAtArg_1
        ]


{-| Convert a string to a Nothing when empty.

    nonEmpty "" --> Nothing

    nonEmpty "Hello world" --> Just "Hello world"

nonEmpty: String -> Maybe String
-}
nonEmpty : String -> Elm.Expression
nonEmpty nonEmptyArg_ =
    Elm.apply
        (Elm.value
             { importFrom = [ "String", "Extra" ]
             , name = "nonEmpty"
             , annotation =
                 Just (Type.function [ Type.string ] (Type.maybe Type.string))
             }
        )
        [ Elm.string nonEmptyArg_ ]


{-| Convert a string to a Nothing when blank.

    nonBlank "" --> Nothing

    nonBlank " " --> Nothing

    nonBlank "Hello world" --> Just "Hello world"

nonBlank: String -> Maybe String
-}
nonBlank : String -> Elm.Expression
nonBlank nonBlankArg_ =
    Elm.apply
        (Elm.value
             { importFrom = [ "String", "Extra" ]
             , name = "nonBlank"
             , annotation =
                 Just (Type.function [ Type.string ] (Type.maybe Type.string))
             }
        )
        [ Elm.string nonBlankArg_ ]


{-| Removes diactritics, it will expand
known ligatures, thus changing the string glyph length.
All non latin characters are untouched.

    removeDiacritics "La liberté commence où l'ignorance finit."

    --> "La liberte commence ou l'ignorance finit."
    removeDiacritics "é()/& abc" --> "e()/& abc"

    removeDiacritics "こんにちは" --> "こんにちは"

removeDiacritics: String -> String
-}
removeDiacritics : String -> Elm.Expression
removeDiacritics removeDiacriticsArg_ =
    Elm.apply
        (Elm.value
             { importFrom = [ "String", "Extra" ]
             , name = "removeDiacritics"
             , annotation = Just (Type.function [ Type.string ] Type.string)
             }
        )
        [ Elm.string removeDiacriticsArg_ ]


{-| Break a string into a list of strings of a specified maximum length.

    break 10 "The quick brown fox" --> [ "The quick ", "brown fox" ]

    break 2 "" --> [ "" ]

break: Int -> String -> List String
-}
break : Int -> String -> Elm.Expression
break breakArg_ breakArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "String", "Extra" ]
             , name = "break"
             , annotation =
                 Just
                     (Type.function
                          [ Type.int, Type.string ]
                          (Type.list Type.string)
                     )
             }
        )
        [ Elm.int breakArg_, Elm.string breakArg_0 ]


{-| Break a string into a list of strings of a specified maximum length,
without truncating words.

    softBreak 6 "The quick brown fox" --> [ "The ", "quick ", "brown ", "fox" ]

softBreak: Int -> String -> List String
-}
softBreak : Int -> String -> Elm.Expression
softBreak softBreakArg_ softBreakArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "String", "Extra" ]
             , name = "softBreak"
             , annotation =
                 Just
                     (Type.function
                          [ Type.int, Type.string ]
                          (Type.list Type.string)
                     )
             }
        )
        [ Elm.int softBreakArg_, Elm.string softBreakArg_0 ]


{-| Chop a given string into parts of a given width, separating them with a
new line.

    wrap 7 "My very long text" --> "My very\n long t\next"

    wrap 100 "Too short" --> "Too short"

wrap: Int -> String -> String
-}
wrap : Int -> String -> Elm.Expression
wrap wrapArg_ wrapArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "String", "Extra" ]
             , name = "wrap"
             , annotation =
                 Just (Type.function [ Type.int, Type.string ] Type.string)
             }
        )
        [ Elm.int wrapArg_, Elm.string wrapArg_0 ]


{-| Separate a string into parts of a given width, using a given separator.

Look at `wrap` if you just want to wrap using newlines.

    wrapWith 7 "\n" "My very long text" --> "My very\n long t\next"

    wrapWith 100 "\n" "Too short" --> "Too short"

wrapWith: Int -> String -> String -> String
-}
wrapWith : Int -> String -> String -> Elm.Expression
wrapWith wrapWithArg_ wrapWithArg_0 wrapWithArg_1 =
    Elm.apply
        (Elm.value
             { importFrom = [ "String", "Extra" ]
             , name = "wrapWith"
             , annotation =
                 Just
                     (Type.function
                          [ Type.int, Type.string, Type.string ]
                          Type.string
                     )
             }
        )
        [ Elm.int wrapWithArg_
        , Elm.string wrapWithArg_0
        , Elm.string wrapWithArg_1
        ]


{-| Chop a given string into parts of a given width without breaking words apart,
and then separate them using a new line.

    softWrap 9 "My very long text" --> "My very\nlong text"

    softWrap 3 "Hello World" --> "Hello\nWorld"

    softWrap 100 "Too short" --> "Too short"

softWrap: Int -> String -> String
-}
softWrap : Int -> String -> Elm.Expression
softWrap softWrapArg_ softWrapArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "String", "Extra" ]
             , name = "softWrap"
             , annotation =
                 Just (Type.function [ Type.int, Type.string ] Type.string)
             }
        )
        [ Elm.int softWrapArg_, Elm.string softWrapArg_0 ]


{-| Chop a given string into parts of a given width without breaking words apart,
and then separate them using the given separator.

    softWrapWith 9 "..." "My very long text" --> "My very...long text"

    softWrapWith 3 "\n" "Hello World" --> "Hello\nWorld"

    softWrapWith 100 "\t" "Too short" --> "Too short"

softWrapWith: Int -> String -> String -> String
-}
softWrapWith : Int -> String -> String -> Elm.Expression
softWrapWith softWrapWithArg_ softWrapWithArg_0 softWrapWithArg_1 =
    Elm.apply
        (Elm.value
             { importFrom = [ "String", "Extra" ]
             , name = "softWrapWith"
             , annotation =
                 Just
                     (Type.function
                          [ Type.int, Type.string, Type.string ]
                          Type.string
                     )
             }
        )
        [ Elm.int softWrapWithArg_
        , Elm.string softWrapWithArg_0
        , Elm.string softWrapWithArg_1
        ]


{-| Add quotes to a string.

    quote "foo" --> "\"foo\""

quote: String -> String
-}
quote : String -> Elm.Expression
quote quoteArg_ =
    Elm.apply
        (Elm.value
             { importFrom = [ "String", "Extra" ]
             , name = "quote"
             , annotation = Just (Type.function [ Type.string ] Type.string)
             }
        )
        [ Elm.string quoteArg_ ]


{-| Surround a string with another string.

    surround "bar" "foo" --> "barfoobar"

surround: String -> String -> String
-}
surround : String -> String -> Elm.Expression
surround surroundArg_ surroundArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "String", "Extra" ]
             , name = "surround"
             , annotation =
                 Just (Type.function [ Type.string, Type.string ] Type.string)
             }
        )
        [ Elm.string surroundArg_, Elm.string surroundArg_0 ]


{-| Test if a string is empty or only contains whitespace.

    isBlank "" --> True

    isBlank "\n" --> True

    isBlank "  " --> True

    isBlank " a" --> False

isBlank: String -> Bool
-}
isBlank : String -> Elm.Expression
isBlank isBlankArg_ =
    Elm.apply
        (Elm.value
             { importFrom = [ "String", "Extra" ]
             , name = "isBlank"
             , annotation = Just (Type.function [ Type.string ] Type.bool)
             }
        )
        [ Elm.string isBlankArg_ ]


{-| Return the number of occurrences of a substring in another string.

    countOccurrences "Hello" "Hello World" --> 1

    countOccurrences "o" "Hello World" --> 2

countOccurrences: String -> String -> Int
-}
countOccurrences : String -> String -> Elm.Expression
countOccurrences countOccurrencesArg_ countOccurrencesArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "String", "Extra" ]
             , name = "countOccurrences"
             , annotation =
                 Just (Type.function [ Type.string, Type.string ] Type.int)
             }
        )
        [ Elm.string countOccurrencesArg_, Elm.string countOccurrencesArg_0 ]


{-| Trim the whitespace of both sides of the string and compress
repeated whitespace internally to a single whitespace char.

    clean " The   quick brown   fox    " --> "The quick brown fox"

clean: String -> String
-}
clean : String -> Elm.Expression
clean cleanArg_ =
    Elm.apply
        (Elm.value
             { importFrom = [ "String", "Extra" ]
             , name = "clean"
             , annotation = Just (Type.function [ Type.string ] Type.string)
             }
        )
        [ Elm.string cleanArg_ ]


{-| Remove quotes that surround a string.

    unquote "\"foo\"" --> "foo"

    unquote "\"foo\"bar\"" --> "foo\"bar"

unquote: String -> String
-}
unquote : String -> Elm.Expression
unquote unquoteArg_ =
    Elm.apply
        (Elm.value
             { importFrom = [ "String", "Extra" ]
             , name = "unquote"
             , annotation = Just (Type.function [ Type.string ] Type.string)
             }
        )
        [ Elm.string unquoteArg_ ]


{-| Remove surrounding strings from another string.

    unsurround "foo" "foobarfoo" --> "bar"

unsurround: String -> String -> String
-}
unsurround : String -> String -> Elm.Expression
unsurround unsurroundArg_ unsurroundArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "String", "Extra" ]
             , name = "unsurround"
             , annotation =
                 Just (Type.function [ Type.string, Type.string ] Type.string)
             }
        )
        [ Elm.string unsurroundArg_, Elm.string unsurroundArg_0 ]


{-| Remove the shortest sequence of leading spaces or tabs on each line
of the string, so that at least one of the lines will not have any
leading spaces nor tabs and the rest of the lines will have the same
amount of indentation removed.

    unindent "  Hello\n    World" --> "Hello\n  World"

    unindent "\t\tHello\n\t\t\t\tWorld" --> "Hello\n\t\tWorld"

unindent: String -> String
-}
unindent : String -> Elm.Expression
unindent unindentArg_ =
    Elm.apply
        (Elm.value
             { importFrom = [ "String", "Extra" ]
             , name = "unindent"
             , annotation = Just (Type.function [ Type.string ] Type.string)
             }
        )
        [ Elm.string unindentArg_ ]


{-| Truncate the string at the specified length if the string is
longer than the specified length, and replace the end of the truncated
string with `"..."`, such that the resulting string is of the
specified length.

The resulting string will have at most the specified length.

    ellipsis 5 "Hello World" --> "He..."

    ellipsis 10 "Hello World" --> "Hello W..."

    ellipsis 10 "Hello" --> "Hello"

    ellipsis 8 "Hello World" --> "Hello..."

ellipsis: Int -> String -> String
-}
ellipsis : Int -> String -> Elm.Expression
ellipsis ellipsisArg_ ellipsisArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "String", "Extra" ]
             , name = "ellipsis"
             , annotation =
                 Just (Type.function [ Type.int, Type.string ] Type.string)
             }
        )
        [ Elm.int ellipsisArg_, Elm.string ellipsisArg_0 ]


{-| Truncate the string at the last complete word less than or equal to
the specified length and append `"..."`. When the specified length is
less than the length of the first word, the ellipsis is appended to the
first word. When the specified length is greater than or equal to the
length of the string, an identical string is returned.

In contrast to `ellipsis`, this function will not produce incomplete
words, and the resulting string can exceed the specified length. In
addition, it removes trailing whitespace and punctuation characters at
the end of the truncated string.

    softEllipsis 1 "Hello, World" --> "Hello..."

    softEllipsis 5 "Hello, World" --> "Hello..."

    softEllipsis 6 "Hello, World" --> "Hello..."

    softEllipsis 15 "Hello, cruel world" --> "Hello, cruel..."

    softEllipsis 10 "Hello" --> "Hello"

softEllipsis: Int -> String -> String
-}
softEllipsis : Int -> String -> Elm.Expression
softEllipsis softEllipsisArg_ softEllipsisArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "String", "Extra" ]
             , name = "softEllipsis"
             , annotation =
                 Just (Type.function [ Type.int, Type.string ] Type.string)
             }
        )
        [ Elm.int softEllipsisArg_, Elm.string softEllipsisArg_0 ]


{-| Truncate the second string at the specified length if the string is
longer than the specified length, and replace the end of the truncated
string with the first string, such that the resulting string is of the
specified length.

The resulting string will have at most the specified length.

    ellipsisWith 5 " .." "Hello World" --> "He .."

    ellipsisWith 10 " .." "Hello World" --> "Hello W .."

    ellipsisWith 10 " .." "Hello" --> "Hello"

    ellipsisWith 8 " .." "Hello World" --> "Hello .."

ellipsisWith: Int -> String -> String -> String
-}
ellipsisWith : Int -> String -> String -> Elm.Expression
ellipsisWith ellipsisWithArg_ ellipsisWithArg_0 ellipsisWithArg_1 =
    Elm.apply
        (Elm.value
             { importFrom = [ "String", "Extra" ]
             , name = "ellipsisWith"
             , annotation =
                 Just
                     (Type.function
                          [ Type.int, Type.string, Type.string ]
                          Type.string
                     )
             }
        )
        [ Elm.int ellipsisWithArg_
        , Elm.string ellipsisWithArg_0
        , Elm.string ellipsisWithArg_1
        ]


{-| Remove all HTML tags from the string, preserving the text inside them.

    stripTags "a <a href=\"#\">link</a>" --> "a link"

    stripTags "<script>alert('hello world!')</script>" --> "alert('hello world!')"

stripTags: String -> String
-}
stripTags : String -> Elm.Expression
stripTags stripTagsArg_ =
    Elm.apply
        (Elm.value
             { importFrom = [ "String", "Extra" ]
             , name = "stripTags"
             , annotation = Just (Type.function [ Type.string ] Type.string)
             }
        )
        [ Elm.string stripTagsArg_ ]


{-| Given a number, a singular string, and a plural string, return the number
followed by a space, followed by either the singular string if the number was 1,
or the plural string otherwise.

    pluralize "elf" "elves" 2 --> "2 elves"

    pluralize "elf" "elves" 1 --> "1 elf"

    pluralize "elf" "elves" 0 --> "0 elves"

**Note:** This will only work in English and if you anticipate needing to translate
your application into multiple languages, you would be better served by adopting
a [package better prepared to handle various languages](https://package.elm-lang.org/packages/GlobalWebIndex/elm-plural-rules/latest/PluralRules).

pluralize: String -> String -> Int -> String
-}
pluralize : String -> String -> Int -> Elm.Expression
pluralize pluralizeArg_ pluralizeArg_0 pluralizeArg_1 =
    Elm.apply
        (Elm.value
             { importFrom = [ "String", "Extra" ]
             , name = "pluralize"
             , annotation =
                 Just
                     (Type.function
                          [ Type.string, Type.string, Type.int ]
                          Type.string
                     )
             }
        )
        [ Elm.string pluralizeArg_
        , Elm.string pluralizeArg_0
        , Elm.int pluralizeArg_1
        ]


{-| Convert a list of strings into a human-readable list.

    toSentence [] --> ""

    toSentence [ "lions" ] --> "lions"

    toSentence [ "lions", "tigers" ] --> "lions and tigers"

    toSentence [ "lions", "tigers", "bears" ] --> "lions, tigers and bears"

toSentence: List String -> String
-}
toSentence : List String -> Elm.Expression
toSentence toSentenceArg_ =
    Elm.apply
        (Elm.value
             { importFrom = [ "String", "Extra" ]
             , name = "toSentence"
             , annotation =
                 Just (Type.function [ Type.list Type.string ] Type.string)
             }
        )
        [ Elm.list (List.map Elm.string toSentenceArg_) ]


{-| Convert a list of strings into a human-readable list using an oxford comma.

    toSentenceOxford [] --> ""

    toSentenceOxford [ "lions" ] --> "lions"

    toSentenceOxford [ "lions", "tigers" ] --> "lions and tigers"

    toSentenceOxford [ "lions", "tigers", "bears" ] --> "lions, tigers, and bears"

toSentenceOxford: List String -> String
-}
toSentenceOxford : List String -> Elm.Expression
toSentenceOxford toSentenceOxfordArg_ =
    Elm.apply
        (Elm.value
             { importFrom = [ "String", "Extra" ]
             , name = "toSentenceOxford"
             , annotation =
                 Just (Type.function [ Type.list Type.string ] Type.string)
             }
        )
        [ Elm.list (List.map Elm.string toSentenceOxfordArg_) ]


{-| Search a string from left to right for a pattern and return a substring
consisting of the characters in the string that are to the right of the pattern.

    rightOf "_" "This_is_a_test_string" --> "is_a_test_string"

rightOf: String -> String -> String
-}
rightOf : String -> String -> Elm.Expression
rightOf rightOfArg_ rightOfArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "String", "Extra" ]
             , name = "rightOf"
             , annotation =
                 Just (Type.function [ Type.string, Type.string ] Type.string)
             }
        )
        [ Elm.string rightOfArg_, Elm.string rightOfArg_0 ]


{-| Search a string from left to right for a pattern and return a substring
consisting of the characters in the string that are to the left of the pattern.

    leftOf "_" "This_is_a_test_string" --> "This"

leftOf: String -> String -> String
-}
leftOf : String -> String -> Elm.Expression
leftOf leftOfArg_ leftOfArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "String", "Extra" ]
             , name = "leftOf"
             , annotation =
                 Just (Type.function [ Type.string, Type.string ] Type.string)
             }
        )
        [ Elm.string leftOfArg_, Elm.string leftOfArg_0 ]


{-| Search a string from right to left for a pattern and return a substring
consisting of the characters in the string that are to the right of the pattern.

    rightOfBack "_" "This_is_a_test_string" --> "string"

rightOfBack: String -> String -> String
-}
rightOfBack : String -> String -> Elm.Expression
rightOfBack rightOfBackArg_ rightOfBackArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "String", "Extra" ]
             , name = "rightOfBack"
             , annotation =
                 Just (Type.function [ Type.string, Type.string ] Type.string)
             }
        )
        [ Elm.string rightOfBackArg_, Elm.string rightOfBackArg_0 ]


{-| Search a string from right to left for a pattern and return a substring
consisting of the characters in the string that are to the left of the pattern.

    leftOfBack "_" "This_is_a_test_string" --> "This_is_a_test"

leftOfBack: String -> String -> String
-}
leftOfBack : String -> String -> Elm.Expression
leftOfBack leftOfBackArg_ leftOfBackArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "String", "Extra" ]
             , name = "leftOfBack"
             , annotation =
                 Just (Type.function [ Type.string, Type.string ] Type.string)
             }
        )
        [ Elm.string leftOfBackArg_, Elm.string leftOfBackArg_0 ]


{-| Convert a string into a list of UTF-32 code points.

    toCodePoints "abc" --> [ 97, 98, 99 ]

    toCodePoints "©§π" --> [ 169, 167, 960 ]

    toCodePoints "💩!" --> [ 128169, 33 ]

Note that code points do not necessarily correspond to logical/visual
characters, since it is possible for things like accented characters to be
represented as two separate UTF-32 code points (a base character and a
combining accent).

`toCodePoints string` is equivalent to:

    List.map Char.toCode (String.toList string)

toCodePoints: String -> List Int
-}
toCodePoints : String -> Elm.Expression
toCodePoints toCodePointsArg_ =
    Elm.apply
        (Elm.value
             { importFrom = [ "String", "Extra" ]
             , name = "toCodePoints"
             , annotation =
                 Just (Type.function [ Type.string ] (Type.list Type.int))
             }
        )
        [ Elm.string toCodePointsArg_ ]


{-| Convert a list of UTF-32 code points into a string. Inverse of
`toCodePoints`.

    fromCodePoints [ 97, 98, 99 ] --> "abc"

    fromCodePoints [ 169, 167, 960 ] --> "©§π"

    fromCodePoints [ 128169, 33 ] --> "💩!"

`fromCodePoints codePoints` is equivalent to:

    String.fromList (List.map Char.fromCode codePoints)

fromCodePoints: List Int -> String
-}
fromCodePoints : List Int -> Elm.Expression
fromCodePoints fromCodePointsArg_ =
    Elm.apply
        (Elm.value
             { importFrom = [ "String", "Extra" ]
             , name = "fromCodePoints"
             , annotation =
                 Just (Type.function [ Type.list Type.int ] Type.string)
             }
        )
        [ Elm.list (List.map Elm.int fromCodePointsArg_) ]


call_ :
    { toSentenceCase : Elm.Expression -> Elm.Expression
    , toTitleCase : Elm.Expression -> Elm.Expression
    , decapitalize : Elm.Expression -> Elm.Expression
    , camelize : Elm.Expression -> Elm.Expression
    , classify : Elm.Expression -> Elm.Expression
    , underscored : Elm.Expression -> Elm.Expression
    , dasherize : Elm.Expression -> Elm.Expression
    , humanize : Elm.Expression -> Elm.Expression
    , replaceSlice :
        Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
    , insertAt :
        Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
    , nonEmpty : Elm.Expression -> Elm.Expression
    , nonBlank : Elm.Expression -> Elm.Expression
    , removeDiacritics : Elm.Expression -> Elm.Expression
    , break : Elm.Expression -> Elm.Expression -> Elm.Expression
    , softBreak : Elm.Expression -> Elm.Expression -> Elm.Expression
    , wrap : Elm.Expression -> Elm.Expression -> Elm.Expression
    , wrapWith :
        Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
    , softWrap : Elm.Expression -> Elm.Expression -> Elm.Expression
    , softWrapWith :
        Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
    , quote : Elm.Expression -> Elm.Expression
    , surround : Elm.Expression -> Elm.Expression -> Elm.Expression
    , isBlank : Elm.Expression -> Elm.Expression
    , countOccurrences : Elm.Expression -> Elm.Expression -> Elm.Expression
    , clean : Elm.Expression -> Elm.Expression
    , unquote : Elm.Expression -> Elm.Expression
    , unsurround : Elm.Expression -> Elm.Expression -> Elm.Expression
    , unindent : Elm.Expression -> Elm.Expression
    , ellipsis : Elm.Expression -> Elm.Expression -> Elm.Expression
    , softEllipsis : Elm.Expression -> Elm.Expression -> Elm.Expression
    , ellipsisWith :
        Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
    , stripTags : Elm.Expression -> Elm.Expression
    , pluralize :
        Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
    , toSentence : Elm.Expression -> Elm.Expression
    , toSentenceOxford : Elm.Expression -> Elm.Expression
    , rightOf : Elm.Expression -> Elm.Expression -> Elm.Expression
    , leftOf : Elm.Expression -> Elm.Expression -> Elm.Expression
    , rightOfBack : Elm.Expression -> Elm.Expression -> Elm.Expression
    , leftOfBack : Elm.Expression -> Elm.Expression -> Elm.Expression
    , toCodePoints : Elm.Expression -> Elm.Expression
    , fromCodePoints : Elm.Expression -> Elm.Expression
    }
call_ =
    { toSentenceCase =
        \toSentenceCaseArg_ ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "String", "Extra" ]
                     , name = "toSentenceCase"
                     , annotation =
                         Just (Type.function [ Type.string ] Type.string)
                     }
                )
                [ toSentenceCaseArg_ ]
    , toTitleCase =
        \toTitleCaseArg_ ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "String", "Extra" ]
                     , name = "toTitleCase"
                     , annotation =
                         Just (Type.function [ Type.string ] Type.string)
                     }
                )
                [ toTitleCaseArg_ ]
    , decapitalize =
        \decapitalizeArg_ ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "String", "Extra" ]
                     , name = "decapitalize"
                     , annotation =
                         Just (Type.function [ Type.string ] Type.string)
                     }
                )
                [ decapitalizeArg_ ]
    , camelize =
        \camelizeArg_ ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "String", "Extra" ]
                     , name = "camelize"
                     , annotation =
                         Just (Type.function [ Type.string ] Type.string)
                     }
                )
                [ camelizeArg_ ]
    , classify =
        \classifyArg_ ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "String", "Extra" ]
                     , name = "classify"
                     , annotation =
                         Just (Type.function [ Type.string ] Type.string)
                     }
                )
                [ classifyArg_ ]
    , underscored =
        \underscoredArg_ ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "String", "Extra" ]
                     , name = "underscored"
                     , annotation =
                         Just (Type.function [ Type.string ] Type.string)
                     }
                )
                [ underscoredArg_ ]
    , dasherize =
        \dasherizeArg_ ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "String", "Extra" ]
                     , name = "dasherize"
                     , annotation =
                         Just (Type.function [ Type.string ] Type.string)
                     }
                )
                [ dasherizeArg_ ]
    , humanize =
        \humanizeArg_ ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "String", "Extra" ]
                     , name = "humanize"
                     , annotation =
                         Just (Type.function [ Type.string ] Type.string)
                     }
                )
                [ humanizeArg_ ]
    , replaceSlice =
        \replaceSliceArg_ replaceSliceArg_0 replaceSliceArg_1 replaceSliceArg_2 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "String", "Extra" ]
                     , name = "replaceSlice"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.string
                                  , Type.int
                                  , Type.int
                                  , Type.string
                                  ]
                                  Type.string
                             )
                     }
                )
                [ replaceSliceArg_
                , replaceSliceArg_0
                , replaceSliceArg_1
                , replaceSliceArg_2
                ]
    , insertAt =
        \insertAtArg_ insertAtArg_0 insertAtArg_1 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "String", "Extra" ]
                     , name = "insertAt"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.string, Type.int, Type.string ]
                                  Type.string
                             )
                     }
                )
                [ insertAtArg_, insertAtArg_0, insertAtArg_1 ]
    , nonEmpty =
        \nonEmptyArg_ ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "String", "Extra" ]
                     , name = "nonEmpty"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.string ]
                                  (Type.maybe Type.string)
                             )
                     }
                )
                [ nonEmptyArg_ ]
    , nonBlank =
        \nonBlankArg_ ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "String", "Extra" ]
                     , name = "nonBlank"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.string ]
                                  (Type.maybe Type.string)
                             )
                     }
                )
                [ nonBlankArg_ ]
    , removeDiacritics =
        \removeDiacriticsArg_ ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "String", "Extra" ]
                     , name = "removeDiacritics"
                     , annotation =
                         Just (Type.function [ Type.string ] Type.string)
                     }
                )
                [ removeDiacriticsArg_ ]
    , break =
        \breakArg_ breakArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "String", "Extra" ]
                     , name = "break"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.int, Type.string ]
                                  (Type.list Type.string)
                             )
                     }
                )
                [ breakArg_, breakArg_0 ]
    , softBreak =
        \softBreakArg_ softBreakArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "String", "Extra" ]
                     , name = "softBreak"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.int, Type.string ]
                                  (Type.list Type.string)
                             )
                     }
                )
                [ softBreakArg_, softBreakArg_0 ]
    , wrap =
        \wrapArg_ wrapArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "String", "Extra" ]
                     , name = "wrap"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.int, Type.string ]
                                  Type.string
                             )
                     }
                )
                [ wrapArg_, wrapArg_0 ]
    , wrapWith =
        \wrapWithArg_ wrapWithArg_0 wrapWithArg_1 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "String", "Extra" ]
                     , name = "wrapWith"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.int, Type.string, Type.string ]
                                  Type.string
                             )
                     }
                )
                [ wrapWithArg_, wrapWithArg_0, wrapWithArg_1 ]
    , softWrap =
        \softWrapArg_ softWrapArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "String", "Extra" ]
                     , name = "softWrap"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.int, Type.string ]
                                  Type.string
                             )
                     }
                )
                [ softWrapArg_, softWrapArg_0 ]
    , softWrapWith =
        \softWrapWithArg_ softWrapWithArg_0 softWrapWithArg_1 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "String", "Extra" ]
                     , name = "softWrapWith"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.int, Type.string, Type.string ]
                                  Type.string
                             )
                     }
                )
                [ softWrapWithArg_, softWrapWithArg_0, softWrapWithArg_1 ]
    , quote =
        \quoteArg_ ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "String", "Extra" ]
                     , name = "quote"
                     , annotation =
                         Just (Type.function [ Type.string ] Type.string)
                     }
                )
                [ quoteArg_ ]
    , surround =
        \surroundArg_ surroundArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "String", "Extra" ]
                     , name = "surround"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.string, Type.string ]
                                  Type.string
                             )
                     }
                )
                [ surroundArg_, surroundArg_0 ]
    , isBlank =
        \isBlankArg_ ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "String", "Extra" ]
                     , name = "isBlank"
                     , annotation =
                         Just (Type.function [ Type.string ] Type.bool)
                     }
                )
                [ isBlankArg_ ]
    , countOccurrences =
        \countOccurrencesArg_ countOccurrencesArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "String", "Extra" ]
                     , name = "countOccurrences"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.string, Type.string ]
                                  Type.int
                             )
                     }
                )
                [ countOccurrencesArg_, countOccurrencesArg_0 ]
    , clean =
        \cleanArg_ ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "String", "Extra" ]
                     , name = "clean"
                     , annotation =
                         Just (Type.function [ Type.string ] Type.string)
                     }
                )
                [ cleanArg_ ]
    , unquote =
        \unquoteArg_ ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "String", "Extra" ]
                     , name = "unquote"
                     , annotation =
                         Just (Type.function [ Type.string ] Type.string)
                     }
                )
                [ unquoteArg_ ]
    , unsurround =
        \unsurroundArg_ unsurroundArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "String", "Extra" ]
                     , name = "unsurround"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.string, Type.string ]
                                  Type.string
                             )
                     }
                )
                [ unsurroundArg_, unsurroundArg_0 ]
    , unindent =
        \unindentArg_ ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "String", "Extra" ]
                     , name = "unindent"
                     , annotation =
                         Just (Type.function [ Type.string ] Type.string)
                     }
                )
                [ unindentArg_ ]
    , ellipsis =
        \ellipsisArg_ ellipsisArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "String", "Extra" ]
                     , name = "ellipsis"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.int, Type.string ]
                                  Type.string
                             )
                     }
                )
                [ ellipsisArg_, ellipsisArg_0 ]
    , softEllipsis =
        \softEllipsisArg_ softEllipsisArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "String", "Extra" ]
                     , name = "softEllipsis"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.int, Type.string ]
                                  Type.string
                             )
                     }
                )
                [ softEllipsisArg_, softEllipsisArg_0 ]
    , ellipsisWith =
        \ellipsisWithArg_ ellipsisWithArg_0 ellipsisWithArg_1 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "String", "Extra" ]
                     , name = "ellipsisWith"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.int, Type.string, Type.string ]
                                  Type.string
                             )
                     }
                )
                [ ellipsisWithArg_, ellipsisWithArg_0, ellipsisWithArg_1 ]
    , stripTags =
        \stripTagsArg_ ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "String", "Extra" ]
                     , name = "stripTags"
                     , annotation =
                         Just (Type.function [ Type.string ] Type.string)
                     }
                )
                [ stripTagsArg_ ]
    , pluralize =
        \pluralizeArg_ pluralizeArg_0 pluralizeArg_1 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "String", "Extra" ]
                     , name = "pluralize"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.string, Type.string, Type.int ]
                                  Type.string
                             )
                     }
                )
                [ pluralizeArg_, pluralizeArg_0, pluralizeArg_1 ]
    , toSentence =
        \toSentenceArg_ ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "String", "Extra" ]
                     , name = "toSentence"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.list Type.string ]
                                  Type.string
                             )
                     }
                )
                [ toSentenceArg_ ]
    , toSentenceOxford =
        \toSentenceOxfordArg_ ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "String", "Extra" ]
                     , name = "toSentenceOxford"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.list Type.string ]
                                  Type.string
                             )
                     }
                )
                [ toSentenceOxfordArg_ ]
    , rightOf =
        \rightOfArg_ rightOfArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "String", "Extra" ]
                     , name = "rightOf"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.string, Type.string ]
                                  Type.string
                             )
                     }
                )
                [ rightOfArg_, rightOfArg_0 ]
    , leftOf =
        \leftOfArg_ leftOfArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "String", "Extra" ]
                     , name = "leftOf"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.string, Type.string ]
                                  Type.string
                             )
                     }
                )
                [ leftOfArg_, leftOfArg_0 ]
    , rightOfBack =
        \rightOfBackArg_ rightOfBackArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "String", "Extra" ]
                     , name = "rightOfBack"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.string, Type.string ]
                                  Type.string
                             )
                     }
                )
                [ rightOfBackArg_, rightOfBackArg_0 ]
    , leftOfBack =
        \leftOfBackArg_ leftOfBackArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "String", "Extra" ]
                     , name = "leftOfBack"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.string, Type.string ]
                                  Type.string
                             )
                     }
                )
                [ leftOfBackArg_, leftOfBackArg_0 ]
    , toCodePoints =
        \toCodePointsArg_ ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "String", "Extra" ]
                     , name = "toCodePoints"
                     , annotation =
                         Just
                             (Type.function [ Type.string ] (Type.list Type.int)
                             )
                     }
                )
                [ toCodePointsArg_ ]
    , fromCodePoints =
        \fromCodePointsArg_ ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "String", "Extra" ]
                     , name = "fromCodePoints"
                     , annotation =
                         Just (Type.function [ Type.list Type.int ] Type.string)
                     }
                )
                [ fromCodePointsArg_ ]
    }


values_ :
    { toSentenceCase : Elm.Expression
    , toTitleCase : Elm.Expression
    , decapitalize : Elm.Expression
    , camelize : Elm.Expression
    , classify : Elm.Expression
    , underscored : Elm.Expression
    , dasherize : Elm.Expression
    , humanize : Elm.Expression
    , replaceSlice : Elm.Expression
    , insertAt : Elm.Expression
    , nonEmpty : Elm.Expression
    , nonBlank : Elm.Expression
    , removeDiacritics : Elm.Expression
    , break : Elm.Expression
    , softBreak : Elm.Expression
    , wrap : Elm.Expression
    , wrapWith : Elm.Expression
    , softWrap : Elm.Expression
    , softWrapWith : Elm.Expression
    , quote : Elm.Expression
    , surround : Elm.Expression
    , isBlank : Elm.Expression
    , countOccurrences : Elm.Expression
    , clean : Elm.Expression
    , unquote : Elm.Expression
    , unsurround : Elm.Expression
    , unindent : Elm.Expression
    , ellipsis : Elm.Expression
    , softEllipsis : Elm.Expression
    , ellipsisWith : Elm.Expression
    , stripTags : Elm.Expression
    , pluralize : Elm.Expression
    , toSentence : Elm.Expression
    , toSentenceOxford : Elm.Expression
    , rightOf : Elm.Expression
    , leftOf : Elm.Expression
    , rightOfBack : Elm.Expression
    , leftOfBack : Elm.Expression
    , toCodePoints : Elm.Expression
    , fromCodePoints : Elm.Expression
    }
values_ =
    { toSentenceCase =
        Elm.value
            { importFrom = [ "String", "Extra" ]
            , name = "toSentenceCase"
            , annotation = Just (Type.function [ Type.string ] Type.string)
            }
    , toTitleCase =
        Elm.value
            { importFrom = [ "String", "Extra" ]
            , name = "toTitleCase"
            , annotation = Just (Type.function [ Type.string ] Type.string)
            }
    , decapitalize =
        Elm.value
            { importFrom = [ "String", "Extra" ]
            , name = "decapitalize"
            , annotation = Just (Type.function [ Type.string ] Type.string)
            }
    , camelize =
        Elm.value
            { importFrom = [ "String", "Extra" ]
            , name = "camelize"
            , annotation = Just (Type.function [ Type.string ] Type.string)
            }
    , classify =
        Elm.value
            { importFrom = [ "String", "Extra" ]
            , name = "classify"
            , annotation = Just (Type.function [ Type.string ] Type.string)
            }
    , underscored =
        Elm.value
            { importFrom = [ "String", "Extra" ]
            , name = "underscored"
            , annotation = Just (Type.function [ Type.string ] Type.string)
            }
    , dasherize =
        Elm.value
            { importFrom = [ "String", "Extra" ]
            , name = "dasherize"
            , annotation = Just (Type.function [ Type.string ] Type.string)
            }
    , humanize =
        Elm.value
            { importFrom = [ "String", "Extra" ]
            , name = "humanize"
            , annotation = Just (Type.function [ Type.string ] Type.string)
            }
    , replaceSlice =
        Elm.value
            { importFrom = [ "String", "Extra" ]
            , name = "replaceSlice"
            , annotation =
                Just
                    (Type.function
                         [ Type.string, Type.int, Type.int, Type.string ]
                         Type.string
                    )
            }
    , insertAt =
        Elm.value
            { importFrom = [ "String", "Extra" ]
            , name = "insertAt"
            , annotation =
                Just
                    (Type.function
                         [ Type.string, Type.int, Type.string ]
                         Type.string
                    )
            }
    , nonEmpty =
        Elm.value
            { importFrom = [ "String", "Extra" ]
            , name = "nonEmpty"
            , annotation =
                Just (Type.function [ Type.string ] (Type.maybe Type.string))
            }
    , nonBlank =
        Elm.value
            { importFrom = [ "String", "Extra" ]
            , name = "nonBlank"
            , annotation =
                Just (Type.function [ Type.string ] (Type.maybe Type.string))
            }
    , removeDiacritics =
        Elm.value
            { importFrom = [ "String", "Extra" ]
            , name = "removeDiacritics"
            , annotation = Just (Type.function [ Type.string ] Type.string)
            }
    , break =
        Elm.value
            { importFrom = [ "String", "Extra" ]
            , name = "break"
            , annotation =
                Just
                    (Type.function
                         [ Type.int, Type.string ]
                         (Type.list Type.string)
                    )
            }
    , softBreak =
        Elm.value
            { importFrom = [ "String", "Extra" ]
            , name = "softBreak"
            , annotation =
                Just
                    (Type.function
                         [ Type.int, Type.string ]
                         (Type.list Type.string)
                    )
            }
    , wrap =
        Elm.value
            { importFrom = [ "String", "Extra" ]
            , name = "wrap"
            , annotation =
                Just (Type.function [ Type.int, Type.string ] Type.string)
            }
    , wrapWith =
        Elm.value
            { importFrom = [ "String", "Extra" ]
            , name = "wrapWith"
            , annotation =
                Just
                    (Type.function
                         [ Type.int, Type.string, Type.string ]
                         Type.string
                    )
            }
    , softWrap =
        Elm.value
            { importFrom = [ "String", "Extra" ]
            , name = "softWrap"
            , annotation =
                Just (Type.function [ Type.int, Type.string ] Type.string)
            }
    , softWrapWith =
        Elm.value
            { importFrom = [ "String", "Extra" ]
            , name = "softWrapWith"
            , annotation =
                Just
                    (Type.function
                         [ Type.int, Type.string, Type.string ]
                         Type.string
                    )
            }
    , quote =
        Elm.value
            { importFrom = [ "String", "Extra" ]
            , name = "quote"
            , annotation = Just (Type.function [ Type.string ] Type.string)
            }
    , surround =
        Elm.value
            { importFrom = [ "String", "Extra" ]
            , name = "surround"
            , annotation =
                Just (Type.function [ Type.string, Type.string ] Type.string)
            }
    , isBlank =
        Elm.value
            { importFrom = [ "String", "Extra" ]
            , name = "isBlank"
            , annotation = Just (Type.function [ Type.string ] Type.bool)
            }
    , countOccurrences =
        Elm.value
            { importFrom = [ "String", "Extra" ]
            , name = "countOccurrences"
            , annotation =
                Just (Type.function [ Type.string, Type.string ] Type.int)
            }
    , clean =
        Elm.value
            { importFrom = [ "String", "Extra" ]
            , name = "clean"
            , annotation = Just (Type.function [ Type.string ] Type.string)
            }
    , unquote =
        Elm.value
            { importFrom = [ "String", "Extra" ]
            , name = "unquote"
            , annotation = Just (Type.function [ Type.string ] Type.string)
            }
    , unsurround =
        Elm.value
            { importFrom = [ "String", "Extra" ]
            , name = "unsurround"
            , annotation =
                Just (Type.function [ Type.string, Type.string ] Type.string)
            }
    , unindent =
        Elm.value
            { importFrom = [ "String", "Extra" ]
            , name = "unindent"
            , annotation = Just (Type.function [ Type.string ] Type.string)
            }
    , ellipsis =
        Elm.value
            { importFrom = [ "String", "Extra" ]
            , name = "ellipsis"
            , annotation =
                Just (Type.function [ Type.int, Type.string ] Type.string)
            }
    , softEllipsis =
        Elm.value
            { importFrom = [ "String", "Extra" ]
            , name = "softEllipsis"
            , annotation =
                Just (Type.function [ Type.int, Type.string ] Type.string)
            }
    , ellipsisWith =
        Elm.value
            { importFrom = [ "String", "Extra" ]
            , name = "ellipsisWith"
            , annotation =
                Just
                    (Type.function
                         [ Type.int, Type.string, Type.string ]
                         Type.string
                    )
            }
    , stripTags =
        Elm.value
            { importFrom = [ "String", "Extra" ]
            , name = "stripTags"
            , annotation = Just (Type.function [ Type.string ] Type.string)
            }
    , pluralize =
        Elm.value
            { importFrom = [ "String", "Extra" ]
            , name = "pluralize"
            , annotation =
                Just
                    (Type.function
                         [ Type.string, Type.string, Type.int ]
                         Type.string
                    )
            }
    , toSentence =
        Elm.value
            { importFrom = [ "String", "Extra" ]
            , name = "toSentence"
            , annotation =
                Just (Type.function [ Type.list Type.string ] Type.string)
            }
    , toSentenceOxford =
        Elm.value
            { importFrom = [ "String", "Extra" ]
            , name = "toSentenceOxford"
            , annotation =
                Just (Type.function [ Type.list Type.string ] Type.string)
            }
    , rightOf =
        Elm.value
            { importFrom = [ "String", "Extra" ]
            , name = "rightOf"
            , annotation =
                Just (Type.function [ Type.string, Type.string ] Type.string)
            }
    , leftOf =
        Elm.value
            { importFrom = [ "String", "Extra" ]
            , name = "leftOf"
            , annotation =
                Just (Type.function [ Type.string, Type.string ] Type.string)
            }
    , rightOfBack =
        Elm.value
            { importFrom = [ "String", "Extra" ]
            , name = "rightOfBack"
            , annotation =
                Just (Type.function [ Type.string, Type.string ] Type.string)
            }
    , leftOfBack =
        Elm.value
            { importFrom = [ "String", "Extra" ]
            , name = "leftOfBack"
            , annotation =
                Just (Type.function [ Type.string, Type.string ] Type.string)
            }
    , toCodePoints =
        Elm.value
            { importFrom = [ "String", "Extra" ]
            , name = "toCodePoints"
            , annotation =
                Just (Type.function [ Type.string ] (Type.list Type.int))
            }
    , fromCodePoints =
        Elm.value
            { importFrom = [ "String", "Extra" ]
            , name = "fromCodePoints"
            , annotation =
                Just (Type.function [ Type.list Type.int ] Type.string)
            }
    }