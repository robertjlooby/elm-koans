module AboutNumberConversions exposing (testSuite)

import Expect
import Test exposing (describe, test)
import TestHelpers exposing (..)


testSuite =
    describe "About Number Conversions"
        [ test "toFloat converts an int to a float" <|
            \() ->
                xNum
                    |> Expect.equal (toFloat 5)
        , test "floor converts a float to an int (rounding down)" <|
            \() ->
                xNum
                    |> Expect.equal (floor 3.6)
        , test "floor converts a float to an int (rounding down)" <|
            \() ->
                xNum
                    |> Expect.equal (floor -3.6)
        , test "ceiling converts a float to an int (rounding up)" <|
            \() ->
                xNum
                    |> Expect.equal (ceiling 3.6)
        , test "ceiling converts a float to an int (rounding up)" <|
            \() ->
                xNum
                    |> Expect.equal (ceiling -3.6)
        , test "round converts a float to an int (rounding to the closest int)" <|
            \() ->
                xNum
                    |> Expect.equal (round 3.6)
        , test "round converts a float to an int (rounding to the closest int)" <|
            \() ->
                xNum
                    |> Expect.equal (round -3.6)
        , test "truncate converts a float to an int (rounding towards 0)" <|
            \() ->
                xNum
                    |> Expect.equal (truncate 3.6)
        , test "truncate converts a float to an int (rounding towards 0)" <|
            \() ->
                xNum
                    |> Expect.equal (truncate -3.6)
        ]
