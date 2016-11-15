module AboutMaybe exposing (testSuite)

import Expect
import Test exposing (describe, test)
import TestHelpers exposing (..)


testSuite =
    describe "About Maybe"
        [ test "maybe represents a value that may be nothing" <|
            \() ->
                xMaybe
                    |> Expect.equal Nothing
        , test "or the value could be something" <|
            \() ->
                xMaybe
                    |> Expect.equal (Just 5)
        , test "withDefault can be used to get the value from a maybe" <|
            \() ->
                xNum
                    |> Expect.equal (Maybe.withDefault 3 (Just 5))
        , test "but will give the default value if there is nothing" <|
            \() ->
                xNum
                    |> Expect.equal (Maybe.withDefault 3 Nothing)
        , test "map will transform the value in a maybe" <|
            \() ->
                xMaybe
                    |> Expect.equal (Maybe.map (\n -> n / 2) (Just 4))
        , test "but will not transform a nothing" <|
            \() ->
                xMaybe
                    |> Expect.equal (Maybe.map (\n -> n / 2) Nothing)
        ]
