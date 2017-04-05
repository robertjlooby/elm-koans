# Elm Koans

## Instructions
* Get [Elm](http://elm-lang.org/install) version 0.18
* Clone this repo
* Install the dependencies
  * run `elm package install` from inside the cloned directory
* Run the tests
  * Run `elm reactor` and open a browser to [http://localhost:8000/src/Koans.elm](http://localhost:8000/src/Koans.elm)
  OR
  * `npm install -g elm-test`
  * `elm-test src/KoansNode.elm`
    * Note this will produce a LOT of output, so you'll probably want to `elm-test src/KoansNode.elm | head -n20` to just see the first couple failing tests
* Use any editor to change the source files, refresh the browser page, and make the tests pass
  * Placeholder values are denoted as `xValueType` and will need to be replaced to make the tests pass
