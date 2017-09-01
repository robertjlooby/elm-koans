module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import PathToEnlightenment
import Process
import Task
import Utils.Test as KoansTest


-- MODEL


type alias Model =
    { finished : List (List String)
    , failure : Maybe KoansTest.Failure
    , context : KoansTest.Context
    }


type Msg
    = Step
    | Failure KoansTest.Failure


init : ( Model, Cmd Msg )
init =
    let
        testContext =
            KoansTest.flatten PathToEnlightenment.koans

        step =
            Task.succeed Step
    in
    ( Model [] Nothing testContext, Task.perform identity step )



-- UPDATE


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


stepCmd : (() -> Maybe KoansTest.Failure) -> Cmd Msg
stepCmd run =
    let
        toMsg =
            run
                >> Maybe.map Failure
                >> Maybe.withDefault Step
    in
    Process.sleep 0
        |> Task.perform toMsg



-- VIEW


view : Model -> Html msg
view model =
    div
        [ style
            [ ( "backgroundColor", "#293c4b" )
            , ( "color", "#FFFFFF" )
            , ( "min-width", "100vw" )
            , ( "min-height", "100vh" )
            , ( "display", "flex" )
            , ( "flex-direction", "column" )
            , ( "justify-content", "center" )
            , ( "text-align", "center" )
            , ( "font-family", fonts )
            , ( "font-size", "120%" )
            ]
        ]
        [ h1
            []
            [ text "The Elm Koans" ]
        , viewProgress
            (floatLength model.context)
            (floatLength model.finished)
        , div
            []
            (viewDescription model)
        ]


viewDescription : Model -> List (Html msg)
viewDescription model =
    case ( model.failure, List.head model.finished ) of
        ( Just { given, message }, _ ) ->
            [ text "TODO"
            ]

        ( _, Just (description :: parent :: _) ) ->
            [ h3 [] [ text parent ]
            , pre [] [ text description ]
            ]

        ( Nothing, _ ) ->
            []


viewProgress : Float -> Float -> Html msg
viewProgress numRemaining numCompleted =
    let
        dimmension =
            "0.3em"

        progressPercentage =
            100 * numCompleted / (numCompleted + numRemaining)
    in
    div
        [ style
            [ ( "backgroundColor", "#FFFFFF" )
            , ( "height", dimmension )
            , ( "width", toString progressPercentage ++ "%" )
            , ( "min-width", dimmension )
            , ( "margin", "0 auto" )
            , ( "border-radius", dimmension )
            ]
        ]
        []


fonts : String
fonts =
    String.join ","
        [ "'Source Sans Pro'"
        , "'Trebuchet MS'"
        , "'Lucida Grande'"
        , "'Bitstream Vera Sans'"
        , "'Helvetica Neue'"
        , "sans-serif"
        ]


floatLength : List a -> Float
floatLength =
    toFloat << List.length



-- MAIN


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , update = update
        , view = view
        , subscriptions = \_ -> Sub.none
        }
