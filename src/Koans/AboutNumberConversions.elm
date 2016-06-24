module AboutNumberConversions exposing (testSuite)

import Assert
import Test exposing (describe, test)
import TestHelpers exposing (..)


testSuite =
    describe "About Number Conversions"
        [ test "toFloat converts an int to a float"
            <| \() -> Assert.equal (toFloat 5) xNum
        , test "floor converts a float to an int (rounding down)"
            <| \() -> Assert.equal (floor 3.6) xNum
        , test "floor converts a float to an int (rounding down)"
            <| \() -> Assert.equal (floor -3.6) xNum
        , test "ceiling converts a float to an int (rounding up)"
            <| \() -> Assert.equal (ceiling 3.6) xNum
        , test "ceiling converts a float to an int (rounding up)"
            <| \() -> Assert.equal (ceiling -3.6) xNum
        , test "round converts a float to an int (rounding to the closest int)"
            <| \() -> Assert.equal (round 3.6) xNum
        , test "round converts a float to an int (rounding to the closest int)"
            <| \() -> Assert.equal (round -3.6) xNum
        , test "truncate converts a float to an int (rounding towards 0)"
            <| \() -> Assert.equal (truncate 3.6) xNum
        , test "truncate converts a float to an int (rounding towards 0)"
            <| \() -> Assert.equal (truncate -3.6) xNum
        ]
