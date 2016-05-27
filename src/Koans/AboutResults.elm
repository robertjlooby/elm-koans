module AboutResults exposing (..)

import ElmTest exposing (..)
import Result
import TestHelpers exposing (..)


testSuite =
  suite
    "About Result"
    [ test
        "results represent the result of a function"
        (assertEqual (Ok 42) xResult)
    , test
        "but could be an error"
        (assertEqual (Err "there was an error") xResult)
    , test
        "a result can be converted to a maybe"
        (assertEqual (Result.toMaybe (Ok 42)) xMaybe)
    , test
        "but an error will become nothing"
        (assertEqual (Result.toMaybe (Err "there was an error")) xMaybe)
    , test
        "a maybe can also be converted to a result"
        (assertEqual (Result.fromMaybe "there was an error" (Just 42)) xResult)
    , test
        "and will become an error if there is nothing"
        (assertEqual (Result.fromMaybe "there was an error" Nothing) xResult)
    ]
