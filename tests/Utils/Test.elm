module Utils.Test
    exposing
        ( Context
        , Failure
        , Test
        , convert
        , describe
        , flatten
        , test
        )

import Expect
import Test as ElmTest
import Test.Runner as ElmTestRunner


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
    List ( List String, () -> Maybe Failure )


type alias Failure =
    { given : Maybe String, message : String }


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
            [ ( tag :: labels, thunk >> ElmTestRunner.getFailure ) ]


convert : Test -> ElmTest.Test
convert test =
    case test of
        Batch tag children ->
            ElmTest.describe tag (List.map convert children)

        Single tag thunk ->
            ElmTest.test tag thunk
