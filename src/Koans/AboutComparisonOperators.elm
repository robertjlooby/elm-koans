module AboutComparisonOperators exposing (testSuite)

import Expect
import Test exposing (describe, test)
import TestHelpers exposing (..)


testSuite =
    describe "About Comparison Operators"
        [ test "== tests for equality" <|
            \() ->
                (1 == xNum)
                    |> Expect.true "Should be True"
        , test "/= tests for inequality" <|
            \() ->
                (-1 /= xNum)
                    |> Expect.true "Should be True"
        , test "< tests for less than" <|
            \() ->
                (1 < xNum)
                    |> Expect.true "Should be True"
        , test "<= tests for less than or equal to" <|
            \() ->
                (1 <= xNum)
                    |> Expect.true "Should be True"
        , test "> tests for greater than" <|
            \() ->
                (1 > xNum)
                    |> Expect.true "Should be True"
        , test ">= tests for greater than or equal to" <|
            \() ->
                (1 >= xNum)
                    |> Expect.true "Should be True"
        , test "Floats are comparable" <|
            \() ->
                (1.5 >= xNum)
                    |> Expect.true "Should be True"
        , test "Strings are comparable" <|
            \() ->
                ("A string" == xString)
                    |> Expect.true "Should be True"
        , test "Chars are comparable" <|
            \() ->
                ('a' == xChar)
                    |> Expect.true "Should be True"
        , test "max returns the maximum of two comparables" <|
            \() ->
                xNum
                    |> Expect.equal (max 1 2)
        , test "min returns the minimum of two comparables" <|
            \() ->
                xNum
                    |> Expect.equal (min 1 2)
        , test "compare returns an Order" <|
            -- valid Order values are LT, EQ, and GT
            \() ->
                xOrd
                    |> Expect.equal (compare 1 2)
        , test "functions can be made infix with `backticks`" <|
            \() ->
                xOrd
                    |> Expect.equal (2 `compare` 1)
        ]
