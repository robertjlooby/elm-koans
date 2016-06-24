module AboutTuples exposing (testSuite)

import Assert
import Test exposing (describe, test)
import TestHelpers exposing (..)


testSuite =
    describe "About Tuples"
        [ test "tuples are like lists of fixed length"
            <| \() -> Assert.equal ( 1, 2 ) xTuple
        , test "tuples may also be of mixed types"
            <| \() -> Assert.equal ( 1, "hey" ) xTuple2
        , test "there is a special comma syntax for creating tuples"
            <| \() -> Assert.equal ((,) 1 "hey") xTuple2
        , test "you use as many commas as there would be in the tuple"
            <| \() -> Assert.equal ((,,) 1 "hey" []) xTuple3
        , test "fst gets the first element of a 2-tuple"
            <| \() -> Assert.equal (fst xTuple2) xNum
        , test "snd gets the second element of a 2-tuple"
            <| \() -> Assert.equal (snd xTuple2) xString
        , test "case statements may be used to destructure a tuple"
            <| \() ->
                case ( 1, 2 ) of
                    ( first, second ) ->
                        Assert.true "Should be True" ((first == xNum) && (second == xNum))
        , test "tuples may also be destructured by function arguments"
            <| \() ->
                Assert.true "Should be True" ((\( f, s ) -> ((f == xNum) && (s == xNum))) ( 1, 2 ))
        ]
