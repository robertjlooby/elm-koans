module AboutTime where

import ElmTest.Assertion exposing (..)
import ElmTest.Test as Test
import TestHelpers exposing (..)
import Time


testSuite =
  Test.suite
    "About Time"
    [ Test.test "time is just a Float" (assertEqual xTime 123.45)
    , Test.test "a constant exists for hour" (assertEqual xTime (1 * Time.hour))
    , Test.test "and minute" (assertEqual xTime (1 * Time.minute))
    , Test.test "and second" (assertEqual xTime (1 * Time.second))
    , Test.test "and millisecond" (assertEqual xTime (1 * Time.millisecond))
    , Test.test "helpers exist to convert back to Floats" (assertEqual xNum (Time.inSeconds 1000))
    ]
