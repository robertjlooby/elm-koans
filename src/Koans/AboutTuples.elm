module AboutTuples exposing (..)

import ElmTest exposing (..)
import TestHelpers exposing (..)


testSuite =
  suite
    "About Tuples"
    [ test
        "tuples are like lists of fixed length"
        (assertEqual ( 1, 2 ) xTuple)
    , test
        "tuples may also be of mixed types"
        (assertEqual ( 1, "hey" ) xTuple2)
    , test
        "there is a special comma syntax for creating tuples"
        (assertEqual ((,) 1 "hey") xTuple2)
    , test
        "you use as many commas as there would be in the tuple"
        (assertEqual ((,,) 1 "hey" []) xTuple3)
    , test
        "fst gets the first element of a 2-tuple"
        (assertEqual (fst xTuple2) xNum)
    , test
        "snd gets the second element of a 2-tuple"
        (assertEqual (snd xTuple2) xString)
    , test
        "case statements may be used to destructure a tuple"
        (case ( 1, 2 ) of
          ( first, second ) ->
            (assert ((first == xNum) && (second == xNum)))
        )
    , test
        "tuples may also be destructured by function arguments"
        (assert ((\( f, s ) -> ((f == xNum) && (s == xNum))) ( 1, 2 )))
    ]
