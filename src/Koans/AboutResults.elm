module AboutResults exposing (testSuite)

import Expect
import Test exposing (describe, test)
import TestHelpers exposing (..)


testSuite =
    describe "About Result"
        [ test "results represent the result of a function" <|
            \() ->
                xResult
                    |> Expect.equal (Ok 42)
        , test "but could be an error" <|
            \() ->
                xResult
                    |> Expect.equal (Err "there was an error")
        , test "a result can be converted to a maybe" <|
            \() ->
                xMaybe
                    |> Expect.equal (Result.toMaybe (Ok 42))
        , test "but an error will become nothing" <|
            \() ->
                xMaybe
                    |> Expect.equal (Result.toMaybe (Err "there was an error"))
        , test "a maybe can also be converted to a result" <|
            \() ->
                xResult
                    |> Expect.equal (Result.fromMaybe "there was an error" (Just 42))
        , test "and will become an error if there is nothing" <|
            \() ->
                xResult
                    |> Expect.equal (Result.fromMaybe "there was an error" Nothing)
        ]
