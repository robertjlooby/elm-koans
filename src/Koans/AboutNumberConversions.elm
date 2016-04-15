module AboutNumberConversions (..) where

import ElmTest exposing (..)
import TestHelpers exposing (..)


testSuite =
  suite
    "About Number Conversions"
    [ test
        "toFloat converts an int to a float"
        (assertEqual (toFloat 5) xNum)
    , test
        "floor converts a float to an int (rounding down)"
        (assertEqual (floor 3.6) xNum)
    , test
        "floor converts a float to an int (rounding down)"
        (assertEqual (floor -3.6) xNum)
    , test
        "ceiling converts a float to an int (rounding up)"
        (assertEqual (ceiling 3.6) xNum)
    , test
        "ceiling converts a float to an int (rounding up)"
        (assertEqual (ceiling -3.6) xNum)
    , test
        "round converts a float to an int (rounding to the closest int)"
        (assertEqual (round 3.6) xNum)
    , test
        "round converts a float to an int (rounding to the closest int)"
        (assertEqual (round -3.6) xNum)
    , test
        "truncate converts a float to an int (rounding towards 0)"
        (assertEqual (truncate 3.6) xNum)
    , test
        "truncate converts a float to an int (rounding towards 0)"
        (assertEqual (truncate -3.6) xNum)
    ]
