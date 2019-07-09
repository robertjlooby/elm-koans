module Koans20AboutTypeVariables exposing (testSuite)

import Expect
import Utils.Blank exposing (..)
import Utils.Test exposing (describe, test)


{-| Function splitList works for lists of any item type.

The 'a' is a _type variable_. Type variables start with
lowercase characters.

There are, however, some reserved type variable names,
such as 'number', 'appendable', 'comparable' and 'compappend',
for _constrained type variables_.

-}
splitList : List a -> ( List a, List a )
splitList list =
    case list of
        [] ->
            ( [], [] )

        head :: rest ->
            ( [ head ], rest )


{-| Constrained type variable 'number' permits Int and Float.
-}
squareNumber : number -> number
squareNumber n =
    n * n


{-| Constrained type variable 'appendable' permits List a and String.
-}
doubleIt : appendable -> appendable
doubleIt a =
    a ++ a


{-| Constrained type variable 'comparable' permits Int, Float, Char, String
and lists/tuples of comparable values.
-}
lessThan : comparable -> comparable -> Bool
lessThan first second =
    first < second


{-| Constrained type variable 'compappend' permits String and List comparable.
-}
doubleTheFirstIfLess : compappend -> compappend -> compappend
doubleTheFirstIfLess first second =
    if first < second then
        first ++ first

    else
        first


testSuite =
    describe "About TypeVariables"
        [ test "Functions can have type variables (full words starting with lower case letters)" <|
            \() ->
                x____replace me____x
                    |> Expect.equal (splitList [ 1, 2, 3 ])
        , test "and then those functions can be applied to other types as well" <|
            \() ->
                x____replace me____x
                    |> Expect.equal (splitList [ "a", "b", "c" ])
        , test "constrained type variable 'number' is for functions using math operators" <|
            \() ->
                x____replace me____x
                    |> Expect.equal
                        ( squareNumber 2
                        , squareNumber 2.0
                        )
        , test "constrained type variable 'appendable' is for functions using the append operator" <|
            \() ->
                x____replace me____x
                    |> Expect.equal
                        ( doubleIt [ 1, 2 ]
                        , doubleIt "abc"
                        )
        , test "constrained type variable 'comparable' is for functions using comparision operators" <|
            \() ->
                x____replace me____x
                    |> Expect.equal
                        ( lessThan 'b' 'a'
                        , lessThan [ "hello", "w0rld" ] [ "hello", "world" ]
                        , lessThan ( 1.2, 3.1 ) ( 2.1, 1.3 )
                        )
        , test "constained type variable 'compappend' is for functions taking args that are both comparable and appendable" <|
            \() ->
                x____replace me____x
                    |> Expect.equal
                        ( doubleTheFirstIfLess "w0rld" "world"
                        , doubleTheFirstIfLess [ 1, 2 ] [ 0, 1 ]
                        )
        ]
