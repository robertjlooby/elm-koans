module AboutComparisonOperators exposing (..)

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
        (assert (-1 /= xNum))
    , test
        "< tests for less than"
        (assert (1 < xNum))
    , test
        "<= tests for less than or equal to"
        (assert (1 <= xNum))
    , test
        "> tests for greater than"
        (assert (1 > xNum))
    , test
        ">= tests for greater than or equal to"
        (assert (1 >= xNum))
    , test
        "Floats are comparable"
        (assert (1.5 >= xNum))
    , test
        "Strings are comparable"
        (assert ("A string" == xString))
    , test
        "Chars are comparable"
        (assert ('a' == xChar))
    , test
        "max returns the maximum of two comparables"
        (assertEqual (max 1 2) xNum)
    , test
        "min returns the minimum of two comparables"
        (assertEqual (min 1 2) xNum)
    , test
        "compare returns an Order"
        -- valid Order values are LT, EQ, and GT
        (assertEqual (compare 1 2) xOrd)
    , test
        "functions can be made infix with `backticks`"
        (assertEqual (2 `compare` 1) xOrd)
    ]
