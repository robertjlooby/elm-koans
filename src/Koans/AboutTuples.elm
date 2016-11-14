module AboutTuples exposing (testSuite)

import Expect
import Test exposing (describe, test)
import TestHelpers exposing (..)


testSuite =
    describe "About Tuples"
        [ test "tuples are like lists of fixed length" <|
            \() ->
                xTuple
                    |> Expect.equal ( 1, 2 )
        , test "tuples may also be of mixed types" <|
            \() ->
                xTuple2
                    |> Expect.equal ( 1, "hey" )
        , test "there is a special comma syntax for creating tuples" <|
            \() ->
                xTuple2
                    |> Expect.equal ((,) 1 "hey")
        , test "you use as many commas as there would be in the tuple" <|
            \() ->
                xTuple3
                    |> Expect.equal ((,,) 1 "hey" [])
        , test "fst gets the first element of a 2-tuple" <|
            \() ->
                xNum
                    |> Expect.equal (fst xTuple2)
        , test "snd gets the second element of a 2-tuple" <|
            \() ->
                xString
                    |> Expect.equal (snd xTuple2)
        , test "case statements may be used to destructure a tuple" <|
            \() ->
                case ( 1, 2 ) of
                    ( first, second ) ->
                        ((first == xNum) && (second == xNum))
                            |> Expect.true "Should be True"
        , test "tuples may also be destructured by function arguments" <|
            \() ->
                ( 1, 2 )
                    |> (\( f, s ) -> ((f == xNum) && (s == xNum)))
                    |> Expect.true "Should be True"
        ]
