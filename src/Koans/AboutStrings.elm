module AboutStrings exposing (testSuite)

import Expect
import String
import Test exposing (describe, test)
import TestHelpers exposing (..)


testSuite =
    describe "About Strings"
        [ test "length returns the string length" <|
            \() -> Expect.equal (String.length "Hello") xNum
        , test "isEmpty tests for an empty string" <|
            \() -> Expect.true "Should be True" (String.isEmpty xString)
        , test "reverse returns the reverse of a string" <|
            \() -> Expect.equal (String.reverse "Hello") xString
        , test "repeat returns the string repeated n times" <|
            \() -> Expect.equal (String.repeat 2 "ya") xString
        , test "the ++ infix function appends two strings" <|
            \() -> Expect.equal ("Elm" ++ "Lang") xString
        , test "append does the same thing" <|
            \() -> Expect.equal (String.append "Elm" "Lang") xString
        , test "concat appends a list of strings together" <|
            \() -> Expect.equal (String.concat [ "Elm", "Lang", "Yay!" ]) xString
        , test "join is like concat with a separator" <|
            \() -> Expect.equal (String.join "," [ "I'm", "a", "csv" ]) xString
        , test "split does the opposite" <|
            \() -> Expect.equal (String.split "," "I'm,a,csv") xList
        , test "slice gets a substring" <|
            \() -> Expect.equal (String.slice 4 12 "I'm a string") xString
        , test "negative indices start from the end" <|
            \() -> Expect.equal (String.slice -8 -1 "I'm a string") xString
        , test "left takes the first n characters of a string" <|
            \() -> Expect.equal (String.left 3 "I'm a string") xString
        , test "right takes the last n characters of a string" <|
            \() -> Expect.equal (String.right 3 "I'm a string") xString
        , test "dropLeft drops the first n characters of a string" <|
            \() -> Expect.equal (String.dropLeft 3 "I'm a string") xString
        , test "dropRight drops the last n characters of a string" <|
            \() -> Expect.equal (String.dropRight 3 "I'm a string") xString
        , test "contains looks for a substring" <|
            \() -> Expect.equal (String.contains "string" "I'm a string") xBool
        , test "indexes gives the location of each occurance"
          -- there are sooooo many string functions, just check them out
          <|
            \() -> Expect.equal (String.indexes "string" "I'm a string") xList
        ]
