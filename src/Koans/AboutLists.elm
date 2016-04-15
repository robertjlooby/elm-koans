module AboutLists (..) where

import ElmTest exposing (..)
import List exposing ((::))
import TestHelpers exposing (..)


testSuite =
  suite
    "About Lists"
    [ test
        "list literals are denoted by brackets"
        (assertEqual [ 1, 2, 3 ] xList)
    , test
        "length gives the length of a list"
        (assertEqual (List.length [ 1, 2, 3 ]) xNum)
    , test
        "isEmpty determines if a list is empty"
        (assertEqual (List.isEmpty []) xBool)
    , test
        "reverse revereses a list"
        (assertEqual (List.reverse [ 1, 2, 3 ]) xList)
    , test
        "member tests if a list includes a value"
        (assertEqual (List.member 2 [ 1, 2, 3 ]) xBool)
    , test
        "head returns the first item in a list"
        (assertEqual (List.head [ 1, 2, 3 ]) (Just xNum))
    , test
        "minimum returns the minimum of a list of comparables"
        (assertEqual (List.minimum [ 1, 2, 3 ]) (Just xNum))
    , test
        "maximum returns the maximum of a list of comparables"
        (assertEqual (List.maximum [ 'a', 'b', 'c' ]) (Just xChar))
    , test
        "take returns the first n items in a list"
        (assertEqual (List.take 2 [ 1, 2, 3 ]) xList)
    , test
        "drop returns the list without the first n items"
        (assertEqual (List.drop 2 [ 1, 2, 3 ]) xList)
    , test
        "filter returns the elements that return true for a predicate function"
        (assertEqual (List.filter (\x -> x % 2 == 0) [ 1, 2, 3, 4 ]) xList)
    , test
        "all tests whether all elements of a list return true for a predicate function"
        (assertEqual (List.all (\x -> x % 2 == 0) [ 2, 4 ]) xBool)
    , test
        "any tests whether any elements of a list return true for a predicate function"
        (assertEqual (List.any (\x -> x % 2 == 0) [ 1, 2, 3 ]) xBool)
    , test
        "repeat returns a list with n copies of a value"
        (assertEqual (List.repeat 4 1) xList)
    , test
        "sum returns the sum of a list of numbers"
        (assertEqual (List.sum [ 1, 2, 3 ]) xNum)
    , test
        "product returns the product of a list of numbers"
        (assertEqual (List.product [ 1, 2, 3 ]) xNum)
    , test
        "sort sorts a list of comparables"
        (assertEqual (List.sort [ 'c', 'a', 'b' ]) xList)
    , test
        "sortBy sorts using a function that returns a comparable"
        (assertEqual (List.sortBy (\x -> x % 3) [ 10, 6, 8 ]) xList)
    , test
        ":: is the cons operator"
        (assertEqual (1 :: [ 2, 3 ]) xList)
    , test
        "append puts 2 lists together"
        (assertEqual (List.append [ 1, 2 ] [ 3, 4 ]) xList)
    , test
        "concat appends the elements in a list of lists"
        (assertEqual (List.concat [ [ 1, 2 ], [ 3, 4 ] ]) xList)
    , test
        "intersperse puts a value between all elements of a list"
        (assertEqual (List.intersperse 1 [ 2, 3, 4 ]) xList)
    , test
        "map applies a function to every element of a list"
        (assertEqual (List.map (\x -> 2 * x) [ 1, 2, 3 ]) xList)
    , test
        "map2 applies a function to elements from 2 lists"
        -- corresponding functions exist up to map6
        (assertEqual (List.map2 (\x y -> x * y) [ 1, 2, 3 ] [ 4, 5, 6 ]) xList)
    , test
        "indexedMap applies a function to the index of an element and that element"
        (assertEqual (List.indexedMap (\x y -> y - x) [ 1, 2, 3 ]) xList)
    , test
        "foldl reduces a list from the left"
        (assertEqual (List.foldl (\x y -> x ++ y) "a" [ "b", "c", "d" ]) xString)
    , test
        "foldr reduces a list from the right"
        (assertEqual (List.foldr (\x y -> x ++ y) "a" [ "b", "c", "d" ]) xString)
    , test
        "scanl reduces a list from the left, building a list of intermediate results"
        (assertEqual (List.scanl (\x y -> x ++ y) "a" [ "b", "c", "d" ]) xList)
    ]
