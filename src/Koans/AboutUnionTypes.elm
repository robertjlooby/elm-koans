module AboutUnionTypes exposing (testSuite)

import Assert
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
        [ test "simple types are similar to enums in other languages"
            <| \() -> Assert.equal C xNucleotide
        , test "more complex types can be built with a 'tag' and additional data"
            <| \() -> Assert.equal (Base C) (Base xNucleotide)
        , test "all types in the union type are the same type"
            <| \() -> Assert.equal (Base A) (Strand [ A, T, C, G ])
        , test "case statements may be used to extract the data from the type"
            <| case Base A of
                Strand nucleotides ->
                    \() -> Assert.equal nucleotides [ xNucleotide ]

                Base nucleotide ->
                    \() -> Assert.equal nucleotide xNucleotide
        ]
