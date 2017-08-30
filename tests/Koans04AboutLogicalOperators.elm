module Koans04AboutLogicalOperators exposing (testSuite)

import Expect
import Utils.Test exposing (describe, test)
import Utils.Blank exposing (..)


testSuite =
    describe "About Logical Operators"
        [ test "not negates a boolean" <|
            \() ->
                not (x____replace me____x)
                    |> Expect.equal False
        , test "&& is a logical AND" <|
            \() ->
                True && x____replace me____x
                    |> Expect.true "Should be True"
        , test "|| is a logical OR" <|
            \() ->
                False || x____replace me____x
                    |> Expect.true "Should be True"
        , test "xor is a logical XOR" <|
            \() ->
                False |> xor (x____replace me____x)
                    |> Expect.true "Should be True"
        ]
