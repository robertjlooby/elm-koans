module Main exposing (..)

import Expect exposing (Expectation)
import Html exposing (Html)
import PathToEnlightenment
import Process
import Task
import Test.Runner as ElmTestRunner
import Utils.Test as KoansTest


type alias Model =
    { finished : List (List String)
    , failure : Maybe { given : Maybe String, message : String }
    , context : KoansTest.Context
    }


type Msg
    = Step
    | Failure { given : Maybe String, message : String }


init : ( Model, Cmd Msg )
init =
    let
        testContext =
            KoansTest.flatten PathToEnlightenment.koans

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


stepModel : List String -> KoansTest.Context -> Model -> Model
stepModel labels context model =
    { model | finished = labels :: model.finished, context = context }


stepCmd : (() -> Expectation) -> Cmd Msg
stepCmd run =
    let
        toMsg =
            run
                >> ElmTestRunner.getFailure
                >> Maybe.map Failure
                >> Maybe.withDefault Step
    in
    Process.sleep 0
        |> Task.perform toMsg


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
