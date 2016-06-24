module AboutLogicalOperators exposing (testSuite)

import Assert
import Test exposing (describe, test)
import TestHelpers exposing (..)


testSuite =
    describe "About Logical Operators"
        [ test "not negates a boolean"
            <| \() -> Assert.equal False (not xBool)
        , test "&& is a logical AND"
            <| \() -> Assert.true "Should be True" (True && xBool)
        , test "|| is a logical OR"
            <| \() -> Assert.true "Should be True" (False || xBool)
        , test "xor is a logical XOR"
            <| \() -> Assert.true "Should be True" (False `xor` xBool)
        ]
