module AboutAsserts where

import ElmTest.Assertion (..)
import ElmTest.Test as Test
import TestHelpers (..)


testSuite = Test.suite "About Asserts" [
              Test.test "assert tests for a true value" (assert xBool),
              Test.test "assertEqual tests for equality" (assertEqual xBool True),
              Test.test "assertNotEqual tests for inequality" (assertNotEqual xBool False)
            ]
