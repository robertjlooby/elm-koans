module AboutRegexes where

import ElmTest.Assertion (..)
import ElmTest.Test as Test
import TestHelpers (..)
import List
import String
import Regex

testSuite = Test.suite "About Regex" [
              Test.test "contains tests for a regex match" (assertEqual xBool (Regex.contains (Regex.regex "[abc]+") "abcdefg")),
              Test.test "escape will escape all special characters" (assertEqual xString (Regex.escape "[abc]+")),
              Test.test "useful for matching strange strings" (assertEqual xBool (Regex.contains (Regex.regex (Regex.escape "[eir]+")) "w[eir]+d")),
              Test.test "it's easy to make your regex case insensitive" (assertEqual xBool (Regex.contains (Regex.caseInsensitive (Regex.regex "abc")) "ABC")),
              Test.test "find returns a list of all matches" (assertEqual xNum (Regex.find Regex.All (Regex.regex "abc") "abcabcabc" |> List.length)),
              Test.test "matches contain the match" (assertEqual xList (Regex.find Regex.All (Regex.regex "[abc]") "axbxc" |> List.map (\match -> match.match))),
              Test.test "matches contain the index" (assertEqual xList (Regex.find Regex.All (Regex.regex "[abc]") "axbxc" |> List.map (\match -> match.index))),
              Test.test "matches may contain submatches" (assertEqual xList (Regex.find Regex.All (Regex.regex "(a)|(b)") "axbxc" |> List.map (\match -> match.submatches))),
              Test.test "you may limit the number of matches" (assertEqual xList (Regex.find (Regex.AtMost 2) (Regex.regex "[abc]") "axbxc" |> List.map (\match -> match.match))),
              Test.test "replace can modify based on the match" (assertEqual xString (Regex.replace Regex.All (Regex.regex "[abc]") (\match -> String.toUpper match.match) "axbxc"))
            ]

