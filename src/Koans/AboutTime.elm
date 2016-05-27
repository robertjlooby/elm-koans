module AboutTime exposing (..)

import ElmTest exposing (..)
import TestHelpers exposing (..)
import Time


testSuite =
  suite
    "About Time"
    [ test
        "time is just a Float"
        (assertEqual 123.45 xTime)
    , test
        "a constant exists for hour"
        (assertEqual (1 * Time.hour) xTime)
    , test
        "and minute"
        (assertEqual (1 * Time.minute) xTime)
    , test
        "and second"
        (assertEqual (1 * Time.second) xTime)
    , test
        "and millisecond"
        (assertEqual (1 * Time.millisecond) xTime)
    , test
        "helpers exist to convert back to Floats"
        (assertEqual (Time.inSeconds 1000) xNum)
    ]
