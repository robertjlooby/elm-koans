module Koans19AboutRecords exposing (testSuite)

import Expect
import Utils.Test exposing (describe, test)
import Utils.Blank exposing (..)


point =
    { x = 1, y = 2 }


testSuite =
    describe "About Records"
        [ test "a record is a set of named fields" <|
            \() ->
                { x = x____replace me____x, y = x____replace me____x }
                    |> Expect.equal { x = 1, y = 2 }
        , test "you can access a field with dot notation" <|
            \() ->
                x____replace me____x
                    |> Expect.equal point.x
        , test "the dot notation may also be used as a function" <|
            \() ->
                x____replace me____x
                    |> Expect.equal (.y point)
        , test "fields may be updated" <|
            \() ->
                { x = x____replace me____x, y = x____replace me____x }
                    |> Expect.equal { point | x = 3 }
        ]
