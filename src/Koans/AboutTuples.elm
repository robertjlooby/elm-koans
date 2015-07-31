module AboutTuples where

import ElmTest.Assertion exposing (..)
import ElmTest.Test exposing (suite, test)
import TestHelpers exposing (..)


testSuite =
  suite
    "About Tuples"
    [ test "tuples are like lists of fixed length"
        (assertEqual xTuple (1, 2))
    , test "tuples may also be of mixed types"
        (assertEqual xTuple2 (1, "hey"))
    , test "fst gets the first element of a 2-tuple"
        (assertEqual xNum (fst xTuple2))
    , test "snd gets the second element of a 2-tuple"
        (assertEqual xString (snd xTuple2))
    , test "case statements may be used to destructure a tuple"
        (case (1, 2) of
          (first, second) ->
            (assert ((first == xNum) && (second == xNum))))
    , test "tuples may also be destructured by function arguments"
        (assert ((\(f, s) -> ((f == xNum) && (s == xNum))) (1, 2)))
    ]
