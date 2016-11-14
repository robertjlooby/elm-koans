module AboutMathematicalOperators exposing (testSuite)

import Expect
import Test exposing (describe, test)
import TestHelpers exposing (..)


testSuite =
    describe "About Mathematical Operators"
        [ test "negate gives the negative of a number" <|
            \() ->
                (negate xNum)
                    |> Expect.equal -3
        , test "abs gives the absolute value of a number" <|
            \() ->
                (abs xNum)
                    |> Expect.equal 3
        , test "sqrt gives the square root of a Float" <|
            \() ->
                (sqrt xNum)
                    |> Expect.equal 3.0
        , test "+ adds numbers" <|
            \() ->
                (1 + xNum)
                    |> Expect.equal 3
        , test "- subtracts numbers" <|
            \() ->
                (7 - xNum)
                    |> Expect.equal 3
        , test "* multiplies numbers" <|
            \() ->
                (4 * xNum)
                    |> Expect.equal 6
        , test "/ divides Floats" <|
            \() ->
                (5 / xNum)
                    |> Expect.equal 2.5
        , test "// divides Ints" <|
            \() ->
                (5 // xNum)
                    |> Expect.equal 2
        , test "rem gives the remainder after division" <|
            \() ->
                (5 `rem` xNum)
                    |> Expect.equal 2
        , test "% performs modular arithmetic (which is different)" <|
            \() ->
                xNum
                    |> Expect.equal (-1 % 5)
        , test "logBase returns the log of the value in the given base" <|
            \() ->
                xNum
                    |> Expect.equal (logBase 2 8)
        , test "clamp returns the value if it is between the given min and max" <|
            \() ->
                xNum
                    |> Expect.equal (clamp 1 10 5)
        , test "clamp returns the min value if the value is below the minimum" <|
            \() ->
                xNum
                    |> Expect.equal (clamp 1 10 -5)
        , test "clamp returns the max value if the value is above the maximum" <|
            \() ->
                xNum
                    |> Expect.equal (clamp 1 10 50)
        ]
