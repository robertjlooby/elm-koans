module AboutLiterals exposing (testSuite)

import Expect
import Test exposing (describe, test)
import TestHelpers exposing (..)


testSuite =
    describe "About Literals"
        [ test "strings are enclosed in double quotes" <|
            \() -> Expect.equal "A string" xString
        , test "characters are enclosed in single quotes" <|
            \() -> Expect.equal 'A' xChar
        , test "floats have a decimal" <|
            \() -> Expect.equal 42.24 xNum
        , test "integers do not" <|
            \() -> Expect.equal 42 xNum
        , test "number literals can be integers" <|
            let
                num : Int
                num =
                    42
            in
                \() -> Expect.equal num xNum
        , test "number literals can be floats" <|
            let
                num : Float
                num =
                    42.0
            in
                \() -> Expect.equal num xNum
        , test "lists are denoted by brackets" <|
            \() -> Expect.equal [ 1, 2, 3 ] xList
        ]
