module AboutAsserts exposing (testSuite)

import Expect
import Test exposing (describe, test)
import TestHelpers exposing (..)


testSuite =
    describe "About Expects"
        [ test "assert tests for a true value"
            <| \() -> Expect.true "Should be True" xBool
        , test "assertEqual tests for equality"
            <| \() -> Expect.equal True xBool
        , test "assertNotEqual tests for inequality"
            <| \() -> Expect.notEqual False xBool
        ]
