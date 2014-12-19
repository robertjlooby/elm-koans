module AboutMathematicalOperators where

import ElmTest.Assertion (..)
import ElmTest.Test as Test
import TestHelpers (..)


testSuite = Test.suite "About Mathematical Operators" [
              Test.test "negate gives the negative of a number" (assertEqual -3 (negate xNum)),
              Test.test "abs gives the absolute value of a number" (assertEqual 3 (abs xNum)),
              Test.test "sqrt gives the square root of a Float" (assertEqual 3.0 (sqrt xNum)),
              Test.test "+ adds numbers" (assertEqual 3 (1 + xNum)),
              Test.test "- subtracts numbers" (assertEqual 3 (1 - xNum)),
              Test.test "* multiplies numbers" (assertEqual 6 (4 * xNum)),
              Test.test "/ divides Floats" (assertEqual 2.5 (5 / xNum)),
              Test.test "// divides Ints" (assertEqual 2 (5 // xNum)),
              Test.test "rem gives the remainder after division" (assertEqual 2 (5 `rem` xNum)),
              Test.test "% performs modular arithmetic (which is different)" (assertEqual 4 (-1 `rem` xNum)),
              Test.test "logBase returns the log of the value in the given base" (assertEqual xNum (logBase 2 8)),
              Test.test "clamp returns the value if it is between the given min and max" (assertEqual xNum (clamp 1 10 5)),
              Test.test "clamp returns the min value if the value is below the minimum" (assertEqual xNum (clamp 1 10 -5)),
              Test.test "clamp returns the max value if the value is above the maximum" (assertEqual xNum (clamp 1 10 50))
            ]
