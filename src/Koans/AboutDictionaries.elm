module AboutDictionaries exposing (testSuite)

import Expect
import Dict
import Test exposing (describe, test)
import TestHelpers exposing (..)


testSuite =
    describe "About Dictionaries"
        <| [ test "dictionaries can be empty"
                <| \() -> Expect.equal (Dict.size Dict.empty) xNum
           , test "or initialized with a single key-value pair"
                <| \() -> Expect.equal (Dict.size <| Dict.singleton 1 "a") xNum
           , test "or from a list of key-value pairs"
                <| \() -> Expect.equal (Dict.size <| Dict.fromList [ ( 1, "a" ), ( 2, "b" ) ]) xNum
           , test "they can also be converted back to a list"
                <| \() -> Expect.equal (Dict.toList <| Dict.fromList [ ( 1, "a" ), ( 2, "b" ) ]) xList
           , test "checking for an empty dictionary is easy"
                <| \() -> Expect.equal (Dict.isEmpty Dict.empty) xBool
           , test "you can also check if a key is present in the dictionary"
                <| \() -> Expect.equal (Dict.member 1 <| Dict.singleton 1 "a") xBool
           , test "or get the value associated with the key"
                <| \() -> Expect.equal (Dict.get 1 <| Dict.singleton 1 "a") (Just xString)
           , test "a key-value pair can be added to the dictionary"
                <| \() -> Expect.equal (Dict.get 2 <| Dict.insert 2 "b" <| Dict.singleton 1 "a") (Just xString)
           , test "inserting can also overwrite the value associated with a key"
                <| \() -> Expect.equal (Dict.get 1 <| Dict.insert 1 "b" <| Dict.singleton 1 "a") (Just xString)
           , test "updating a value works similarly"
                <| \() -> Expect.equal (Dict.get 1 <| Dict.update 1 (\_ -> Just "b") <| Dict.singleton 1 "a") (Just xString)
           , test "but knows about the current value"
                <| \() -> Expect.equal (Dict.get 1 <| Dict.update 1 (\v -> (Maybe.withDefault "" v) ++ "b" |> Just) <| Dict.singleton 1 "a") (Just xString)
           , test "updating can add a new value"
                <| \() -> Expect.equal (Dict.get 2 <| Dict.update 2 (\_ -> Just "b") <| Dict.singleton 1 "a") (Just xString)
           , test "or even remove a value"
                <| \() -> Expect.equal (Dict.get 1 <| Dict.update 1 (\_ -> Nothing) <| Dict.singleton 1 "a") (Just xString)
           , test "of course there is a more direct way to remove a value too"
                <| \() -> Expect.equal (Dict.get 1 <| Dict.remove 1 <| Dict.singleton 1 "a") (Just xString)
           , test "you can get the list of keys"
                <| \() -> Expect.equal (Dict.keys <| Dict.singleton 1 "a") xList
           , test "or the list of values"
                <| \() -> Expect.equal (Dict.values <| Dict.singleton 1 "a") xList
           , test "you can get the union of two dictionaries"
                <| \() -> Expect.equal (Dict.values <| Dict.union (Dict.fromList [ ( 1, "a" ), ( 2, "b" ) ]) (Dict.fromList [ ( 2, "c" ), ( 3, "d" ) ])) xList
           , test "or the intersection"
                <| \() -> Expect.equal (Dict.values <| Dict.intersect (Dict.fromList [ ( 1, "a" ), ( 2, "b" ) ]) (Dict.fromList [ ( 2, "c" ), ( 3, "d" ) ])) xList
           , test "or the difference"
                <| \() -> Expect.equal (Dict.values <| Dict.diff (Dict.fromList [ ( 1, "a" ), ( 2, "b" ) ]) (Dict.fromList [ ( 2, "c" ), ( 3, "d" ) ])) xList
           , test "mapping works similarly as with lists"
                -- so does filter, foldl, foldr, partition
                <|
                    \() -> Expect.equal (Dict.values <| Dict.map (\k v -> v ++ "c") (Dict.fromList [ ( 1, "a" ), ( 2, "b" ) ])) xList
           ]
