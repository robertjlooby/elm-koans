module AboutLists where

import List ((::))
import List
import ElmTest.Assertion (..)
import ElmTest.Test as Test
import TestHelpers (..)

testSuite = Test.suite "About Lists" [
              Test.test "list literals are denoted by brackets" (assertEqual [1, 2, 3] xList),
              Test.test "length gives the length of a list" (assertEqual xNum (List.length [1, 2, 3])),
              Test.test "isEmpty determines if a list is empty" (assertEqual xBool (List.isEmpty [])),
              Test.test "reverse revereses a list" (assertEqual xList (List.reverse [1, 2, 3])),
              Test.test "member tests if a list includes a value" (assertEqual xBool (List.member 2 [1, 2, 3])),
              Test.test "head returns the first item in a list" (assertEqual xNum (List.head [1, 2, 3])),
              Test.test "tail returns a list of all items but the first item in a list" (assertEqual xList (List.tail [1, 2, 3])),
              Test.test "take returns the first n items in a list" (assertEqual xList (List.take 2 [1, 2, 3])),
              Test.test "drop returns the list without the first n items" (assertEqual xList (List.drop 2 [1, 2, 3])),
              Test.test "filter returns the elements that return true for a predicate function" (assertEqual xList (List.filter (\x -> x % 2 == 0) [1, 2, 3, 4])),
              Test.test "all tests whether all elements of a list return true for a predicate function" (assertEqual xBool (List.all (\x -> x % 2 == 0) [2, 4])),
              Test.test "any tests whether any elements of a list return true for a predicate function" (assertEqual xBool (List.any (\x -> x % 2 == 0) [1, 2, 3])),
              Test.test "repeat returns a list with n copies of a value" (assertEqual xList (List.repeat 4 1)),
              Test.test "sum returns the sum of a list of numbers" (assertEqual xNum (List.sum [1, 2, 3])),
              Test.test "product returns the product of a list of numbers" (assertEqual xNum (List.product [1, 2, 3])),
              Test.test "minimum returns the minimum of a list of comparables" (assertEqual xNum (List.minimum [1, 2, 3])),
              Test.test "maximum returns the maximum of a list of comparables" (assertEqual xChar (List.maximum ['a', 'b', 'c'])),
              Test.test "sort sorts a list of comparables" (assertEqual xList (List.sort ['c', 'a', 'b'])),
              Test.test "sortBy sorts using a function that returns a comparable" (assertEqual xList (List.sortBy (\x -> x % 3) [10, 6, 8])),
              Test.test ":: is the cons operator" (assertEqual xList (1 :: [2, 3])),
              Test.test "append puts 2 lists together" (assertEqual xList (List.append [1, 2] [3, 4])),
              Test.test "concat appends the elements in a list of lists" (assertEqual xList (List.concat [[1, 2], [3, 4]])),
              Test.test "intersperse puts a value between all elements of a list" (assertEqual xList (List.intersperse 1 [2, 3, 4])),
              Test.test "map applies a function to every element of a list" (assertEqual xList (List.map (\x -> 2 * x) [1, 2, 3])),
              Test.test "map2 applies a function to elements from 2 lists" (assertEqual xList (List.map2 (\x y -> x * y) [1, 2, 3] [4, 5, 6])),
              -- corresponding functions exist up to map6
              Test.test "indexedMap applies a function to the index of an element and that element" (assertEqual xList (List.indexedMap (\x y -> y - x) [1, 2, 3])),
              Test.test "foldl reduces a list from the left" (assertEqual xString (List.foldl (\x y -> x ++ y) "a" ["b", "c", "d"])),
              Test.test "foldr reduces a list from the right" (assertEqual xString (List.foldr (\x y -> x ++ y) "a" ["b", "c", "d"])),
              Test.test "foldl1 reduces a list from the left without a base case" (assertEqual xString (List.foldl1 (\x y -> x ++ y) ["b", "c", "d"])),
              Test.test "foldr1 reduces a list from the right without a base case" (assertEqual xString (List.foldr1 (\x y -> x ++ y) ["b", "c", "d"])),
              Test.test "scanl reduces a list from the left, building a list of intermediate results" (assertEqual xList (List.scanl (\x y -> x ++ y) "a" ["b", "c", "d"])),
              Test.test "scanl1 reduces a list from the left without a base case, building a list of intermediate results" (assertEqual xList (List.scanl1 (\x y -> x ++ y) ["b", "c", "d"]))
            ]
