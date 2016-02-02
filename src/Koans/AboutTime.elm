module AboutTime (..) where

import ElmTest exposing (..)
import TestHelpers exposing (..)
import Time


testSuite =
  suite
    "About Time"
    [ test
        "time is just a Float"
        (assertEqual xTime 123.45)
    , test
        "a constant exists for hour"
        (assertEqual xTime (1 * Time.hour))
    , test
        "and minute"
        (assertEqual xTime (1 * Time.minute))
    , test
        "and second"
        (assertEqual xTime (1 * Time.second))
    , test
        "and millisecond"
        (assertEqual xTime (1 * Time.millisecond))
    , test
        "helpers exist to convert back to Floats"
        (assertEqual xNum (Time.inSeconds 1000))
    ]
