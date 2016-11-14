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
        [ test "a set can be created from a list" <|
            \() ->
                xSet
                    |> assertEqualSets (Set.fromList [ 1, 2, 3 ])
        , test "a set cannot contain duplicates" <|
            \() ->
                xSet
                    |> assertEqualSets (Set.fromList [ 1, 2, 3, 3, 2, 1 ])
        , test "sets may be empty" <|
            \() ->
                xSet
                    |> assertEqualSets Set.empty
        , test "or contain a single value" <|
            \() ->
                xSet
                    |> assertEqualSets (Set.singleton 0)
        , test "insert may add a new element to a set" <|
            \() ->
                xSet
                    |> assertEqualSets (Set.insert 4 oneTwoThree)
        , test "but may not add duplicates" <|
            \() ->
                xSet
                    |> assertEqualSets (Set.insert 1 oneTwoThree)
        , test "remove may subtract an element from a set" <|
            \() ->
                xSet
                    |> assertEqualSets (Set.remove 1 oneTwoThree)
        , test "but only if it is there" <|
            \() ->
                xSet
                    |> assertEqualSets (Set.remove 4 oneTwoThree)
        , test "member can check if an element is in a set" <|
            \() ->
                xBool
                    |> Expect.equal (Set.member 2 oneTwoThree)
        , test "union will add two sets" <|
            \() ->
                xSet
                    |> assertEqualSets (Set.union oneTwoThree (Set.fromList [ 3, 4 ]))
        , test "intersect will get the intersection" <|
            \() ->
                xSet
                    |> assertEqualSets (Set.intersect oneTwoThree (Set.fromList [ 3, 4 ]))
        , test "diff is the difference between the first and second sets" <|
            \() ->
                xSet
                    |> assertEqualSets (Set.diff oneTwoThree (Set.fromList [ 1, 3 ]))
        ]
