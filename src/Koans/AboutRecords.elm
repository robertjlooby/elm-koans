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
        (assertEqual { x = 1, y = 2 } { x = xNum, y = xNum })
    , test
        "you can access a field with dot notation"
        (assertEqual point.x xNum)
    , test
        "the dot notation may also be used as a function"
        (assertEqual (.y point) xNum)
    , test
        "fields may be updated"
        (assertEqual { point | x = 3 } { x = xNum, y = xNum })
    ]
