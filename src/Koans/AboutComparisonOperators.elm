module AboutComparisonOperators exposing (testSuite)

import Assert
import Test exposing (describe, test)
import TestHelpers exposing (..)


testSuite =
    describe "About Comparison Operators"
        [ test "== tests for equality"
            <| \() -> Assert.true "Should be True" (1 == xNum)
        , test "/= tests for inequality"
            <| \() -> Assert.true "Should be True" (-1 /= xNum)
        , test "< tests for less than"
            <| \() -> Assert.true "Should be True" (1 < xNum)
        , test "<= tests for less than or equal to"
            <| \() -> Assert.true "Should be True" (1 <= xNum)
        , test "> tests for greater than"
            <| \() -> Assert.true "Should be True" (1 > xNum)
        , test ">= tests for greater than or equal to"
            <| \() -> Assert.true "Should be True" (1 >= xNum)
        , test "Floats are comparable"
            <| \() -> Assert.true "Should be True" (1.5 >= xNum)
        , test "Strings are comparable"
            <| \() -> Assert.true "Should be True" ("A string" == xString)
        , test "Chars are comparable"
            <| \() -> Assert.true "Should be True" ('a' == xChar)
        , test "max returns the maximum of two comparables"
            <| \() -> Assert.equal (max 1 2) xNum
        , test "min returns the minimum of two comparables"
            <| \() -> Assert.equal (min 1 2) xNum
        , test "compare returns an Order"
            -- valid Order values are LT, EQ, and GT
            <|
                \() -> Assert.equal (compare 1 2) xOrd
        , test "functions can be made infix with `backticks`"
            <| \() -> Assert.equal (2 `compare` 1) xOrd
        ]
