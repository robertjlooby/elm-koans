module AboutMaybe where

import ElmTest.Assertion exposing (..)
import ElmTest.Test as Test
import Maybe
import TestHelpers exposing (..)


testSuite =
  Test.suite
    "About Maybe"
    [ Test.test "maybe represents a value that may be nothing" (assertEqual xMaybe Nothing)
    , Test.test "or the value could be something" (assertEqual xMaybe (Just 5))
    , Test.test "withDefault can be used to get the value from a maybe" (assertEqual xNum (Maybe.withDefault 3 (Just 5)))
    , Test.test "but will give the default value if there is nothing" (assertEqual xNum (Maybe.withDefault 3 Nothing))
    , Test.test "oneOf will get the first value from a list of maybes" (assertEqual xMaybe (Maybe.oneOf [Nothing, (Just 1), (Just 2)]))
    , Test.test "but you could still wind up with nothing" (assertEqual xMaybe (Maybe.oneOf [Nothing, Nothing, Nothing]))
    , Test.test "map will transform the value in a maybe" (assertEqual xMaybe (Maybe.map (\n -> n / 2) (Just 4)))
    , Test.test "but will not transform a nothing" (assertEqual xMaybe (Maybe.map (\n -> n / 2) Nothing))
    ]
