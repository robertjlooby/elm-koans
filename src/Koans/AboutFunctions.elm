module AboutFunctions where

import ElmTest.Assertion exposing (..)
import ElmTest.Test as Test
import TestHelpers exposing (..)


add1 x = x + 1


add : number -> number -> number
add x y = x + y


subtract = \x y -> x - y


subtractFrom4 : number -> number
subtractFrom4 = subtract 4


always5 = always 5


subtract4 = (flip subtract) 4


multiplyBy2 x = 2 * x


testSuite =
  Test.suite
    "About Functions"
    [ Test.test "the identity function returns whatever it is passed" (assertEqual xNum (identity 4))
    , Test.test "functions are defined as 'name args = implementation'" (assertEqual 5 (add1 xNum))
    , Test.test "functions may have an optional type signature" (assertEqual 5 (add 3 xNum))
    , Test.test "functions may be used as infix with backticks" (assertEqual 5 (3 `add` xNum))
    , Test.test "anonymous functions are defined with '\\args -> implementation'" (assertEqual 5 (subtract 8 xNum))
    , Test.test "anonymous functions may be defined inline" (assertEqual 5 ((\x y -> x - y) 8 xNum))
    , Test.test "functions passed some values return curried functions" (assertEqual 1 (subtractFrom4 xNum))
    , Test.test "the always function returns its first argument, no matter what the second is" (assertEqual xNum (always5 4))
    , Test.test "the flip function flips the order of the first two arguments of a function" (assertEqual xNum (subtract4 9))
    , Test.test "f <| a applies the function f to the arg a" (assertEqual xNum (subtract4 <| add 1 9))
    , Test.test "a |> f applies the function f to the arg a" (assertEqual xNum (add 1 9 |> subtract4))
    , Test.test "g << f composes function g with function f" (assertEqual xNum ((multiplyBy2 << subtract4) 9))
    , Test.test "f >> g composes function g with function f" (assertEqual xNum ((subtract4 >> multiplyBy2) 9))
    ]

