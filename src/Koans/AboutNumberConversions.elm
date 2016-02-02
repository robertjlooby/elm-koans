module AboutNumberConversions (..) where

import ElmTest exposing (..)
import TestHelpers exposing (..)


testSuite =
  suite
    "About Number Conversions"
    [ test
        "toFloat converts an int to a float"
        (assertEqual xNum (toFloat 5))
    , test
        "floor converts a float to an int (rounding down)"
        (assertEqual xNum (floor 3.6))
    , test
        "floor converts a float to an int (rounding down)"
        (assertEqual xNum (floor -3.6))
    , test
        "ceiling converts a float to an int (rounding up)"
        (assertEqual xNum (ceiling 3.6))
    , test
        "ceiling converts a float to an int (rounding up)"
        (assertEqual xNum (ceiling -3.6))
    , test
        "round converts a float to an int (rounding to the closest int)"
        (assertEqual xNum (round 3.6))
    , test
        "round converts a float to an int (rounding to the closest int)"
        (assertEqual xNum (round -3.6))
    , test
        "truncate converts a float to an int (rounding towards 0)"
        (assertEqual xNum (truncate 3.6))
    , test
        "truncate converts a float to an int (rounding towards 0)"
        (assertEqual xNum (truncate -3.6))
    ]
