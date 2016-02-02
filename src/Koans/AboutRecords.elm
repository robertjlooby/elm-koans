module AboutRecords (..) where

import ElmTest exposing (..)
import TestHelpers exposing (..)


point =
  { x = 1, y = 2 }


testSuite =
  suite
    "About Records"
    [ test
        "a record is a set of named fields"
        (assertEqual { x = xNum, y = xNum } { x = 1, y = 2 })
    , test
        "you can access a field with dot notation"
        (assertEqual xNum point.x)
    , test
        "the dot notation may also be used as a function"
        (assertEqual xNum (.y { x = 1, y = 2 }))
    , test
        "fields may be updated"
        (assertEqual point { point | x = 3 })
    ]
