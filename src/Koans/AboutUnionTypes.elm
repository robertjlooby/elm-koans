module AboutUnionTypes exposing (testSuite)

import Expect
import Test exposing (describe, test)
import TestHelpers exposing (..)


type Nucleotide
    = A
    | C
    | G
    | T


xNucleotide =
    G


type DNA
    = Base Nucleotide
    | Strand (List Nucleotide)


testSuite =
    describe "About UnionTypes"
        [ test "simple types are similar to enums in other languages" <|
            \() ->
                xNucleotide
                    |> Expect.equal C
        , test "more complex types can be built with a 'tag' and additional data" <|
            \() ->
                (Base xNucleotide)
                    |> Expect.equal (Base C)
        , test "all types in the union type are the same type" <|
            \() ->
                (Strand [ A, T, C, G ])
                    |> Expect.equal (Base A)
        , test "case statements may be used to extract the data from the type" <|
            case Base A of
                Strand nucleotides ->
                    \() ->
                        [ xNucleotide ]
                            |> Expect.equal nucleotides

                Base nucleotide ->
                    \() ->
                        xNucleotide
                            |> Expect.equal nucleotide
        ]
