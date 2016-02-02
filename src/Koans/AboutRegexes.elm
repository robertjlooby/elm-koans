module AboutRegexes (..) where

import ElmTest exposing (..)
import Regex
import String
import TestHelpers exposing (..)


testSuite =
  suite
    "About Regex"
    [ test
        "contains tests for a regex match"
        (assertEqual xBool (Regex.contains (Regex.regex "[abc]+") "abcdefg"))
    , test
        "escape will escape all special characters"
        (assertEqual xString (Regex.escape "[abc]+"))
    , test
        "useful for matching strange strings"
        (assertEqual xBool (Regex.contains (Regex.regex (Regex.escape "[eir]+")) "w[eir]+d"))
    , test
        "it's easy to make your regex case insensitive"
        (assertEqual xBool (Regex.contains (Regex.caseInsensitive (Regex.regex "abc")) "ABC"))
    , test
        "find returns a list of all matches"
        (assertEqual xNum (Regex.find Regex.All (Regex.regex "abc") "abcabcabc" |> List.length))
    , test
        "matches contain the match"
        (assertEqual xList (Regex.find Regex.All (Regex.regex "[abc]") "axbxc" |> List.map (\match -> match.match)))
    , test
        "matches contain the index"
        (assertEqual xList (Regex.find Regex.All (Regex.regex "[abc]") "axbxc" |> List.map (\match -> match.index)))
    , test
        "matches may contain submatches"
        (assertEqual xList (Regex.find Regex.All (Regex.regex "(a)|(b)") "axbxc" |> List.map (\match -> match.submatches)))
    , test
        "you may limit the number of matches"
        (assertEqual xList (Regex.find (Regex.AtMost 2) (Regex.regex "[abc]") "axbxc" |> List.map (\match -> match.match)))
    , test
        "replace can modify based on the match"
        (assertEqual xString (Regex.replace Regex.All (Regex.regex "[abc]") (\match -> String.toUpper match.match) "axbxc"))
    ]
