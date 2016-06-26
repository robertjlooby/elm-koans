module AboutMaybe exposing (testSuite)

import Expect
import Test exposing (describe, test)
import TestHelpers exposing (..)


testSuite =
    describe "About Maybe"
        [ test "maybe represents a value that may be nothing"
            <| \() -> Expect.equal Nothing xMaybe
        , test "or the value could be something"
            <| \() -> Expect.equal (Just 5) xMaybe
        , test "withDefault can be used to get the value from a maybe"
            <| \() -> Expect.equal (Maybe.withDefault 3 (Just 5)) xNum
        , test "but will give the default value if there is nothing"
            <| \() -> Expect.equal (Maybe.withDefault 3 Nothing) xNum
        , test "oneOf will get the first value from a list of maybes"
            <| \() -> Expect.equal (Maybe.oneOf [ Nothing, (Just 1), (Just 2) ]) xMaybe
        , test "but you could still wind up with nothing"
            <| \() -> Expect.equal (Maybe.oneOf [ Nothing, Nothing, Nothing ]) xMaybe
        , test "map will transform the value in a maybe"
            <| \() -> Expect.equal (Maybe.map (\n -> n / 2) (Just 4)) xMaybe
        , test "but will not transform a nothing"
            <| \() -> Expect.equal (Maybe.map (\n -> n / 2) Nothing) xMaybe
        ]
