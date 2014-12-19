module AboutLiterals where

import ElmTest.Assertion (..)
import ElmTest.Test as Test
import TestHelpers (..)


testSuite = Test.suite "About Literals" [
              Test.test "strings are enclosed in double quotes" (assertEqual xString "A string"),
              Test.test "characters are enclosed in single quotes" (assertEqual xChar 'A'),
              Test.test "floats have a decimal" (assertEqual xNum 42.24),
              Test.test "integers do not" (assertEqual xNum 42),
              Test.test "number literals can be integers" (assertEqual 42 42),
              Test.test "number literals can be floats" (assertEqual 42.0 42),
              Test.test "lists are denoted by brackets" (assertEqual xList [1, 2, 3])
            ]
