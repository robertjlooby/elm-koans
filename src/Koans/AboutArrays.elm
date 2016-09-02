module AboutArrays exposing (testSuite)

import Array exposing (fromList)
import Expect
import Test exposing (describe, test)
import TestHelpers exposing (..)


testSuite =
    describe "About Arrays"
        [ test "arrays can be created from a list" <|
            \() -> Expect.equal (fromList [ 0, 1 ]) (fromList xList)
        , test "arrays can also be turned into lists" <|
            \() -> Expect.equal (Array.toList <| fromList [ 0, 1 ]) xList
        , test "length gives the number of elements" <|
            \() -> Expect.equal (Array.length <| fromList [ 0, 1, 2 ]) xNum
        , test "values can be pushed on to an array" <|
            \() -> Expect.equal (Array.push 3 <| fromList [ 1, 2 ]) (fromList xList)
        , test "or two arrays can become one" <|
            \() -> Expect.equal (Array.append (fromList [ 1, 2 ]) (fromList [ 3 ])) (fromList xList)
        , test "it is easy to create an empty array" <|
            \() -> Expect.equal (Array.push 1 <| Array.empty) (fromList xList)
        , test "or to create an array of all the same value" <|
            \() -> Expect.equal (Array.repeat 3 "a") (fromList xList)
        , test "initialize creates an array based on the index" <|
            \() -> Expect.equal (Array.initialize 3 (\i -> i * 2)) (fromList xList)
        , test "you can test whether an array is empty" <|
            \() -> Expect.equal (Array.isEmpty Array.empty) xBool
        , test "mapping is just like with lists"
          -- so is indexedMap, filter, foldl, foldr
          <|
            \() -> Expect.equal (Array.map (\i -> i * 3) <| fromList [ 0, 1, 2 ]) (fromList xList)
        , test "unlike with lists, you can get the value at an index" <|
            \() -> Expect.equal (Array.get 1 <| fromList [ 0, 1, 2 ]) (Just xNum)
        , test "and set the value at an index" <|
            \() -> Expect.equal (Array.set 1 5 <| fromList [ 0, 1, 2 ]) (fromList xList)
        , test "or get a slice of the array" <|
            \() -> Expect.equal (Array.slice 1 4 <| fromList [ 0, 1, 2, 3, 4 ]) (fromList xList)
        ]
