module AboutRecords exposing (testSuite)

import Expect
import Test exposing (describe, test)
import TestHelpers exposing (..)


point =
    { x = 1, y = 2 }


testSuite =
    describe "About Records"
        [ test "a record is a set of named fields" <|
            \() ->
                { x = xNum, y = xNum }
                    |> Expect.equal { x = 1, y = 2 }
        , test "you can access a field with dot notation" <|
            \() ->
                xNum
                    |> Expect.equal point.x
        , test "the dot notation may also be used as a function" <|
            \() ->
                xNum
                    |> Expect.equal (.y point)
        , test "fields may be updated" <|
            \() ->
                { x = xNum, y = xNum }
                    |> Expect.equal { point | x = 3 }
        ]
