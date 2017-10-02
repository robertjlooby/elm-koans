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
    , final : Final
    }


type Final
    = InProgress
    | Finished
    | Failed KoansTest.Failure


type Msg
    = Step
    | Fail KoansTest.Failure


init : ( Model, Cmd Msg )
init =
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
        [ style
            [ ( "max-width", "960px" )
            , ( "font-family", fonts )
            , ( "margin", "0 auto" )
            ]
        ]
        [ viewHeader (floatLength model.upcoming) (floatLength model.seen)
        , viewRunner model.final model.seen
        ]


viewRunner : Final -> List KoansTest.Event -> Html msg
viewRunner final seen =
    pre
        [ style
            [ ( "background-color", "#EEEEEE" )
            , ( "border-radius", "1px" )
            , ( "line-height", "1.75em" )
            , ( "padding", "3em" )
            ]
        ]
        (terminalText noBreak seen ++ viewFinal final)


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


viewFinal : Final -> List (Html msg)
viewFinal final =
    case final of
        InProgress ->
            [ node "cursor"
                [ style
                    [ ( "animation", "1s blink ease infinite" )
                    , ( "background-color", "black" )
                    ]
                , title
                    "Fill in the next blank to continue."
                ]
                [ text " "
                ]
            ]

        Finished ->
            [ text "🎉"
            , b
                [ style [ ( "color", "#2AA198" ) ]
                ]
                [ text "\n\nCONGRATULATIONS - You're all done!"
                ]
            ]

        Failed { given, message } ->
            [ b
                [ style [ ( "color", "#D5200C" ) ]
                ]
                [ text "✗\n\n"
                , text <|
                    Maybe.withDefault message <|
                        Maybe.map (\arg -> "GIVEN: " ++ arg ++ "\n" ++ message) given
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


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , update = update
        , view = view
        , subscriptions = \_ -> Sub.none
        }
