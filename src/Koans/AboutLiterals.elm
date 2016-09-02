module AboutLiterals exposing (testSuite)

import Expect
import Test exposing (describe, test)
import TestHelpers exposing (..)


testSuite =
    describe "About Literals"
        [ test "strings are enclosed in double quotes" <|
            \() ->
                xString
                    |> Expect.equal "A string"
        , test "characters are enclosed in single quotes" <|
            \() ->
                xChar
                    |> Expect.equal 'A'
        , test "floats have a decimal" <|
            \() ->
                xNum
                    |> Expect.equal 42.24
        , test "integers do not" <|
            \() ->
                xNum
                    |> Expect.equal 42
        , test "number literals can be integers" <|
            let
                num : Int
                num =
                    42
            in
                \() ->
                    xNum
                        |> Expect.equal num
        , test "number literals can be floats" <|
            let
                num : Float
                num =
                    42.0
            in
                \() ->
                    xNum
                        |> Expect.equal num
        , test "lists are denoted by brackets" <|
            \() ->
                xList
                    |> Expect.equal [ 1, 2, 3 ]
        ]
