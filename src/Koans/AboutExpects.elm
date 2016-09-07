module AboutExpects exposing (testSuite)

import Expect
import Test exposing (describe, test)
import TestHelpers exposing (..)


testSuite =
    describe "About Expects"
        [ test "Expect.true tests for a true value" <|
            \() -> Expect.true "Should be True" xBool
        , test "Expect.equal tests for equality" <|
            \() -> Expect.equal True xBool
        , test "Expect.notEqual tests for inequality" <|
            \() -> Expect.notEqual False xBool
        ]
