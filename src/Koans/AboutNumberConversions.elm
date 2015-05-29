module AboutNumberConversions where

import ElmTest.Assertion exposing (..)
import ElmTest.Test as Test
import TestHelpers exposing (..)

testSuite = Test.suite "About Number Conversions" [
              Test.test "toFloat converts an int to a float" (assertEqual xNum (toFloat 5)),
              Test.test "floor converts an float to a int (rounding down)" (assertEqual xNum (floor 3.6)),
              Test.test "floor converts an float to a int (rounding down)" (assertEqual xNum (floor -3.6)),
              Test.test "ceiling converts an float to a int (rounding up)" (assertEqual xNum (ceiling 3.6)),
              Test.test "ceiling converts an float to a int (rounding up)" (assertEqual xNum (ceiling -3.6)),
              Test.test "round converts an float to a int (rounding to the closest int)" (assertEqual xNum (round 3.6)),
              Test.test "round converts an float to a int (rounding to the closest int)" (assertEqual xNum (round -3.6)),
              Test.test "truncate converts an float to a int (rounding towards 0)" (assertEqual xNum (truncate 3.6)),
              Test.test "truncate converts an float to a int (rounding towards 0)" (assertEqual xNum (truncate -3.6))
            ]
