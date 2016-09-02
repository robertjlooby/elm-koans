module AboutTuples exposing (testSuite)

import Expect
import Test exposing (describe, test)
import TestHelpers exposing (..)


testSuite =
    describe "About Tuples"
        [ test "tuples are like lists of fixed length" <|
            \() -> Expect.equal ( 1, 2 ) xTuple
        , test "tuples may also be of mixed types" <|
            \() -> Expect.equal ( 1, "hey" ) xTuple2
        , test "there is a special comma syntax for creating tuples" <|
            \() -> Expect.equal ((,) 1 "hey") xTuple2
        , test "you use as many commas as there would be in the tuple" <|
            \() -> Expect.equal ((,,) 1 "hey" []) xTuple3
        , test "fst gets the first element of a 2-tuple" <|
            \() -> Expect.equal (fst xTuple2) xNum
        , test "snd gets the second element of a 2-tuple" <|
            \() -> Expect.equal (snd xTuple2) xString
        , test "case statements may be used to destructure a tuple" <|
            \() ->
                case ( 1, 2 ) of
                    ( first, second ) ->
                        Expect.true "Should be True" ((first == xNum) && (second == xNum))
        , test "tuples may also be destructured by function arguments" <|
            \() ->
                Expect.true "Should be True" ((\( f, s ) -> ((f == xNum) && (s == xNum))) ( 1, 2 ))
        ]
