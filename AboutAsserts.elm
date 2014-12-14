module AboutAsserts where

import ElmTest.Assertion (..)
import ElmTest.Test as Test
import TestHelpers (..)


testSuite = Test.suite "About Asserts" [
              Test.test "assert tests for a true value" (assert x_x),
              Test.test "assertEqual tests for equality" (assertEqual x_x True),
              Test.test "assertNotEqual tests for inequality" (assertNotEqual x_x False)
            ]
