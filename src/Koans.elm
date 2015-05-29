import ElmTest.Runner.Element exposing (..)
import ElmTest.Test as Test
import AboutAsserts
import AboutLiterals
import AboutComparisonOperators
import AboutLogicalOperators
import AboutMathematicalOperators
import AboutNumberConversions
import AboutFunctions
import AboutLists
import AboutMaybe
import AboutResults
import AboutStrings
import AboutRegexes
import AboutTime
import AboutDates
import AboutSets

main = runDisplay (Test.suite "The Elm Koans" [
                     AboutAsserts.testSuite,
                     AboutLiterals.testSuite,
                     AboutComparisonOperators.testSuite,
                     AboutLogicalOperators.testSuite,
                     AboutMathematicalOperators.testSuite,
                     AboutNumberConversions.testSuite,
                     AboutFunctions.testSuite,
                     AboutLists.testSuite,
                     AboutMaybe.testSuite,
                     AboutResults.testSuite,
                     AboutStrings.testSuite,
                     AboutRegexes.testSuite,
                     AboutTime.testSuite,
                     AboutDates.testSuite,
                     AboutSets.testSuite
                  ])
