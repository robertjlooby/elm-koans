module AboutSets exposing (testSuite)

import Expect
import Set
import Test exposing (describe, test)
import TestHelpers exposing (..)


assertEqualSets set1 set2 =
    Expect.equal (Set.toList set1) (Set.toList set2)


oneTwoThree =
    Set.fromList [ 1, 2, 3 ]


testSuite =
    describe "About Sets"
        [ test "a set can be created from a list"
            <| \() -> assertEqualSets (Set.fromList [ 1, 2, 3 ]) xSet
        , test "a set cannot contain duplicates"
            <| \() -> assertEqualSets (Set.fromList [ 1, 2, 3, 3, 2, 1 ]) xSet
        , test "sets may be empty"
            <| \() -> assertEqualSets Set.empty xSet
        , test "or contain a single value"
            <| \() -> assertEqualSets (Set.singleton 0) xSet
        , test "insert may add a new element to a set"
            <| \() -> assertEqualSets (Set.insert 4 oneTwoThree) xSet
        , test "but may not add duplicates"
            <| \() -> assertEqualSets (Set.insert 1 oneTwoThree) xSet
        , test "remove may subtract an element from a set"
            <| \() -> assertEqualSets (Set.remove 1 oneTwoThree) xSet
        , test "but only if it is there"
            <| \() -> assertEqualSets (Set.remove 4 oneTwoThree) xSet
        , test "member can check if an element is in a set"
            <| \() -> Expect.equal (Set.member 2 oneTwoThree) xBool
        , test "union will add two sets"
            <| \() -> assertEqualSets (Set.union oneTwoThree (Set.fromList [ 3, 4 ])) xSet
        , test "intersect will get the intersection"
            <| \() -> assertEqualSets (Set.intersect oneTwoThree (Set.fromList [ 3, 4 ])) xSet
        , test "diff is the difference between the first and second sets"
            <| \() -> assertEqualSets (Set.diff oneTwoThree (Set.fromList [ 1, 3 ])) xSet
        ]
