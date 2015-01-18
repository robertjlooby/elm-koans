module AboutStrings where

import String
import ElmTest.Assertion (..)
import ElmTest.Test as Test
import TestHelpers (..)

testSuite = Test.suite "About Strings" [
              Test.test "length returns the string length" (assertEqual xInt (String.length "Hello")),
              Test.test "isEmpty tests for an empty string" (assert (String.isEmpty xString)),
              Test.test "reverse returns the reverse of a string" (assertEqual xString (String.reverse "Hello")),
              Test.test "repeat returns the a string repeated n times" (assertEqual xString (String.repeat 2 "ya")),
              Test.test "the ++ infix function appends two strings" (assertEqual ("Elm" ++ "Lang") xString),
              Test.test "append does the same thing" (assertEqual (String.append "Elm" "Lang") xString),
              Test.test "concat appends a list of strings together" (assertEqual (String.concat ["Elm", "Lang", "Yay!"]) xString),
              Test.test "join is like concat with a string as a separator" (assertEqual (String.concat "," ["I'm", "a", "csv"]) xString),
              Test.test "split does the opposite" (assertEqual (String.split "," "I'm,a,csv") xList),
              Test.test "cons appends a char to a string" (assertEqual xString (String.cons 'l' "ol")),
              Test.test "fromChar returns a string version of a char" (assertEqual xString (String.fromChar 'a')),
uncons
words
lines
slice
left
right
dropleft
dropright
contains
startswith
endswith
indexes
indicies
toint
tofloat
tolist
fromlist
toupper
tolower
trim
q
            ]
