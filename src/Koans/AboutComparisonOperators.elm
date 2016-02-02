module AboutComparisonOperators (..) where

import ElmTest exposing (..)
import TestHelpers exposing (..)


testSuite =
  suite
    "About Comparison Operators"
    [ test
        "== tests for equality"
        (assert (1 == xNum))
    , test
        "/= tests for inequality"
        (assert (1 /= 1))
    , test
        "< tests for less than"
        (assert (1 < xNum))
    , test
        "<= tests for less than or equal to"
        (assert (1 <= xNum))
    , test
        "> tests for greater than"
        (assert (xNum > 1))
    , test
        ">= tests for greater than or equal to"
        (assert (xNum >= 1))
    , test
        "Floats are comparable"
        (assert (xNum >= 1.5))
    , test
        "Strings are comparable"
        (assert ("A string" == xString))
    , test
        "Chars are comparable"
        (assert ('a' == xChar))
    , test
        "max returns the maximum of two comparables"
        (assertEqual xNum (max 1 2))
    , test
        "min returns the minimum of two comparables"
        (assertEqual xNum (min 1 2))
    , test
        "compare returns an Order"
        (assertEqual EQ (compare 1 2))
    , test
        "functions can be made infix with ``"
        (assertEqual EQ (2 `compare` 1))
    ]
