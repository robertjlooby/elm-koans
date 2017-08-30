module Koans03AboutComparisonOperators exposing (testSuite)

import Expect
import Utils.Test exposing (describe, test)
import Utils.Blank exposing (..)


testSuite =
    describe "About Comparison Operators"
        [ test "== tests for equality" <|
            \() ->
                1 == x____replace me____x
                    |> Expect.true "Should be True"
        , test "/= tests for inequality" <|
            \() ->
                -1 /= x____replace me____x
                    |> Expect.true "Should be True"
        , test "< tests for less than" <|
            \() ->
                1 < x____replace me____x
                    |> Expect.true "Should be True"
        , test "<= tests for less than or equal to" <|
            \() ->
                1 <= x____replace me____x
                    |> Expect.true "Should be True"
        , test "> tests for greater than" <|
            \() ->
                1 > x____replace me____x
                    |> Expect.true "Should be True"
        , test ">= tests for greater than or equal to" <|
            \() ->
                1 >= x____replace me____x
                    |> Expect.true "Should be True"
        , test "Floats are comparable" <|
            \() ->
                1.5 >= x____replace me____x
                    |> Expect.true "Should be True"
        , test "Strings are comparable" <|
            \() ->
                "A string" == x____replace me____x
                    |> Expect.true "Should be True"
        , test "Chars are comparable" <|
            \() ->
                'a' == x____replace me____x
                    |> Expect.true "Should be True"
        , test "max returns the maximum of two comparables" <|
            \() ->
                x____replace me____x
                    |> Expect.equal (max 1 2)
        , test "min returns the minimum of two comparables" <|
            \() ->
                x____replace me____x
                    |> Expect.equal (min 1 2)
        , test "compare returns an Order" <|
            -- valid Order values are LT, EQ, and GT
            \() ->
                x____replace me____x
                    |> Expect.equal (compare 1 2)
        ]
