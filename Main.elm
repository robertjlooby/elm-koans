module Main exposing (..)

import Expect
import Html exposing (Html)
import Process
import Task
import Test.Runner
import Utils.Suite
import Utils.Test as Test


type alias Model =
    { finished : List (List String)
    , failure : Maybe { given : Maybe String, message : String }
    , context : Test.Context
    }


type Msg
    = Step
    | Failure { given : Maybe String, message : String }


init : ( Model, Cmd Msg )
init =
    let
        testContext =
            Test.flatten Utils.Suite.koans

        step =
            Task.succeed Step
    in
    ( Model [] Nothing testContext, Task.perform identity step )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case ( msg, model.context ) of
        ( Step, [] ) ->
            ( model, Cmd.none )

        ( Step, ( labels, run ) :: rest ) ->
            ( stepModel labels rest model, stepCmd run )

        ( Failure error, _ ) ->
            ( { model | failure = Just error }, Cmd.none )


stepModel : List String -> Test.Context -> Model -> Model
stepModel labels context model =
    { model | finished = labels :: model.finished, context = context }


stepCmd : (() -> Expect.Expectation) -> Cmd Msg
stepCmd run =
    let
        toMsg =
            Test.Runner.getFailure
                >> Maybe.map Failure
                >> Maybe.withDefault Step
    in
    Process.sleep 0
        |> Task.perform (run >> toMsg)


view : Model -> Html Msg
view model =
    case ( model.failure, model.finished ) of
        ( Just error, _ ) ->
            Html.text <|
                "TEST FAILED\n"
                    ++ viewGiven error
                    ++ error.message

        ( Nothing, current :: previous ) ->
            Html.text <|
                "RUNNING... "
                    ++ String.join " in " current

        ( Nothing, [] ) ->
            Html.text
                "WAITING..."


viewGiven : { a | given : Maybe String } -> String
viewGiven { given } =
    case given of
        Just x ->
            "GIVEN: " ++ x ++ "\n"

        Nothing ->
            ""


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }
