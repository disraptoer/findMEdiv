module Main exposing (..)

import Html exposing (Html, text, div, img, button)
import Html.Attributes exposing (src, id)
import Html.Events exposing (onClick)


---- MODEL ----


type alias Model =
    { show : Bool }


init : ( Model, Cmd Msg )
init =
    ( { show = True }, Cmd.none )



---- UPDATE ----


type Msg
    = Fire


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Fire ->
            ( { model | show = not model.show }, Cmd.none )



---- VIEW ----


view : Model -> Html Msg
view model =
    case model.show of
        True ->
            div []
                [ div
                    []
                    [ img [ src "/logo.svg" ] []
                    , div [] [ text "One logo" ]
                    ]
                , div
                    [ id "editor" ]
                    [ img [ src "/logo.svg" ] []
                    , div [] [ text "I may or may not be here" ]
                    ]
                , button [ onClick Fire ] [ text "hideONe" ]
                ]

        False ->
            div []
                [ div
                    []
                    [ img [ src "/logo.svg" ] []
                    , div [] [ text "One logo" ]
                    ]
                , button [ onClick Fire ] [ text "hideONe" ]
                ]



---- PROGRAM ----


main : Program Never Model Msg
main =
    Html.program
        { view = view
        , init = init
        , update = update
        , subscriptions = always Sub.none
        }
