module AboutLiterals exposing (..)

import ElmTest exposing (..)
import TestHelpers exposing (..)


-- Single line comments begin with "--"
{- Multi line comments
   begin with "{-" and end with "-}"
-}


testSuite =
    suite "About Literals"
        [ test "strings are enclosed in double quotes"
            (assertEqual "A string" xString)
        , test "characters are enclosed in single quotes"
            (assertEqual 'A' xChar)
        , test "floats have a decimal"
            (assertEqual 42.24 xNum)
        , test "integers do not"
            (assertEqual 42 xNum)
        , test "number literals can be integers"
            <| let
                num : Int
                num =
                    42
               in
                (assertEqual num xNum)
        , test "number literals can be floats"
            <| let
                num : Float
                num =
                    42.0
               in
                (assertEqual num xNum)
        , test "lists are denoted by brackets"
            (assertEqual [ 1, 2, 3 ] xList)
        ]
