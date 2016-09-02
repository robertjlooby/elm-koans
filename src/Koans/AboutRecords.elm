module AboutRecords exposing (testSuite)

import Expect
import Test exposing (describe, test)
import TestHelpers exposing (..)


point =
    { x = 1, y = 2 }


testSuite =
    describe "About Records"
        [ test "a record is a set of named fields" <|
            \() -> Expect.equal { x = 1, y = 2 } { x = xNum, y = xNum }
        , test "you can access a field with dot notation" <|
            \() -> Expect.equal point.x xNum
        , test "the dot notation may also be used as a function" <|
            \() -> Expect.equal (.y point) xNum
        , test "fields may be updated" <|
            \() -> Expect.equal { point | x = 3 } { x = xNum, y = xNum }
        ]
