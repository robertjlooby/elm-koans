module AboutLogicalOperators where

import ElmTest.Assertion (..)
import ElmTest.Test as Test
import TestHelpers (..)

testSuite = Test.suite "About Logical Operators" [
              Test.test "not negates a boolean" (assertEqual False (not xBool)),
              Test.test "&& is a logical AND" (assert (True && xBool)),
              Test.test "|| is a logical OR" (assert (False || xBool)),
              Test.test "xor is a logical XOR" (assert (False `xor` xBool)),
              Test.test "otherwise is an alias for True" (assertEqual otherwise xBool)
            ]
