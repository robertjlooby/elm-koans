module AboutAsserts where

import ElmTest.Assertion exposing (..)
import ElmTest.Test as Test
import TestHelpers exposing (..)


testSuite =
  Test.suite
    "About Asserts"
    [ Test.test "assert tests for a true value" (assert xBool)
    , Test.test "assertEqual tests for equality" (assertEqual True xBool)
    , Test.test "assertNotEqual tests for inequality" (assertNotEqual False xBool)
    ]
