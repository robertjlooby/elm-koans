module AboutLists exposing (testSuite)

import Expect
import Test exposing (describe, test)
import TestHelpers exposing (..)


testSuite =
    describe "About Lists"
        [ test "list literals are denoted by brackets" <|
            \() ->
                xList
                    |> Expect.equal [ 1, 2, 3 ]
        , test "length gives the length of a list" <|
            \() ->
                xNum
                    |> Expect.equal (List.length [ 1, 2, 3 ])
        , test "isEmpty determines if a list is empty" <|
            \() ->
                xBool
                    |> Expect.equal (List.isEmpty [])
        , test "reverse revereses a list" <|
            \() ->
                xList
                    |> Expect.equal (List.reverse [ 1, 2, 3 ])
        , test "member tests if a list includes a value" <|
            \() ->
                xBool
                    |> Expect.equal (List.member 2 [ 1, 2, 3 ])
        , test "head returns the first item in a list" <|
            \() ->
                (Just xNum)
                    |> Expect.equal (List.head [ 1, 2, 3 ])
        , test "minimum returns the minimum of a list of comparables" <|
            \() ->
                (Just xNum)
                    |> Expect.equal (List.minimum [ 1, 2, 3 ])
        , test "maximum returns the maximum of a list of comparables" <|
            \() ->
                (Just xChar)
                    |> Expect.equal (List.maximum [ 'a', 'b', 'c' ])
        , test "take returns the first n items in a list" <|
            \() ->
                xList
                    |> Expect.equal (List.take 2 [ 1, 2, 3 ])
        , test "drop returns the list without the first n items" <|
            \() ->
                xList
                    |> Expect.equal (List.drop 2 [ 1, 2, 3 ])
        , test "filter returns the elements that return true for a predicate function" <|
            \() ->
                xList
                    |> Expect.equal (List.filter (\x -> x % 2 == 0) [ 1, 2, 3, 4 ])
        , test "all tests whether all elements of a list return true for a predicate function" <|
            \() ->
                xBool
                    |> Expect.equal (List.all (\x -> x % 2 == 0) [ 2, 4 ])
        , test "any tests whether any elements of a list return true for a predicate function" <|
            \() ->
                xBool
                    |> Expect.equal (List.any (\x -> x % 2 == 0) [ 1, 2, 3 ])
        , test "repeat returns a list with n copies of a value" <|
            \() ->
                xList
                    |> Expect.equal (List.repeat 4 1)
        , test "sum returns the sum of a list of numbers" <|
            \() ->
                xNum
                    |> Expect.equal (List.sum [ 1, 2, 3 ])
        , test "product returns the product of a list of numbers" <|
            \() ->
                xNum
                    |> Expect.equal (List.product [ 1, 2, 3 ])
        , test "sort sorts a list of comparables" <|
            \() ->
                xList
                    |> Expect.equal (List.sort [ 'c', 'a', 'b' ])
        , test "sortBy sorts using a function that returns a comparable" <|
            \() ->
                xList
                    |> Expect.equal (List.sortBy (\x -> x % 3) [ 10, 6, 8 ])
        , test ":: is the cons operator" <|
            \() ->
                xList
                    |> Expect.equal (1 :: [ 2, 3 ])
        , test "append puts 2 lists together" <|
            \() ->
                xList
                    |> Expect.equal (List.append [ 1, 2 ] [ 3, 4 ])
        , test "concat appends the elements in a list of lists" <|
            \() ->
                xList
                    |> Expect.equal (List.concat [ [ 1, 2 ], [ 3, 4 ] ])
        , test "intersperse puts a value between all elements of a list" <|
            \() ->
                xList
                    |> Expect.equal (List.intersperse 1 [ 2, 3, 4 ])
        , test "map applies a function to every element of a list" <|
            \() ->
                xList
                    |> Expect.equal (List.map (\x -> 2 * x) [ 1, 2, 3 ])
        , test "map2 applies a function to elements from 2 lists" <|
            -- corresponding functions exist up to map6
            \() ->
                xList
                    |> Expect.equal (List.map2 (\x y -> x * y) [ 1, 2, 3 ] [ 4, 5, 6 ])
        , test "indexedMap applies a function to the index of an element and that element" <|
            \() ->
                xList
                    |> Expect.equal (List.indexedMap (\x y -> y - x) [ 1, 2, 3 ])
        , test "foldl reduces a list from the left" <|
            \() ->
                xString
                    |> Expect.equal (List.foldl (\x y -> x ++ y) "a" [ "b", "c", "d" ])
        , test "foldr reduces a list from the right" <|
            \() ->
                xString
                    |> Expect.equal (List.foldr (\x y -> x ++ y) "a" [ "b", "c", "d" ])
        , test "scanl reduces a list from the left, building a list of intermediate results" <|
            \() ->
                xList
                    |> Expect.equal (List.scanl (\x y -> x ++ y) "a" [ "b", "c", "d" ])
        ]
