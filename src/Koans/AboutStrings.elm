module AboutStrings (..) where

import ElmTest exposing (..)
import String
import TestHelpers exposing (..)


testSuite =
  suite
    "About Strings"
    [ test
        "length returns the string length"
        (assertEqual xNum (String.length "Hello"))
    , test
        "isEmpty tests for an empty string"
        (assert (String.isEmpty xString))
    , test
        "reverse returns the reverse of a string"
        (assertEqual xString (String.reverse "Hello"))
    , test
        "repeat returns the string repeated n times"
        (assertEqual xString (String.repeat 2 "ya"))
    , test
        "the ++ infix function appends two strings"
        (assertEqual ("Elm" ++ "Lang") xString)
    , test
        "append does the same thing"
        (assertEqual (String.append "Elm" "Lang") xString)
    , test
        "concat appends a list of strings together"
        (assertEqual (String.concat [ "Elm", "Lang", "Yay!" ]) xString)
    , test
        "join is like concat with a separator"
        (assertEqual (String.join "," [ "I'm", "a", "csv" ]) xString)
    , test
        "split does the opposite"
        (assertEqual (String.split "," "I'm,a,csv") xList)
    , test
        "slice gets a substring"
        (assertEqual (String.slice 4 12 "I'm a string") xString)
    , test
        "negative indices start from the end"
        (assertEqual (String.slice -8 -1 "I'm a string") xString)
    , test
        "left takes the first n characters of a string"
        (assertEqual (String.left 3 "I'm a string") xString)
    , test
        "right takes the last n characters of a string"
        (assertEqual (String.right 3 "I'm a string") xString)
    , test
        "dropLeft drops the first n characters of a string"
        (assertEqual (String.dropLeft 3 "I'm a string") xString)
    , test
        "dropRight drops the last n characters of a string"
        (assertEqual (String.dropRight 3 "I'm a string") xString)
    , test
        "contains looks for a substring"
        (assertEqual (String.contains "string" "I'm a string") xBool)
    , test
        "indexes gives the location of each occurance"
        (assertEqual (String.indexes "string" "I'm a string") xList)
      -- there are sooooo many string functions, just check them out
    ]
