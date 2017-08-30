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
    ( Model [] Nothing (Test.flatten Utils.Suite.koans)
    , Task.perform identity (Task.succeed Step)
    )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case ( msg, model.context ) of
        ( Step, [] ) ->
            ( model, Cmd.none )

        ( Step, ( labels, run ) :: rest ) ->
            let
                newModel =
                    { model
                        | finished = labels :: model.finished
                        , context = rest
                    }
            in
            ( newModel, continue run )

        ( Failure details, _ ) ->
            ( { model | failure = Just details }, Cmd.none )


continue : (() -> Expect.Expectation) -> Cmd Msg
continue run =
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
        ( Just { given, message }, _ ) ->
            Html.text <|
                "TEST FAILED\nGiven: "
                    ++ Maybe.withDefault "nothing" given
                    ++ "\n"
                    ++ message

        ( Nothing, current :: previous ) ->
            Html.text <|
                "RUNNING... "
                    ++ String.join " in " current

        ( Nothing, [] ) ->
            Html.text
                "WAITING..."


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
