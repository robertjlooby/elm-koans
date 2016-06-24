module AboutAsserts exposing (testSuite)

import Assert
import Test exposing (describe, test)
import TestHelpers exposing (..)


testSuite =
    describe "About Asserts"
        [ test "assert tests for a true value"
            <| \() -> Assert.true "Should be True" xBool
        , test "assertEqual tests for equality"
            <| \() -> Assert.equal True xBool
        , test "assertNotEqual tests for inequality"
            <| \() -> Assert.notEqual False xBool
        ]
