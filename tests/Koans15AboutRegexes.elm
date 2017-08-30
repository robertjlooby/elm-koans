module Koans15AboutRegexes exposing (testSuite)

import Expect
import Regex
import String
import Utils.Test exposing (describe, test)
import Utils.Blank exposing (..)


testSuite =
    describe "About Regex"
        [ test "contains tests for a regex match" <|
            \() ->
                x____replace me____x
                    |> Expect.equal (Regex.contains (Regex.regex "[abc]+") "abcdefg")
        , test "escape will escape all special characters" <|
            \() ->
                x____replace me____x
                    |> Expect.equal (Regex.escape "[abc]+")
        , test "useful for matching strange strings" <|
            \() ->
                x____replace me____x
                    |> Expect.equal (Regex.contains (Regex.regex (Regex.escape "[eir]+")) "w[eir]+d")
        , test "it's easy to make your regex case insensitive" <|
            \() ->
                x____replace me____x
                    |> Expect.equal (Regex.contains (Regex.caseInsensitive (Regex.regex "abc")) "ABC")
        , test "find returns a list of all matches" <|
            \() ->
                x____replace me____x
                    |> Expect.equal (Regex.find Regex.All (Regex.regex "abc") "abcabcabc" |> List.length)
        , test "matches contain the match" <|
            \() ->
                x____replace me____x
                    |> Expect.equal (Regex.find Regex.All (Regex.regex "[abc]") "axbxc" |> List.map (\match -> match.match))
        , test "matches contain the index" <|
            \() ->
                x____replace me____x
                    |> Expect.equal (Regex.find Regex.All (Regex.regex "[abc]") "axbxc" |> List.map (\match -> match.index))
        , test "matches may contain submatches" <|
            \() ->
                x____replace me____x
                    |> Expect.equal (Regex.find Regex.All (Regex.regex "(a)|(b)") "axbxc" |> List.map (\match -> match.submatches))
        , test "you may limit the number of matches" <|
            \() ->
                x____replace me____x
                    |> Expect.equal (Regex.find (Regex.AtMost 2) (Regex.regex "[abc]") "axbxc" |> List.map (\match -> match.match))
        , test "replace can modify based on the match" <|
            \() ->
                x____replace me____x
                    |> Expect.equal (Regex.replace Regex.All (Regex.regex "[abc]") (\match -> String.toUpper match.match) "axbxc")
        ]
