module AboutLiterals exposing (testSuite)

import Assert
import Test exposing (describe, test)
import TestHelpers exposing (..)


-- Single line comments begin with "--"
{- Multi line comments
   begin with "{-" and end with "-}"
-}


testSuite =
    describe "About Literals"
        [ test "strings are enclosed in double quotes"
            <| \() -> Assert.equal "A string" xString
        , test "characters are enclosed in single quotes"
            <| \() -> Assert.equal 'A' xChar
        , test "floats have a decimal"
            <| \() -> Assert.equal 42.24 xNum
        , test "integers do not"
            <| \() -> Assert.equal 42 xNum
        , test "number literals can be integers"
            <| let
                num : Int
                num =
                    42
               in
                \() -> Assert.equal num xNum
        , test "number literals can be floats"
            <| let
                num : Float
                num =
                    42.0
               in
                \() -> Assert.equal num xNum
        , test "lists are denoted by brackets"
            <| \() -> Assert.equal [ 1, 2, 3 ] xList
        ]
