module Koans21AboutPatternMatching exposing (testSuite)

import Expect
import Utils.Blank exposing (..)
import Utils.Test exposing (describe, test)


type Vehicle
    = Car String -- license plate
    | Motorbike String -- license plate
    | Bycicle


type alias Person =
    { firstname : String
    , surname : String
    }


type alias Company =
    { name : String
    , taxId : String
    }


type SalesRecord
    = SoldToPerson Vehicle Person
    | SoldToCompany Vehicle Company


testSuite =
    describe "About PatternMatching"
        [ test "variables we do not care about are marked with wildcard notation '_'" <|
            \() ->
                let
                    realAnswerTo : a -> Int
                    realAnswerTo _ =
                        42
                in
                x____replace me____x
                    |> Expect.equal (realAnswerTo [ "life", "universe", "everything" ])
        , test "integers can be matched (floats are not recommended)" <|
            \() ->
                let
                    isZero : Int -> Bool
                    isZero i =
                        case i of
                            0 ->
                                True

                            _ ->
                                False
                in
                x____replace me____x
                    |> Expect.equal (isZero -1)
        , test "strings can be matched" <|
            \() ->
                let
                    isCool : String -> Bool
                    isCool s =
                        case s of
                            "cool" ->
                                True

                            _ ->
                                False
                in
                x____replace me____x
                    |> Expect.equal (isCool "cool")
        , test
            "list head can be matched separately from the rest"
          <|
            \() ->
                let
                    sizeOfList : List a -> Int
                    sizeOfList list =
                        case list of
                            head :: rest ->
                                1 + sizeOfList rest

                            [] ->
                                0
                in
                x____replace me____x
                    |> Expect.equal (sizeOfList [ 1, 2 ])
        , test "Union types can be pattern matched" <|
            \() ->
                let
                    licensePlate : Vehicle -> Maybe String
                    licensePlate vehicle =
                        case vehicle of
                            Car lp ->
                                Just lp

                            Motorbike lp ->
                                Just lp

                            Bycicle ->
                                Nothing
                in
                x____replace me____x
                    |> Expect.equal (licensePlate (Motorbike "MZ/X"))
        , test "Records can be pattern matched" <|
            \() ->
                let
                    directoryName : Person -> String
                    directoryName { firstname, surname } =
                        surname ++ ", " ++ firstname
                in
                x____replace me____x
                    |> Expect.equal (directoryName { firstname = "Anna", surname = "Olla" })
        , test "more complex structures can also be matched" <|
            \() ->
                let
                    salesRecordPrintout : SalesRecord -> String
                    salesRecordPrintout salesRecord =
                        case salesRecord of
                            SoldToPerson (Car licensePlate) { firstname, surname } ->
                                "Car: " ++ licensePlate ++ " to " ++ surname ++ ", " ++ firstname

                            _ ->
                                "do not care"
                in
                x____replace me____x
                    |> Expect.equal (salesRecordPrintout <| SoldToPerson (Car "ABC-123") { firstname = "John", surname = "Doe" })
        ]
