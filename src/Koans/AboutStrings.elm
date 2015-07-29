module AboutStrings where

import ElmTest.Assertion exposing (..)
import ElmTest.Test as Test
import String
import TestHelpers exposing (..)


testSuite =
  Test.suite
    "About Strings"
    [ Test.test "length returns the string length" (assertEqual xNum (String.length "Hello"))
    , Test.test "isEmpty tests for an empty string" (assert (String.isEmpty xString))
    , Test.test "reverse returns the reverse of a string" (assertEqual xString (String.reverse "Hello"))
    , Test.test "repeat returns the a string repeated n times" (assertEqual xString (String.repeat 2 "ya"))
    , Test.test "the ++ infix function appends two strings" (assertEqual ("Elm" ++ "Lang") xString)
    , Test.test "append does the same thing" (assertEqual (String.append "Elm" "Lang") xString)
    , Test.test "concat appends a list of strings together" (assertEqual (String.concat ["Elm", "Lang", "Yay!"]) xString)
    , Test.test "join is like concat with a separator" (assertEqual (String.join "," ["I'm", "a", "csv"]) xString)
    , Test.test "split does the opposite" (assertEqual (String.split "," "I'm,a,csv") xList)
    , Test.test "slice gets a substring" (assertEqual (String.slice 4 12 "I'm a string") xString)
    , Test.test "negative indicies start from the end" (assertEqual (String.slice -8 -1 "I'm a string") xString)
    , Test.test "left takes the first n characters of a string" (assertEqual (String.left 3 "I'm a string") xString)
    , Test.test "right takes the last n characters of a string" (assertEqual (String.right 3 "I'm a string") xString)
    , Test.test "dropLeft drops the first n characters of a string" (assertEqual (String.dropLeft 3 "I'm a string") xString)
    , Test.test "dropRight drops the last n characters of a string" (assertEqual (String.dropRight 3 "I'm a string") xString)
    , Test.test "contains looks for a substring" (assertEqual (String.contains "string" "I'm a string") xBool)
    , Test.test "indexes gives the location of each occurance" (assertEqual (String.indexes "string" "I'm a string") xList)
      -- there are sooooo many string functions, just check them out
    ]
