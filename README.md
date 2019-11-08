# Elm Koans

## Instructions
* Get [Elm](http://elm-lang.org/install) version 0.19.1
  * Make sure you have version 0.19.1 with `elm --version`
* Clone this repo
* Run the tests using one of the following methods:
  * **In the browser with automatic refreshing (preferred)**
    * `npm install -g elm-live`
    * `elm-live Main.elm`
    * Visit [http://localhost:8000](http://localhost:8000)
  * **In the browser (requires refreshing after editing files)**
    * `elm reactor`
    * Visit [http://localhost:8000/Main.elm](http://localhost:8000/Main.elm)
  * **In the terminal**
    * `npm install -g elm-test`
    * `elm-test`
      * Note this will produce a LOT of output, so you'll probably want to `elm-test | head -n20` to just see the first couple failing tests
* Use any editor to change the source files and make the tests pass. If you're not using `elm-live` you'll need to refresh your browser after making changes.
  * Placeholder values are denoted as `x____replace me____x` and will need to be replaced to make the tests pass
