module Utils.Test
    exposing
        ( Context
        , Test
        , convert
        , describe
        , flatten
        , test
        )

import Expect
import Test


-- KOANS


type Test
    = Batch String (List Test)
    | Single String (() -> Expect.Expectation)


describe : String -> List Test -> Test
describe =
    Batch


test : String -> (() -> Expect.Expectation) -> Test
test =
    Single



-- RUNNING TESTS


type alias Context =
    List ( List String, () -> Expect.Expectation )


flatten : Test -> Context
flatten =
    flattenHelp []


flattenHelp : List String -> Test -> Context
flattenHelp labels test =
    case test of
        Batch _ [] ->
            []

        Batch tag (current :: next) ->
            flattenHelp (tag :: labels) current
                ++ flattenHelp (tag :: labels) (Batch tag next)

        Single tag thunk ->
            [ ( tag :: labels, thunk ) ]


convert : Test -> Test.Test
convert test =
    case test of
        Batch tag children ->
            Test.describe tag (List.map convert children)

        Single tag thunk ->
            Test.test tag thunk
