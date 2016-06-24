module AboutTime exposing (testSuite)

import Assert
import Test exposing (describe, test)
import TestHelpers exposing (..)
import Time


testSuite =
    describe "About Time"
        [ test "time is just a Float"
            <| \() -> Assert.equal 123.45 xTime
        , test "a constant exists for hour"
            <| \() -> Assert.equal (1 * Time.hour) xTime
        , test "and minute"
            <| \() -> Assert.equal (1 * Time.minute) xTime
        , test "and second"
            <| \() -> Assert.equal (1 * Time.second) xTime
        , test "and millisecond"
            <| \() -> Assert.equal (1 * Time.millisecond) xTime
        , test "helpers exist to convert back to Floats"
            <| \() -> Assert.equal (Time.inSeconds 1000) xNum
        ]
