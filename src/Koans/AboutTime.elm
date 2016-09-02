module AboutTime exposing (testSuite)

import Expect
import Test exposing (describe, test)
import TestHelpers exposing (..)
import Time


testSuite =
    describe "About Time"
        [ test "time is just a Float" <|
            \() ->
                xTime
                    |> Expect.equal 123.45
        , test "a constant exists for hour" <|
            \() ->
                xTime
                    |> Expect.equal (1 * Time.hour)
        , test "and minute" <|
            \() ->
                xTime
                    |> Expect.equal (1 * Time.minute)
        , test "and second" <|
            \() ->
                xTime
                    |> Expect.equal (1 * Time.second)
        , test "and millisecond" <|
            \() ->
                xTime
                    |> Expect.equal (1 * Time.millisecond)
        , test "helpers exist to convert back to Floats" <|
            \() ->
                xNum
                    |> Expect.equal (Time.inSeconds 1000)
        ]
