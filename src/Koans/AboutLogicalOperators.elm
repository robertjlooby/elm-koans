module AboutLogicalOperators exposing (testSuite)

import Expect
import Test exposing (describe, test)
import TestHelpers exposing (..)


testSuite =
    describe "About Logical Operators"
        [ test "not negates a boolean" <|
            \() -> Expect.equal False (not xBool)
        , test "&& is a logical AND" <|
            \() -> Expect.true "Should be True" (True && xBool)
        , test "|| is a logical OR" <|
            \() -> Expect.true "Should be True" (False || xBool)
        , test "xor is a logical XOR" <|
            \() -> Expect.true "Should be True" (False `xor` xBool)
        ]
