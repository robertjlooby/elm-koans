module Koans05AboutMathematicalOperators exposing (testSuite)

import Expect
import Utils.Test exposing (describe, test)
import Utils.Blank exposing (..)


testSuite =
    describe "About Mathematical Operators"
        [ test "negate gives the negative of a number" <|
            \() ->
                negate (x____replace me____x)
                    |> Expect.equal -3
        , test "abs gives the absolute value of a number" <|
            \() ->
                abs (x____replace me____x)
                    |> Expect.equal 3
        , test "sqrt gives the square root of a Float" <|
            \() ->
                sqrt (x____replace me____x)
                    |> Expect.equal 3.0
        , test "+ adds numbers" <|
            \() ->
                1 + x____replace me____x
                    |> Expect.equal 3
        , test "- subtracts numbers" <|
            \() ->
                7 - x____replace me____x
                    |> Expect.equal 3
        , test "* multiplies numbers" <|
            \() ->
                4 * x____replace me____x
                    |> Expect.equal 6
        , test "/ divides Floats" <|
            \() ->
                5 / x____replace me____x
                    |> Expect.equal 2.5
        , test "// divides Ints" <|
            \() ->
                5 // x____replace me____x
                    |> Expect.equal 2
        , test "rem gives the remainder after division" <|
            \() ->
                5 |> rem (x____replace me____x)
                    |> Expect.equal 2
        , test "% performs modular arithmetic (which is different)" <|
            \() ->
                x____replace me____x
                    |> Expect.equal (-1 % 5)
        , test "logBase returns the log of the value in the given base" <|
            \() ->
                x____replace me____x
                    |> Expect.equal (logBase 2 8)
        , test "clamp returns the value if it is between the given min and max" <|
            \() ->
                x____replace me____x
                    |> Expect.equal (clamp 1 10 5)
        , test "clamp returns the min value if the value is below the minimum" <|
            \() ->
                x____replace me____x
                    |> Expect.equal (clamp 1 10 -5)
        , test "clamp returns the max value if the value is above the maximum" <|
            \() ->
                x____replace me____x
                    |> Expect.equal (clamp 1 10 50)
        ]
