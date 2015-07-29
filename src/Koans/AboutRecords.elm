module AboutRecords where

import ElmTest.Assertion exposing (..)
import ElmTest.Test exposing (suite, test)
import TestHelpers exposing (..)


point = { x = 1, y = 2 }


poly = { append a = a ++ a }


testSuite =
  suite
    "About Records"
    [ test "a record is a set of named fields"
        (assertEqual { x = xNum, y = xNum } { x = 1, y = 2 })
    , test "you can access a field with dot notation"
        (assertEqual xNum point.x)
    , test "the dot notation may also be used as a function"
        (assertEqual xNum (.y { x = 1, y = 2 }))
    , test "fields may be added to a record"
        (assertEqual xRecord { point | z = 3 })
    , test "fields may be removed from a record"
        (assertEqual point { xRecord - z })
    , test "fields may be updated in one action"
        (assertEqual point { point | x <- 3 })
    , test "fields may also be 'polymorphic'"
        (assertEqual xString (poly.append "hi"))
    , test "polymorphic fields are functions"
        (assertEqual xList (poly.append ["hi"]))
    ]
