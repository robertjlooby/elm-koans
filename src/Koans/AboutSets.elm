module AboutSets where

import ElmTest.Assertion exposing (..)
import ElmTest.Test as Test
import Set
import TestHelpers exposing (..)


assertEqualSets set1 set2 = assertEqual (Set.toList set1) (Set.toList set2)


oneTwoThree = Set.fromList [1, 2, 3]


testSuite =
  Test.suite
    "About Sets"
    [ Test.test "a set can be created from a list" (assertEqualSets xSet (Set.fromList [1, 2, 3]))
    , Test.test "a set cannot contain duplicates" (assertEqualSets xSet (Set.fromList [1, 2, 3, 3, 2, 1]))
    , Test.test "sets may be empty" (assertEqualSets xSet Set.empty)
    , Test.test "or contain a single value" (assertEqualSets xSet (Set.singleton 0))
    , Test.test "insert may add a new element to a set" (assertEqualSets xSet (Set.insert 4 oneTwoThree))
    , Test.test "but may not add duplicates" (assertEqualSets xSet (Set.insert 1 oneTwoThree))
    , Test.test "remove may subtract an element from a set" (assertEqualSets xSet (Set.remove 1 oneTwoThree))
    , Test.test "but only if it is there" (assertEqualSets xSet (Set.remove 4 oneTwoThree))
    , Test.test "member can check if an element is in a set" (assertEqual xBool (Set.member 2 oneTwoThree))
    , Test.test "union will add two sets" (assertEqualSets xSet (Set.union oneTwoThree (Set.fromList [3, 4])))
    , Test.test "intersect will get the intersection" (assertEqualSets xSet (Set.intersect oneTwoThree (Set.fromList [3, 4])))
    , Test.test "diff is the difference between the first and second sets" (assertEqualSets xSet (Set.diff oneTwoThree (Set.fromList [1, 3])))
    ]
