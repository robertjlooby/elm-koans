module AboutRegexes exposing (testSuite)

import Assert
import Regex
import String
import Test exposing (describe, test)
import TestHelpers exposing (..)


testSuite =
    describe "About Regex"
        [ test "contains tests for a regex match"
            <| \() -> Assert.equal (Regex.contains (Regex.regex "[abc]+") "abcdefg") xBool
        , test "escape will escape all special characters"
            <| \() -> Assert.equal (Regex.escape "[abc]+") xString
        , test "useful for matching strange strings"
            <| \() -> Assert.equal (Regex.contains (Regex.regex (Regex.escape "[eir]+")) "w[eir]+d") xBool
        , test "it's easy to make your regex case insensitive"
            <| \() -> Assert.equal (Regex.contains (Regex.caseInsensitive (Regex.regex "abc")) "ABC") xBool
        , test "find returns a list of all matches"
            <| \() -> Assert.equal (Regex.find Regex.All (Regex.regex "abc") "abcabcabc" |> List.length) xNum
        , test "matches contain the match"
            <| \() -> Assert.equal (Regex.find Regex.All (Regex.regex "[abc]") "axbxc" |> List.map (\match -> match.match)) xList
        , test "matches contain the index"
            <| \() -> Assert.equal (Regex.find Regex.All (Regex.regex "[abc]") "axbxc" |> List.map (\match -> match.index)) xList
        , test "matches may contain submatches"
            <| \() -> Assert.equal (Regex.find Regex.All (Regex.regex "(a)|(b)") "axbxc" |> List.map (\match -> match.submatches)) xList
        , test "you may limit the number of matches"
            <| \() -> Assert.equal (Regex.find (Regex.AtMost 2) (Regex.regex "[abc]") "axbxc" |> List.map (\match -> match.match)) xList
        , test "replace can modify based on the match"
            <| \() -> Assert.equal (Regex.replace Regex.All (Regex.regex "[abc]") (\match -> String.toUpper match.match) "axbxc") xString
        ]
