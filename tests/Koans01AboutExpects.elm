module Koans01AboutExpects exposing (testSuite)

-- Single line comments begin with "--"
{- Multi line comments
   begin with "{-" and end with "-}"
-}
-- modules are named the same as their file name
-- and list what members they publicly expose
-- Other module names are referenced with `import`s

import Expect


-- members from other modules can be individually exposed within this module

import Utils.Test exposing (describe, test)


-- or you may expose all the members of another module

import Utils.Blank exposing (..)


testSuite =
    -- `describe` takes the suite description and a list of `Test`s
    describe "About Expects"
        [ -- `test` takes the test description and a function that returns an
          -- `Expectation` when evaluated with the unit tuple `()`
          test "Expect.true tests for a true value"
            (\() -> Expect.true "Should be True" (x____replace me____x))
          -- `<|` calls the function on the left with the argument on the right
          --  and can be used to avoid some parenthesis
        , test "Expect.equal tests for equality" <|
            \() -> Expect.equal True (x____replace me____x)
          -- `|>` calls the function on the right with the argument on the left
          -- and can be used to "pipeline" values through a series of functions
        , test "Expect.notEqual tests for inequality" <|
            \() ->
                x____replace me____x
                    |> Expect.notEqual False
        ]
