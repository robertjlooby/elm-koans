module AboutLogicalOperators where

import ElmTest.Assertion exposing (..)
import ElmTest.Test exposing (suite, test)
import TestHelpers exposing (..)


testSuite =
  suite
    "About Logical Operators"
    [ test "not negates a boolean"
        (assertEqual False (not xBool))
    , test "&& is a logical AND"
        (assert (True && xBool))
    , test "|| is a logical OR"
        (assert (False || xBool))
    , test "xor is a logical XOR"
        (assert (False `xor` xBool))
    ]
