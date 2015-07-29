module AboutResults where

import ElmTest.Assertion exposing (..)
import ElmTest.Test as Test
import Result
import TestHelpers exposing (..)


testSuite =
  Test.suite
    "About Result"
    [ Test.test "results represent the result of a function" (assertEqual xResult (Ok 42))
    , Test.test "but could be an error" (assertEqual xResult (Err "there was an error"))
    , Test.test "a result can be converted to a maybe" (assertEqual xMaybe (Result.toMaybe (Ok 42)))
    , Test.test "but an error will become nothing" (assertEqual xMaybe (Result.toMaybe (Err "there was an error")))
    , Test.test "a maybe can also be converted to a result" (assertEqual xResult (Result.fromMaybe "there was an error" (Just 42)))
    , Test.test "and will become an error if there is nothing" (assertEqual xResult (Result.fromMaybe "there was an error" Nothing))
    ]
