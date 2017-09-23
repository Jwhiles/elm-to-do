module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, onClick)


main =
    Html.beginnerProgram
        { model = model
        , view = view
        , update = update
        }



-- Model


type alias Todo =
    { text : String
    , done : Bool
    }


type alias Model =
    { todos : List Todo
    , active : Int
    , text : String
    }


model : Model
model =
    { todos = []
    , active = 0
    , text = ""
    }



-- Update


type Msg
    = Default String
    | Add


update : Msg -> Model -> Model
update msg model =
    case msg of
        Default text ->
            { model | text = text }

        Add ->
            { model | todos = model.todos ++ [ { text = model.text, done = False } ] }



-- { model | todos = [{ text = text, done = False }]}
-- view


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text "todo" ]
        , input [ type_ "text", placeholder "todo", onInput Default ] []
        , button [ onClick Add ] [ text "add" ]
        , div [] <| List.map renderItem model.todos
        ]


renderItem : Todo -> Html Msg
renderItem todo =
    div [] [ text todo.text ]
