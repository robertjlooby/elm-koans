module AboutMaybe (..) where

import ElmTest exposing (..)
import Maybe
import TestHelpers exposing (..)


testSuite =
  suite
    "About Maybe"
    [ test
        "maybe represents a value that may be nothing"
        (assertEqual xMaybe Nothing)
    , test
        "or the value could be something"
        (assertEqual xMaybe (Just 5))
    , test
        "withDefault can be used to get the value from a maybe"
        (assertEqual xNum (Maybe.withDefault 3 (Just 5)))
    , test
        "but will give the default value if there is nothing"
        (assertEqual xNum (Maybe.withDefault 3 Nothing))
    , test
        "oneOf will get the first value from a list of maybes"
        (assertEqual xMaybe (Maybe.oneOf [ Nothing, (Just 1), (Just 2) ]))
    , test
        "but you could still wind up with nothing"
        (assertEqual xMaybe (Maybe.oneOf [ Nothing, Nothing, Nothing ]))
    , test
        "map will transform the value in a maybe"
        (assertEqual xMaybe (Maybe.map (\n -> n / 2) (Just 4)))
    , test
        "but will not transform a nothing"
        (assertEqual xMaybe (Maybe.map (\n -> n / 2) Nothing))
    ]
