module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import PathToEnlightenment
import Process
import Task
import Utils.Test as KoansTest


-- STATE


type alias Model =
    { seen : List KoansTest.Event
    , upcoming : List KoansTest.Event
    , failure : Maybe KoansTest.Failure
    }


type Msg
    = Step
    | Failure KoansTest.Failure


init : ( Model, Cmd Msg )
init =
    let
        events =
            KoansTest.asStream PathToEnlightenment.koans
    in
    ( Model [] events Nothing, step )



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case ( msg, model.upcoming ) of
        ( Failure error, _ ) ->
            ( { model | failure = Just error }, Cmd.none )

        ( Step, [] ) ->
            ( model, Cmd.none )

        ( Step, event :: rest ) ->
            ( { model | upcoming = rest, seen = model.seen ++ [ event ] }, attempt event )


attempt : KoansTest.Event -> Cmd Msg
attempt event =
    case event of
        KoansTest.Section _ ->
            step

        KoansTest.Run _ thunk ->
            let
                toMsg =
                    thunk
                        >> Maybe.map Failure
                        >> Maybe.withDefault Step
            in
            Process.sleep 0
                |> Task.perform toMsg


step : Cmd Msg
step =
    Task.perform identity (Task.succeed Step)



-- VIEW


view : Model -> Html msg
view model =
    div
        [ style
            [ ( "max-width", "960px" )
            , ( "font-family", fonts )
            , ( "margin", "0 auto" )
            ]
        ]
        [ viewHeader (floatLength model.upcoming) (floatLength model.seen)
        , viewDescription (List.isEmpty model.upcoming) model.failure model.seen
        ]


viewDescription : Bool -> Maybe KoansTest.Failure -> List KoansTest.Event -> Html msg
viewDescription finished failure seen =
    pre
        [ style
            [ ( "background-color", "#EEEEEE" )
            , ( "border-radius", "1px" )
            , ( "line-height", "1.75em" )
            , ( "padding", "1em 3em" )
            ]
        ]
    <|
        case failure of
            Just { given, message } ->
                [ text "WHOA A FAILURE!"
                ]

            Nothing ->
                if finished then
                    [ b [] [ text "CONGRATULATIONS!" ]
                    , text " You're all done 🎉"
                    ]
                else
                    terminalText seen
                        |> List.intersperse (text "\n")


viewHeader : Float -> Float -> Html msg
viewHeader numRemaining numSeen =
    div
        [ style
            [ ( "display", "flex" )
            , ( "flex-direction", "row" )
            , ( "justify-content", "space-between" )
            , ( "align-items", "center" )
            ]
        ]
        [ h1
            []
            [ text "The Elm Koans" ]
        , progress
            [ value (toString numSeen)
            , Html.Attributes.max (toString (numSeen + numRemaining))
            ]
            []
        ]


terminalText : List KoansTest.Event -> List (Html msg)
terminalText events =
    case events of
        [] ->
            []

        (KoansTest.Section description) :: rest ->
            b
                []
                [ text ("\n-- " ++ String.toUpper description ++ "\n")
                ]
                :: terminalText rest

        (KoansTest.Run description _) :: [] ->
            b
                []
                [ text (description ++ " ...\n\n")
                ]
                :: []

        (KoansTest.Run description _) :: rest ->
            text (description ++ " ✔") :: terminalText rest


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
