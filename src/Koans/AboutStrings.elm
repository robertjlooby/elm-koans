module AboutStrings exposing (testSuite)

import Expect
import String
import Test exposing (describe, test)
import TestHelpers exposing (..)


testSuite =
    describe "About Strings"
        [ test "length returns the string length" <|
            \() ->
                xNum
                    |> Expect.equal (String.length "Hello")
        , test "isEmpty tests for an empty string" <|
            \() ->
                (String.isEmpty xString)
                    |> Expect.true "Should be True"
        , test "reverse returns the reverse of a string" <|
            \() ->
                xString
                    |> Expect.equal (String.reverse "Hello")
        , test "repeat returns the string repeated n times" <|
            \() ->
                xString
                    |> Expect.equal (String.repeat 2 "ya")
        , test "the ++ infix function appends two strings" <|
            \() ->
                xString
                    |> Expect.equal ("Elm" ++ "Lang")
        , test "append does the same thing" <|
            \() ->
                xString
                    |> Expect.equal (String.append "Elm" "Lang")
        , test "concat appends a list of strings together" <|
            \() ->
                xString
                    |> Expect.equal (String.concat [ "Elm", "Lang", "Yay!" ])
        , test "join is like concat with a separator" <|
            \() ->
                xString
                    |> Expect.equal (String.join "," [ "I'm", "a", "csv" ])
        , test "split does the opposite" <|
            \() ->
                xList
                    |> Expect.equal (String.split "," "I'm,a,csv")
        , test "slice gets a substring" <|
            \() ->
                xString
                    |> Expect.equal (String.slice 4 12 "I'm a string")
        , test "negative indices start from the end" <|
            \() ->
                xString
                    |> Expect.equal (String.slice -8 -1 "I'm a string")
        , test "left takes the first n characters of a string" <|
            \() ->
                xString
                    |> Expect.equal (String.left 3 "I'm a string")
        , test "right takes the last n characters of a string" <|
            \() ->
                xString
                    |> Expect.equal (String.right 3 "I'm a string")
        , test "dropLeft drops the first n characters of a string" <|
            \() ->
                xString
                    |> Expect.equal (String.dropLeft 3 "I'm a string")
        , test "dropRight drops the last n characters of a string" <|
            \() ->
                xString
                    |> Expect.equal (String.dropRight 3 "I'm a string")
        , test "contains looks for a substring" <|
            \() ->
                xBool
                    |> Expect.equal (String.contains "string" "I'm a string")
        , test "indexes gives the location of each occurance" <|
            -- there are sooooo many string functions, just check them out
            \() ->
                xList
                    |> Expect.equal (String.indexes "string" "I'm a string")
        ]
