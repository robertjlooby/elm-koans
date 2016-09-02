module AboutLogicalOperators exposing (testSuite)

import Expect
import Test exposing (describe, test)
import TestHelpers exposing (..)


testSuite =
    describe "About Logical Operators"
        [ test "not negates a boolean" <|
            \() ->
                (not xBool)
                    |> Expect.equal False
        , test "&& is a logical AND" <|
            \() ->
                (True && xBool)
                    |> Expect.true "Should be True"
        , test "|| is a logical OR" <|
            \() ->
                (False || xBool)
                    |> Expect.true "Should be True"
        , test "xor is a logical XOR" <|
            \() ->
                (False `xor` xBool)
                    |> Expect.true "Should be True"
        ]
