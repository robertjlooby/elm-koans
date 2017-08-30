module Koans06AboutNumberConversions exposing (testSuite)

import Expect
import Utils.Test exposing (describe, test)
import Utils.Blank exposing (..)


testSuite =
    describe "About Number Conversions"
        [ test "toFloat converts an int to a float" <|
            \() ->
                x____replace me____x
                    |> Expect.equal (toFloat 5)
        , test "floor converts a float to an int (rounding down)" <|
            \() ->
                x____replace me____x
                    |> Expect.equal (floor 3.6)
        , test "floor converts a float to an int (rounding down)" <|
            \() ->
                x____replace me____x
                    |> Expect.equal (floor -3.6)
        , test "ceiling converts a float to an int (rounding up)" <|
            \() ->
                x____replace me____x
                    |> Expect.equal (ceiling 3.6)
        , test "ceiling converts a float to an int (rounding up)" <|
            \() ->
                x____replace me____x
                    |> Expect.equal (ceiling -3.6)
        , test "round converts a float to an int (rounding to the closest int)" <|
            \() ->
                x____replace me____x
                    |> Expect.equal (round 3.6)
        , test "round converts a float to an int (rounding to the closest int)" <|
            \() ->
                x____replace me____x
                    |> Expect.equal (round -3.6)
        , test "truncate converts a float to an int (rounding towards 0)" <|
            \() ->
                x____replace me____x
                    |> Expect.equal (truncate 3.6)
        , test "truncate converts a float to an int (rounding towards 0)" <|
            \() ->
                x____replace me____x
                    |> Expect.equal (truncate -3.6)
        ]
