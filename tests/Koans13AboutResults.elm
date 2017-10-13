module Koans13AboutResults exposing (testSuite)

import Expect
import Utils.Test exposing (describe, test)
import Utils.Blank exposing (..)


testSuite =
    describe "About Result"
        [ test "results represent the result of a function" <|
            \() ->
                x____replace me____x
                    |> Expect.equal (Ok 42)
        , test "but could be an error" <|
            \() ->
                x____replace me____x
                    |> Expect.equal (Err "there was an error")
        , test "a result can be converted to a maybe" <|
            \() ->
                x____replace me____x
                    |> Expect.equal (Result.toMaybe (Ok 42))
        , test "but an error will become nothing" <|
            \() ->
                x____replace me____x
                    |> Expect.equal (Result.toMaybe (Err "there was an error"))
        , test "a maybe can also be converted to a result" <|
            \() ->
                x____replace me____x
                    |> Expect.equal (Result.fromMaybe "there was an error" (Just 42))
        , test "and will become an error if there is nothing" <|
            \() ->
                x____replace me____x
                    |> Expect.equal (Result.fromMaybe "there was an error" Nothing)
        ]
