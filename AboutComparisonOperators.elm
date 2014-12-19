module AboutComparisonOperators where

import ElmTest.Assertion (..)
import ElmTest.Test as Test
import TestHelpers (..)


testSuite = Test.suite "About Comparison Operators" [
              Test.test "== tests for equality" (assert (1 == xNum)),
              Test.test "/= tests for inequality" (assert (1 /= 1)),
              Test.test "< tests for less than" (assert (1 < xNum)),
              Test.test "<= tests for less than or equal to" (assert (1 <= xNum)),
              Test.test "> tests for greater than" (assert (xNum > 1)),
              Test.test ">= tests for greater than or equal to" (assert (xNum >= 1)),
              Test.test "Floats are comparable" (assert (xNum >= 1.5)),
              Test.test "Strings are comparable" (assert ("A string" == xString)),
              Test.test "Chars are comparable" (assert ('a' == xChar)),
              Test.test "max returns the maximum of two comparables" (assertEqual xNum (max 1 2)),
              Test.test "min returns the minimum of two comparables" (assertEqual xNum (min 1 2)),
              Test.test "compare returns an Order" (assertEqual EQ (compare 1 2)),
              Test.test "functions can be made infix with ``" (assertEqual EQ (2 `compare` 1))
            ]
