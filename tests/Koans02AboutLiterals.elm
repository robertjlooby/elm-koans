module Koans02AboutLiterals exposing (testSuite)

import Expect
import Utils.Blank exposing (..)
import Utils.Test exposing (describe, test)


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
                    |> Expect.within (Expect.Absolute 0.0001) 42.24
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
                    |> Expect.within (Expect.Absolute 0.0001) num
        , test "floats can be expected to be within an absolute range" <|
            let
                num : Float
                num =
                    41.9999
            in
            \() ->
                x____replace me____x
                    |> Expect.within (Expect.Absolute 0.0001) num
        , test "or floats can be expected to be within relative range (0.01 meaning 1%)" <|
            let
                num : Float
                num =
                    41.6
            in
            \() ->
                x____replace me____x
                    |> Expect.within (Expect.Relative 0.01) num
        , test "lists are denoted by brackets" <|
            \() ->
                x____replace me____x
                    |> Expect.equal [ 1, 2, 3 ]
        ]
