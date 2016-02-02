module Main (..) where

import AboutArrays
import AboutAsserts
import AboutComparisonOperators
import AboutDates
import AboutDictionaries
import AboutFunctions
import AboutLists
import AboutLiterals
import AboutLogicalOperators
import AboutMathematicalOperators
import AboutMaybe
import AboutNumberConversions
import AboutRecords
import AboutRegexes
import AboutResults
import AboutSets
import AboutStrings
import AboutTime
import AboutTuples
import AboutUnionTypes
import ElmTest exposing (..)


main =
  elementRunner
    <| suite
        "The Elm Koans"
        [ AboutAsserts.testSuite
        , AboutLiterals.testSuite
        , AboutComparisonOperators.testSuite
        , AboutLogicalOperators.testSuite
        , AboutMathematicalOperators.testSuite
        , AboutNumberConversions.testSuite
        , AboutFunctions.testSuite
        , AboutMaybe.testSuite
        , AboutLists.testSuite
        , AboutArrays.testSuite
        , AboutTuples.testSuite
        , AboutDictionaries.testSuite
        , AboutResults.testSuite
        , AboutStrings.testSuite
        , AboutRegexes.testSuite
        , AboutTime.testSuite
        , AboutDates.testSuite
        , AboutSets.testSuite
        , AboutRecords.testSuite
        , AboutUnionTypes.testSuite
        ]
