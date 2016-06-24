module AboutMathematicalOperators exposing (testSuite)

import Assert
import Test exposing (describe, test)
import TestHelpers exposing (..)


testSuite =
    describe "About Mathematical Operators"
        [ test "negate gives the negative of a number"
            <| \() -> Assert.equal -3 (negate xNum)
        , test "abs gives the absolute value of a number"
            <| \() -> Assert.equal 3 (abs xNum)
        , test "sqrt gives the square root of a Float"
            <| \() -> Assert.equal 3.0 (sqrt xNum)
        , test "+ adds numbers"
            <| \() -> Assert.equal 3 (1 + xNum)
        , test "- subtracts numbers"
            <| \() -> Assert.equal 3 (7 - xNum)
        , test "* multiplies numbers"
            <| \() -> Assert.equal 6 (4 * xNum)
        , test "/ divides Floats"
            <| \() -> Assert.equal 2.5 (5 / xNum)
        , test "// divides Ints"
            <| \() -> Assert.equal 2 (5 // xNum)
        , test "rem gives the remainder after division"
            <| \() -> Assert.equal 2 (5 `rem` xNum)
        , test "% performs modular arithmetic (which is different)"
            <| \() -> Assert.equal (-1 % 5) xNum
        , test "logBase returns the log of the value in the given base"
            <| \() -> Assert.equal (logBase 2 8) xNum
        , test "clamp returns the value if it is between the given min and max"
            <| \() -> Assert.equal (clamp 1 10 5) xNum
        , test "clamp returns the min value if the value is below the minimum"
            <| \() -> Assert.equal (clamp 1 10 -5) xNum
        , test "clamp returns the max value if the value is above the maximum"
            <| \() -> Assert.equal (clamp 1 10 50) xNum
        ]
