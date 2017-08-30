module Koans12AboutDictionaries exposing (testSuite)

import Expect
import Dict
import Utils.Test exposing (describe, test)
import Utils.Blank exposing (..)


testSuite =
    describe "About Dictionaries" <|
        [ test "dictionaries can be empty" <|
            \() ->
                x____replace me____x
                    |> Expect.equal (Dict.size Dict.empty)
        , test "or initialized with a single key-value pair" <|
            \() ->
                x____replace me____x
                    |> Expect.equal (Dict.size <| Dict.singleton 1 "a")
        , test "or from a list of key-value pairs" <|
            \() ->
                x____replace me____x
                    |> Expect.equal (Dict.size <| Dict.fromList [ ( 1, "a" ), ( 2, "b" ) ])
        , test "they can also be converted back to a list" <|
            \() ->
                x____replace me____x
                    |> Expect.equal (Dict.toList <| Dict.fromList [ ( 1, "a" ), ( 2, "b" ) ])
        , test "checking for an empty dictionary is easy" <|
            \() ->
                x____replace me____x
                    |> Expect.equal (Dict.isEmpty Dict.empty)
        , test "you can also check if a key is present in the dictionary" <|
            \() ->
                x____replace me____x
                    |> Expect.equal (Dict.member 1 <| Dict.singleton 1 "a")
        , test "or get the value associated with the key" <|
            \() ->
                Just (x____replace me____x)
                    |> Expect.equal (Dict.get 1 <| Dict.singleton 1 "a")
        , test "a key-value pair can be added to the dictionary" <|
            \() ->
                Just (x____replace me____x)
                    |> Expect.equal (Dict.get 2 <| Dict.insert 2 "b" <| Dict.singleton 1 "a")
        , test "inserting can also overwrite the value associated with a key" <|
            \() ->
                Just (x____replace me____x)
                    |> Expect.equal (Dict.get 1 <| Dict.insert 1 "b" <| Dict.singleton 1 "a")
        , test "updating a value works similarly" <|
            \() ->
                Just (x____replace me____x)
                    |> Expect.equal (Dict.get 1 <| Dict.update 1 (\_ -> Just "b") <| Dict.singleton 1 "a")
        , test "but knows about the current value" <|
            \() ->
                Just (x____replace me____x)
                    |> Expect.equal (Dict.get 1 <| Dict.update 1 (\v -> (Maybe.withDefault "" v) ++ "b" |> Just) <| Dict.singleton 1 "a")
        , test "updating can add a new value" <|
            \() ->
                Just (x____replace me____x)
                    |> Expect.equal (Dict.get 2 <| Dict.update 2 (\_ -> Just "b") <| Dict.singleton 1 "a")
        , test "or even remove a value" <|
            \() ->
                Just (x____replace me____x)
                    |> Expect.equal (Dict.get 1 <| Dict.update 1 (\_ -> Nothing) <| Dict.singleton 1 "a")
        , test "of course there is a more direct way to remove a value too" <|
            \() ->
                Just (x____replace me____x)
                    |> Expect.equal (Dict.get 1 <| Dict.remove 1 <| Dict.singleton 1 "a")
        , test "you can get the list of keys" <|
            \() ->
                x____replace me____x
                    |> Expect.equal (Dict.keys <| Dict.singleton 1 "a")
        , test "or the list of values" <|
            \() ->
                x____replace me____x
                    |> Expect.equal (Dict.values <| Dict.singleton 1 "a")
        , test "you can get the union of two dictionaries" <|
            \() ->
                x____replace me____x
                    |> Expect.equal (Dict.values <| Dict.union (Dict.fromList [ ( 1, "a" ), ( 2, "b" ) ]) (Dict.fromList [ ( 2, "c" ), ( 3, "d" ) ]))
        , test "or the intersection" <|
            \() ->
                x____replace me____x
                    |> Expect.equal (Dict.values <| Dict.intersect (Dict.fromList [ ( 1, "a" ), ( 2, "b" ) ]) (Dict.fromList [ ( 2, "c" ), ( 3, "d" ) ]))
        , test "or the difference" <|
            \() ->
                x____replace me____x
                    |> Expect.equal (Dict.values <| Dict.diff (Dict.fromList [ ( 1, "a" ), ( 2, "b" ) ]) (Dict.fromList [ ( 2, "c" ), ( 3, "d" ) ]))
        , test "mapping works similarly as with lists" <|
            -- so does filter, foldl, foldr, partition
            \() ->
                x____replace me____x
                    |> Expect.equal (Dict.values <| Dict.map (\k v -> v ++ "c") (Dict.fromList [ ( 1, "a" ), ( 2, "b" ) ]))
        ]
