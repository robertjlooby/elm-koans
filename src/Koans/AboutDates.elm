module AboutDates exposing (testSuite)

import Expect
import Date
import Test exposing (describe, test)
import TestHelpers exposing (..)


-- dates can be created from a Time


ourDate =
    Date.fromTime 0



-- parsing a date could fail, and so returns a Result


parsedDate =
    Date.fromString "1/1/2000 11:30:45 AM"


getField : (Date.Date -> a) -> Result String Date.Date -> String
getField fn date =
    case date of
        Ok value ->
            toString (fn value)

        Err msg ->
            msg


testSuite =
    describe "About Dates"
        [ test "year gets the year" <|
            \() -> Expect.equal (Date.year ourDate) xNum
        , test "month gets the month"
          -- a type!
          <|
            \() -> Expect.equal (Date.month ourDate) xMonth
        , test "day gets the day" <|
            \() -> Expect.equal (Date.day ourDate) xNum
        , test "dayOfWeek gets the day of the week"
          -- another type
          <|
            \() -> Expect.equal (Date.dayOfWeek ourDate) xDay
        , test "hour gets the hour" <|
            \() -> Expect.equal (getField Date.hour parsedDate) xString
        , test "minute gets the minute" <|
            \() -> Expect.equal (getField Date.minute parsedDate) xString
        , test "second gets the second" <|
            \() -> Expect.equal (getField Date.second parsedDate) xString
        ]
