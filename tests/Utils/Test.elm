module Utils.Test
    exposing
        ( Event(..)
        , Failure
        , Test
        , asCanonical
        , asStream
        , describe
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


type alias Failure =
    { given : Maybe String, message : String }


type Event
    = Section String
    | Run String (() -> Maybe Failure)


asStream : List Test -> List Event
asStream tests =
    case tests of
        [] ->
            []

        (Batch description subTests) :: next ->
            Section description :: asStream (subTests ++ next)

        (Single description thunk) :: next ->
            Run description (thunk >> ElmTestRunner.getFailure) :: asStream next


asCanonical : Test -> ElmTest.Test
asCanonical test =
    case test of
        Batch description children ->
            ElmTest.describe description (List.map asCanonical children)

        Single description thunk ->
            ElmTest.test description thunk
