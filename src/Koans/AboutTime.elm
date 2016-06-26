module AboutTime exposing (testSuite)

import Expect
import Test exposing (describe, test)
import TestHelpers exposing (..)
import Time


testSuite =
    describe "About Time"
        [ test "time is just a Float"
            <| \() -> Expect.equal 123.45 xTime
        , test "a constant exists for hour"
            <| \() -> Expect.equal (1 * Time.hour) xTime
        , test "and minute"
            <| \() -> Expect.equal (1 * Time.minute) xTime
        , test "and second"
            <| \() -> Expect.equal (1 * Time.second) xTime
        , test "and millisecond"
            <| \() -> Expect.equal (1 * Time.millisecond) xTime
        , test "helpers exist to convert back to Floats"
            <| \() -> Expect.equal (Time.inSeconds 1000) xNum
        ]
