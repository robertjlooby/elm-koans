module Koans02AboutLiterals exposing (testSuite)

import Expect
import Utils.Test exposing (describe, test)
import Utils.Blank exposing (..)


testSuite =
    describe "About Literals"
        [ test "strings are enclosed in double quotes" <|
            \() ->
                x____replace me____x
                    |> Expect.equal "A string"
        , test "characters are enclosed in single quotes" <|
            \() ->
                x____replace me____x
                    |> Expect.equal 'A'
        , test "floats have a decimal" <|
            \() ->
                x____replace me____x
                    |> Expect.equal 42.24
        , test "integers do not" <|
            \() ->
                x____replace me____x
                    |> Expect.equal 42
        , test "number literals can be integers" <|
            let
                num : Int
                num =
                    42
            in
                \() ->
                    x____replace me____x
                        |> Expect.equal num
        , test "number literals can be floats" <|
            let
                num : Float
                num =
                    42.0
            in
                \() ->
                    x____replace me____x
                        |> Expect.equal num
        , test "lists are denoted by brackets" <|
            \() ->
                x____replace me____x
                    |> Expect.equal [ 1, 2, 3 ]
        ]
