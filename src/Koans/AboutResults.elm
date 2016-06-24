module AboutResults exposing (testSuite)

import Assert
import Test exposing (describe, test)
import TestHelpers exposing (..)


testSuite =
    describe "About Result"
        [ test "results represent the result of a function"
            <| \() -> Assert.equal (Ok 42) xResult
        , test "but could be an error"
            <| \() -> Assert.equal (Err "there was an error") xResult
        , test "a result can be converted to a maybe"
            <| \() -> Assert.equal (Result.toMaybe (Ok 42)) xMaybe
        , test "but an error will become nothing"
            <| \() -> Assert.equal (Result.toMaybe (Err "there was an error")) xMaybe
        , test "a maybe can also be converted to a result"
            <| \() -> Assert.equal (Result.fromMaybe "there was an error" (Just 42)) xResult
        , test "and will become an error if there is nothing"
            <| \() -> Assert.equal (Result.fromMaybe "there was an error" Nothing) xResult
        ]
