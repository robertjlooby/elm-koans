module Main exposing (main)

import Koans01AboutExpects
import Koans02AboutLiterals
import Koans03AboutComparisonOperators
import Koans04AboutLogicalOperators
import Koans05AboutMathematicalOperators
import Koans06AboutNumberConversions
import Koans07AboutFunctions
import Koans08AboutMaybe
import Koans09AboutLists
import Koans10AboutArrays
import Koans11AboutTuples
import Koans12AboutDictionaries
import Koans13AboutResults
import Koans14AboutStrings
import Koans15AboutRegexes
import Koans16AboutTime
import Koans17AboutDates
import Koans18AboutSets
import Koans19AboutRecords
import Koans20AboutUnionTypes
import Test exposing (describe)
import Test.Runner.Html exposing (run)


main =
    run <|
        describe "The Elm Koans"
            [ Koans01AboutExpects.testSuite
            , Koans02AboutLiterals.testSuite
            , Koans03AboutComparisonOperators.testSuite
            , Koans04AboutLogicalOperators.testSuite
            , Koans05AboutMathematicalOperators.testSuite
            , Koans06AboutNumberConversions.testSuite
            , Koans07AboutFunctions.testSuite
            , Koans08AboutMaybe.testSuite
            , Koans09AboutLists.testSuite
            , Koans10AboutArrays.testSuite
            , Koans11AboutTuples.testSuite
            , Koans12AboutDictionaries.testSuite
            , Koans13AboutResults.testSuite
            , Koans14AboutStrings.testSuite
            , Koans15AboutRegexes.testSuite
            , Koans16AboutTime.testSuite
            , Koans17AboutDates.testSuite
            , Koans18AboutSets.testSuite
            , Koans19AboutRecords.testSuite
            , Koans20AboutUnionTypes.testSuite
            ]
