module AboutRegexes exposing (..)

import ElmTest exposing (..)
import Regex
import String
import TestHelpers exposing (..)


testSuite =
  suite
    "About Regex"
    [ test
        "contains tests for a regex match"
        (assertEqual (Regex.contains (Regex.regex "[abc]+") "abcdefg") xBool)
    , test
        "escape will escape all special characters"
        (assertEqual (Regex.escape "[abc]+") xString)
    , test
        "useful for matching strange strings"
        (assertEqual (Regex.contains (Regex.regex (Regex.escape "[eir]+")) "w[eir]+d") xBool)
    , test
        "it's easy to make your regex case insensitive"
        (assertEqual (Regex.contains (Regex.caseInsensitive (Regex.regex "abc")) "ABC") xBool)
    , test
        "find returns a list of all matches"
        (assertEqual (Regex.find Regex.All (Regex.regex "abc") "abcabcabc" |> List.length) xNum)
    , test
        "matches contain the match"
        (assertEqual (Regex.find Regex.All (Regex.regex "[abc]") "axbxc" |> List.map (\match -> match.match)) xList)
    , test
        "matches contain the index"
        (assertEqual (Regex.find Regex.All (Regex.regex "[abc]") "axbxc" |> List.map (\match -> match.index)) xList)
    , test
        "matches may contain submatches"
        (assertEqual (Regex.find Regex.All (Regex.regex "(a)|(b)") "axbxc" |> List.map (\match -> match.submatches)) xList)
    , test
        "you may limit the number of matches"
        (assertEqual (Regex.find (Regex.AtMost 2) (Regex.regex "[abc]") "axbxc" |> List.map (\match -> match.match)) xList)
    , test
        "replace can modify based on the match"
        (assertEqual (Regex.replace Regex.All (Regex.regex "[abc]") (\match -> String.toUpper match.match) "axbxc") xString)
    ]
