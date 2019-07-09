module Main exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import PathToEnlightenment
import Process
import Task
import Utils.Test as KoansTest
import Test.Runner.Failure exposing (format)



-- STATE


type alias Model =
    { seen : List KoansTest.Event
    , upcoming : List KoansTest.Event
    , final : Final
    }


type Final
    = InProgress
    | Finished
    | Failed KoansTest.Failure


type Msg
    = Step
    | Fail KoansTest.Failure


init : () -> ( Model, Cmd Msg )
init _ =
    let
        events =
            KoansTest.asStream PathToEnlightenment.koans
    in
    ( Model [] events InProgress, step )



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case ( msg, model.upcoming ) of
        ( Fail error, _ ) ->
            ( { model | final = Failed error }, Cmd.none )

        ( Step, [] ) ->
            ( { model | final = Finished }, Cmd.none )

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
                        >> Maybe.map Fail
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
        [ style "max-width" "960px"
        , style "font-family" fonts
        , style "margin" "0 auto"
        ]
        [ viewHeader (floatLength model.upcoming) (floatLength model.seen)
        , viewRunner model.final model.seen
        ]


viewRunner : Final -> List KoansTest.Event -> Html msg
viewRunner final seen =
    pre
        [ style "border-radius" "1px"
        , style "line-height" "1.75em"
        , style "padding" "3em"
        ]
        (terminalText noBreak seen ++ viewFinal final)


viewHeader : Float -> Float -> Html msg
viewHeader numRemaining numSeen =
    div
        [ style "display" "flex"
        , style "flex-direction" "row"
        , style "justify-content" "space-between"
        , style "align-items" "center"
        ]
        [ h1
            []
            [ text "The Elm Koans" ]
        , progress
            [ value (String.fromFloat numSeen)
            , Html.Attributes.max (String.fromFloat (numSeen + numRemaining))
            ]
            []
        ]


viewFinal : Final -> List (Html msg)
viewFinal final =
    case final of
        InProgress ->
            [ node "cursor"
                [ style "animation" "1s blink ease infinite"
                , style "background-color" "black"
                , title
                    "Fill in the next blank to continue."
                ]
                [ text " "
                ]
            ]

        Finished ->
            [ text "🎉"
            , b
                [ style "color" "#2AA198" ]
                [ text "\n\nCONGRATULATIONS - You're all done!"
                ]
            ]

        Failed { given, description, reason } ->
            let
                failureText =
                    case given of
                        Nothing -> format description reason
                        Just x  -> "GIVEN: " ++ x ++ "\n" ++ format description reason
            in
                [ b [ style "color" "#D5200C" ]
                    [ text "✗\n\n"
                    , text failureText
                    ]
                ]


terminalText : String -> List KoansTest.Event -> List (Html msg)
terminalText sectionBreak events =
    case events of
        [] ->
            []

        (KoansTest.Section description) :: rest ->
            b
                []
                [ text
                    (sectionBreak
                        ++ "-- "
                        ++ String.toUpper description
                        ++ "\n"
                    )
                ]
                :: terminalText largeBreak rest

        (KoansTest.Run description _) :: [] ->
            b
                []
                [ text ("\n" ++ description ++ " ")
                ]
                :: []

        (KoansTest.Run description _) :: rest ->
            text ("\n" ++ description ++ " ✔")
                :: terminalText largeBreak rest


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


noBreak : String
noBreak =
    ""


largeBreak : String
largeBreak =
    "\n\n\n"


floatLength : List a -> Float
floatLength =
    toFloat << List.length



-- MAIN


main : Program () Model Msg
main =
    Browser.element
        { init = init
        , update = update
        , view = view
        , subscriptions = \_ -> Sub.none
        }
