module Koans16AboutTime exposing (testSuite)

import Expect
import Time
import Utils.Blank exposing (..)
import Utils.Test exposing (describe, test)



-- epoch is 1970-01-01 00:00:00


epoch =
    Time.millisToPosix 0


testSuite =
    describe "About Time"
        [ test "you can get millis for a posix time" <|
            \() ->
                x____replace me____x
                    |> Expect.equal (Time.posixToMillis epoch)
        , test "the year of a posix is human parsable" <|
            \() ->
                x____replace me____x
                    |> Expect.equal (Time.toYear Time.utc epoch)
        , test "the month of a posix is human parsable" <|
            \() ->
                x____replace me____x
                    |> Expect.equal (Time.toMonth Time.utc epoch)
        , test "the day of a posix is human parsable" <|
            \() ->
                x____replace me____x
                    |> Expect.equal (Time.toDay Time.utc epoch)
        , test "the weekday of a posix is human parsable" <|
            \() ->
                x____replace me____x
                    |> Expect.equal (Time.toWeekday Time.utc epoch)
        , test "the hour of a posix is human parsable" <|
            \() ->
                x____replace me____x
                    |> Expect.equal (Time.toHour Time.utc epoch)
        , test "the minute of a posix is human parsable" <|
            \() ->
                x____replace me____x
                    |> Expect.equal (Time.toMinute Time.utc epoch)
        , test "the second of a posix is human parsable" <|
            \() ->
                x____replace me____x
                    |> Expect.equal (Time.toSecond Time.utc epoch)
        , test "the millis of a posix is human parsable" <|
            \() ->
                x____replace me____x
                    |> Expect.equal (Time.toMillis Time.utc epoch)
        ]
