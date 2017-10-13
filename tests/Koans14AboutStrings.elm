module Koans14AboutStrings exposing (testSuite)

import Expect
import String
import Utils.Test exposing (describe, test)
import Utils.Blank exposing (..)


testSuite =
    describe "About Strings"
        [ test "length returns the string length" <|
            \() ->
                x____replace me____x
                    |> Expect.equal (String.length "Hello")
        , test "isEmpty tests for an empty string" <|
            \() ->
                String.isEmpty (x____replace me____x)
                    |> Expect.true "Should be True"
        , test "reverse returns the reverse of a string" <|
            \() ->
                x____replace me____x
                    |> Expect.equal (String.reverse "Hello")
        , test "repeat returns the string repeated n times" <|
            \() ->
                x____replace me____x
                    |> Expect.equal (String.repeat 2 "ya")
        , test "the ++ infix function appends two strings" <|
            \() ->
                x____replace me____x
                    |> Expect.equal ("Elm" ++ "Lang")
        , test "append does the same thing" <|
            \() ->
                x____replace me____x
                    |> Expect.equal (String.append "Elm" "Lang")
        , test "concat appends a list of strings together" <|
            \() ->
                x____replace me____x
                    |> Expect.equal (String.concat [ "Elm", "Lang", "Yay!" ])
        , test "join is like concat with a separator" <|
            \() ->
                x____replace me____x
                    |> Expect.equal (String.join "," [ "I'm", "a", "csv" ])
        , test "split does the opposite" <|
            \() ->
                x____replace me____x
                    |> Expect.equal (String.split "," "I'm,a,csv")
        , test "slice gets a substring" <|
            \() ->
                x____replace me____x
                    |> Expect.equal (String.slice 4 12 "I'm a string")
        , test "negative indices start from the end" <|
            \() ->
                x____replace me____x
                    |> Expect.equal (String.slice -8 -1 "I'm a string")
        , test "left takes the first n characters of a string" <|
            \() ->
                x____replace me____x
                    |> Expect.equal (String.left 3 "I'm a string")
        , test "right takes the last n characters of a string" <|
            \() ->
                x____replace me____x
                    |> Expect.equal (String.right 3 "I'm a string")
        , test "dropLeft drops the first n characters of a string" <|
            \() ->
                x____replace me____x
                    |> Expect.equal (String.dropLeft 3 "I'm a string")
        , test "dropRight drops the last n characters of a string" <|
            \() ->
                x____replace me____x
                    |> Expect.equal (String.dropRight 3 "I'm a string")
        , test "contains looks for a substring" <|
            \() ->
                x____replace me____x
                    |> Expect.equal (String.contains "string" "I'm a string")
        , test "indexes gives the location of each occurance" <|
            -- there are sooooo many string functions, just check them out
            \() ->
                x____replace me____x
                    |> Expect.equal (String.indexes "string" "I'm a string")
        ]
