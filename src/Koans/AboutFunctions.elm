module AboutFunctions exposing (..)

import ElmTest exposing (..)
import TestHelpers exposing (..)


add1 x =
    x + 1


add : number -> number -> number
add x y =
    x + y


subtract =
    \x y -> x - y


subtractFrom4 : number -> number
subtractFrom4 =
    subtract 4


always5 =
    always 5


subtract4 =
    (flip subtract) 4


multiplyBy2 x =
    2 * x


testSuite =
    suite "About Functions"
        [ test "the identity function returns whatever it is passed"
            (assertEqual (identity 4) xNum)
        , test "functions are defined as 'name args = implementation'"
            (assertEqual 5 (add1 xNum))
        , test "functions may have an optional type signature"
            (assertEqual 5 (add 3 xNum))
        , test "functions may be used as infix with backticks"
            (assertEqual 5 (3 `add` xNum))
        , test "anonymous functions are defined with '\\args -> implementation'"
            (assertEqual 5 (subtract 8 xNum))
        , test "anonymous functions may be defined inline"
            (assertEqual 5 ((\x y -> x - y) 8 xNum))
        , test "functions passed some values return curried functions"
            (assertEqual 1 (subtractFrom4 xNum))
        , test "the always function returns its first argument, no matter what the second is"
            (assertEqual (always5 4) xNum)
        , test "the flip function flips the order of the first two arguments of a function"
            (assertEqual (subtract4 9) xNum)
        , test "f <| a applies the function f to the arg a"
            (assertEqual (subtract4 <| add 1 9) xNum)
        , test "a |> f applies the function f to the arg a"
            (assertEqual (add 1 9 |> subtract4) xNum)
        , test "g << f composes function g with function f"
            (assertEqual ((multiplyBy2 << subtract4) 9) xNum)
        , test "f >> g composes function g with function f"
            (assertEqual ((subtract4 >> multiplyBy2) 9) xNum)
        ]
