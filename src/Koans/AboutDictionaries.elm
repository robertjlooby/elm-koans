module AboutDictionaries exposing (testSuite)

import Expect
import Dict
import Test exposing (describe, test)
import TestHelpers exposing (..)


testSuite =
    describe "About Dictionaries" <|
        [ test "dictionaries can be empty" <|
            \() ->
                xNum
                    |> Expect.equal (Dict.size Dict.empty)
        , test "or initialized with a single key-value pair" <|
            \() ->
                xNum
                    |> Expect.equal (Dict.size <| Dict.singleton 1 "a")
        , test "or from a list of key-value pairs" <|
            \() ->
                xNum
                    |> Expect.equal (Dict.size <| Dict.fromList [ ( 1, "a" ), ( 2, "b" ) ])
        , test "they can also be converted back to a list" <|
            \() ->
                xList
                    |> Expect.equal (Dict.toList <| Dict.fromList [ ( 1, "a" ), ( 2, "b" ) ])
        , test "checking for an empty dictionary is easy" <|
            \() ->
                xBool
                    |> Expect.equal (Dict.isEmpty Dict.empty)
        , test "you can also check if a key is present in the dictionary" <|
            \() ->
                xBool
                    |> Expect.equal (Dict.member 1 <| Dict.singleton 1 "a")
        , test "or get the value associated with the key" <|
            \() ->
                (Just xString)
                    |> Expect.equal (Dict.get 1 <| Dict.singleton 1 "a")
        , test "a key-value pair can be added to the dictionary" <|
            \() ->
                (Just xString)
                    |> Expect.equal (Dict.get 2 <| Dict.insert 2 "b" <| Dict.singleton 1 "a")
        , test "inserting can also overwrite the value associated with a key" <|
            \() ->
                (Just xString)
                    |> Expect.equal (Dict.get 1 <| Dict.insert 1 "b" <| Dict.singleton 1 "a")
        , test "updating a value works similarly" <|
            \() ->
                (Just xString)
                    |> Expect.equal (Dict.get 1 <| Dict.update 1 (\_ -> Just "b") <| Dict.singleton 1 "a")
        , test "but knows about the current value" <|
            \() ->
                (Just xString)
                    |> Expect.equal (Dict.get 1 <| Dict.update 1 (\v -> (Maybe.withDefault "" v) ++ "b" |> Just) <| Dict.singleton 1 "a")
        , test "updating can add a new value" <|
            \() ->
                (Just xString)
                    |> Expect.equal (Dict.get 2 <| Dict.update 2 (\_ -> Just "b") <| Dict.singleton 1 "a")
        , test "or even remove a value" <|
            \() ->
                (Just xString)
                    |> Expect.equal (Dict.get 1 <| Dict.update 1 (\_ -> Nothing) <| Dict.singleton 1 "a")
        , test "of course there is a more direct way to remove a value too" <|
            \() ->
                (Just xString)
                    |> Expect.equal (Dict.get 1 <| Dict.remove 1 <| Dict.singleton 1 "a")
        , test "you can get the list of keys" <|
            \() ->
                xList
                    |> Expect.equal (Dict.keys <| Dict.singleton 1 "a")
        , test "or the list of values" <|
            \() ->
                xList
                    |> Expect.equal (Dict.values <| Dict.singleton 1 "a")
        , test "you can get the union of two dictionaries" <|
            \() ->
                xList
                    |> Expect.equal (Dict.values <| Dict.union (Dict.fromList [ ( 1, "a" ), ( 2, "b" ) ]) (Dict.fromList [ ( 2, "c" ), ( 3, "d" ) ]))
        , test "or the intersection" <|
            \() ->
                xList
                    |> Expect.equal (Dict.values <| Dict.intersect (Dict.fromList [ ( 1, "a" ), ( 2, "b" ) ]) (Dict.fromList [ ( 2, "c" ), ( 3, "d" ) ]))
        , test "or the difference" <|
            \() ->
                xList
                    |> Expect.equal (Dict.values <| Dict.diff (Dict.fromList [ ( 1, "a" ), ( 2, "b" ) ]) (Dict.fromList [ ( 2, "c" ), ( 3, "d" ) ]))
        , test "mapping works similarly as with lists" <|
            -- so does filter, foldl, foldr, partition
            \() ->
                xList
                    |> Expect.equal (Dict.values <| Dict.map (\k v -> v ++ "c") (Dict.fromList [ ( 1, "a" ), ( 2, "b" ) ]))
        ]
