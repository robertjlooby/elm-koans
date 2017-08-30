module Koans16AboutTime exposing (testSuite)

import Expect
import Utils.Test exposing (describe, test)
import Utils.Blank exposing (..)
import Time


testSuite =
    describe "About Time"
        [ test "time is just a Float" <|
            \() ->
                x____replace me____x
                    |> Expect.equal 123.45
        , test "a constant exists for hour" <|
            \() ->
                x____replace me____x
                    |> Expect.equal (1 * Time.hour)
        , test "and minute" <|
            \() ->
                x____replace me____x
                    |> Expect.equal (1 * Time.minute)
        , test "and second" <|
            \() ->
                x____replace me____x
                    |> Expect.equal (1 * Time.second)
        , test "and millisecond" <|
            \() ->
                x____replace me____x
                    |> Expect.equal (1 * Time.millisecond)
        , test "helpers exist to convert back to Floats" <|
            \() ->
                x____replace me____x
                    |> Expect.equal (Time.inSeconds 1000)
        ]
