module Example exposing (main)

-- FontAwesome Pro users can also get pro icons with a custom build.
--import FontAwesome.Duotone as Duotone

import Browser
import FontAwesome.Attributes as Icon
import FontAwesome.Brands as Icon
import FontAwesome.Icon as Icon exposing (Icon)
import FontAwesome.Layering as Icon
import FontAwesome.Solid as Icon
import FontAwesome.Styles as Icon
import FontAwesome.Svg as SvgIcon
import FontAwesome.Transforms as Icon
import Html exposing (Html)
import Html.Attributes as HtmlA
import Random
import RandomIds
import Svg
import Svg.Attributes as SvgA
import Time



-- Simple Examples


simpleExamples =
    -- Some simple examples of rendering icons.
    exampleSection "Simple Examples"
        -- A simple icon can be rendered with Icon.view.
        [ Html.div []
            [ Icon.viewIcon Icon.arrowAltCircleRight
            , Html.text " Go!"
            ]

        -- We can apply FontAwesome styles to the icons.
        , Html.div []
            [ Icon.viewStyled [ Icon.spin ] Icon.spinner
            , Html.text " Loading..."
            ]

        -- Including stacking, although take a look further down for layering—it can do the same thing and a lot more!
        , Html.div [ Icon.stack, Icon.fa2x ]
            [ Icon.viewStyled [ Icon.stack1x ] Icon.camera
            , Icon.viewStyled [ Icon.stack2x, HtmlA.style "color" "Tomato" ] Icon.ban
            ]
        ]



-- Sizing Icons


sizes =
    [ Icon.xs, Icon.sm, Icon.lg, Icon.fa2x, Icon.fa3x, Icon.fa5x, Icon.fa7x, Icon.fa10x ]


stroopwafel size =
    Icon.stroopwafel |> Icon.present |> Icon.styled [ size ] |> Icon.view


sizingIcons =
    exampleSection "Sizing Icons" (sizes |> List.map stroopwafel)



-- Fixed Width Icons


menuItems =
    [ ( Icon.home, "Home" )
    , ( Icon.info, "Info" )
    , ( Icon.book, "Library" )
    , ( Icon.pencilAlt, "Applications" )
    , ( Icon.cog, "Settings" )
    ]


menuItem ( icon, text ) =
    Html.div []
        [ icon |> Icon.present |> Icon.styled [ Icon.fw, HtmlA.style "background" "MistyRose" ] |> Icon.view
        , Html.text " "
        , Html.text text
        ]


fixedWidthIcons =
    exampleSection "Fixed Width Icons"
        [ Html.div [ HtmlA.style "font-size" "2rem" ] (menuItems |> List.map menuItem) ]



-- Icons in a List.


listItems =
    [ ( Icon.checkSquare |> Icon.present |> Icon.view, "List icons can" )
    , ( Icon.checkSquare |> Icon.present |> Icon.view, "be used to" )
    , ( Icon.spinner |> Icon.present |> Icon.styled [ Icon.pulse ] |> Icon.view, "replace bullets" )
    , ( Icon.square |> Icon.present |> Icon.view, "in lists" )
    ]


listItem ( icon, text ) =
    Html.li [] [ Html.span [ Icon.li ] [ icon ], Html.text text ]


iconsInAList =
    exampleSection "Icons in a List" [ Html.ul [ Icon.ul ] (listItems |> List.map listItem) ]



-- Animating Icons


spinners =
    [ Icon.spinner, Icon.circleNotch, Icon.sync, Icon.cog, Icon.stroopwafel ]


animatingIcons =
    exampleSection "Animating Icons"
        [ Html.div [ Icon.fa3x ]
            [ Icon.spinner |> Icon.present |> Icon.styled [ Icon.pulse ] |> Icon.view
            , Html.span [] (spinners |> List.map (Icon.present >> Icon.styled [ Icon.spin ] >> Icon.view))
            ]
        ]



-- Layering, Text and Counters


layeringTextAndCounters =
    exampleSection "Layering, Text, and Counters"
        [ Html.div [ Icon.fa4x ]
            [ Icon.layers [ HtmlA.style "background" "MistyRose" ]
                [ Icon.circle |> Icon.present |> Icon.view
                , Icon.times |> Icon.present |> Icon.styled [ Icon.inverse ] |> Icon.transform [ Icon.shrink 6 ] |> Icon.view
                ]
            , Icon.layers [ HtmlA.style "background" "MistyRose" ]
                [ Icon.bookmark |> Icon.present |> Icon.view
                , Icon.heart
                    |> Icon.present
                    |> Icon.styled [ Icon.inverse, HtmlA.style "color" "Tomato" ]
                    |> Icon.transform [ Icon.shrink 10, Icon.up 2 ]
                    |> Icon.view
                ]
            , Icon.layers [ HtmlA.style "background" "MistyRose" ]
                [ Icon.play |> Icon.present |> Icon.transform [ Icon.rotate -90, Icon.grow 2 ] |> Icon.view
                , Icon.sun
                    |> Icon.present
                    |> Icon.styled [ Icon.inverse ]
                    |> Icon.transform [ Icon.shrink 10, Icon.up 2 ]
                    |> Icon.view
                , Icon.moon
                    |> Icon.present
                    |> Icon.styled [ Icon.inverse ]
                    |> Icon.transform [ Icon.shrink 11, Icon.down 4.2, Icon.left 4 ]
                    |> Icon.view
                , Icon.star
                    |> Icon.present
                    |> Icon.styled [ Icon.inverse ]
                    |> Icon.transform [ Icon.shrink 11, Icon.down 4.2, Icon.right 4 ]
                    |> Icon.view
                ]
            , Icon.layers [ HtmlA.style "background" "MistyRose" ]
                [ Icon.calendar |> Icon.present |> Icon.view
                , Icon.textTransformed [ Icon.inverse, HtmlA.style "font-weight" "900" ] [ Icon.shrink 8, Icon.down 3 ] "27"
                ]
            , Icon.layers [ HtmlA.style "background" "MistyRose" ]
                [ Icon.certificate |> Icon.present |> Icon.view
                , Icon.textTransformed [ Icon.inverse, HtmlA.style "font-weight" "900" ] [ Icon.shrink 11.5, Icon.rotate -30 ] "NEW"
                ]
            , Icon.layers [ HtmlA.style "background" "MistyRose" ]
                [ Icon.envelope |> Icon.present |> Icon.view
                , Icon.counter [ HtmlA.style "background" "Tomato" ] "1,419"
                ]
            ]
        ]



-- Masking


masking =
    exampleSection "Masking"
        [ Html.div [ Icon.fa4x, HtmlA.style "background" "MistyRose" ]
            [ Icon.pencilAlt
                |> Icon.present
                |> Icon.transform [ Icon.shrink 10, Icon.up 0.5 ]
                |> Icon.withId "comment"
                |> Icon.masked Icon.comment
                |> Icon.view
            , Icon.facebookF
                |> Icon.present
                |> Icon.transform [ Icon.shrink 3.5, Icon.down 1.6, Icon.right 1.25 ]
                |> Icon.withId "facebook"
                |> Icon.masked Icon.circle
                |> Icon.view
            , Icon.headphones
                |> Icon.present
                |> Icon.transform [ Icon.shrink 6 ]
                |> Icon.withId "headphones"
                |> Icon.masked Icon.square
                |> Icon.view
            , Icon.mask
                |> Icon.present
                |> Icon.transform [ Icon.shrink 3, Icon.up 1 ]
                |> Icon.withId "mask"
                |> Icon.masked Icon.circle
                |> Icon.view
            ]
        ]



-- Random Ids


randomIdAndIcon =
    Random.map2 (\id -> \icon -> ( id, icon ))
        RandomIds.randomId
        (Random.uniform Icon.car [ Icon.bullhorn, Icon.thumbsUp, Icon.signOutAlt, Icon.clock, Icon.questionCircle, Icon.chessBishop ])


randomise =
    Random.generate Change (Random.list 10 randomIdAndIcon)


randomIconWithId ( id, icon ) =
    icon
        |> Icon.present
        |> Icon.withId id
        |> Icon.titled id
        |> Icon.styled [ Icon.fw ]
        |> Icon.view


randomIds randomIcons =
    exampleSection "Random Ids" (randomIcons |> List.map randomIconWithId)



-- SVG


svgIcons =
    exampleSection "Icons in an existing SVG element."
        [ Svg.svg [ SvgA.viewBox "0 0 512 512", SvgA.style "width: 150px; height: 150px;" ]
            [ SvgIcon.viewIcon Icon.pencilAlt ]
        ]



-- If you have FontAwesome Pro, you can use the Duotone icons.
-- Note some workarounds are required as Elm doesn't properly support CSS custom properties.
-- https://github.com/elm/html/issues/177
--duotone =
--    exampleSection "Duotone"
--        [ Html.div [ Icon.fa3x ]
--            [ Duotone.camera |> Icon.viewIcon
--            , Duotone.camera |> Icon.viewStyled [ Icon.swapOpacity ]
--            , Duotone.fireAlt |> Icon.viewIcon
--            , Duotone.fireAlt |> Icon.viewStyled [ Icon.swapOpacity ]
--            , Duotone.busAlt |> Icon.viewIcon
--            , Duotone.busAlt |> Icon.viewStyled [ Icon.swapOpacity ]
--            ]
--        , Html.div [ Icon.fa3x ] duotoneOpacity
--        , Html.div [ Icon.fa3x ]
--            [ Duotone.crow |> Icon.viewStyled [ HtmlA.attribute "style" "--fa-secondary-opacity: 1.0; --fa-primary-color: dodgerblue; --fa-secondary-color: gold;" ] ]
--        ]
--
--
--duotoneOpacity =
--    [ 0.2, 0.4, 0.6, 0.8, 1 ] |> List.map (\o -> Duotone.busAlt |> Icon.viewStyled [ opacity "secondary" o ])
--
--
--opacity path o =
--    HtmlA.attribute "style" ("--fa-" ++ path ++ "-opacity: " ++ String.fromFloat o)
-- Helpers for the examples.


type alias Model =
    List ( String, Icon )


type Msg
    = Randomise
    | Change Model


main : Program () Model Msg
main =
    Browser.document
        { init = always ( [], randomise )
        , update = update
        , view = view
        , subscriptions = subscriptions
        }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Randomise ->
            ( model, randomise )

        Change newModel ->
            ( newModel, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions _ =
    Time.every 2000 (always Randomise)


view : Model -> Browser.Document Msg
view model =
    { title = "elm-fontawesome Example"
    , body =
        [ Html.div []
            -- First we include the CSS for FontAwesome, so the icons render correctly.
            [ Icon.css
            , Html.h1 [] [ Html.a [ HtmlA.href "https://github.com/Lattyware/elm-fontawesome" ] [ Html.text "elm-fontawesome" ] ]
            , simpleExamples
            , sizingIcons
            , fixedWidthIcons
            , iconsInAList
            , animatingIcons
            , layeringTextAndCounters
            , masking
            , randomIds model
            , svgIcons

            --            , duotone
            ]
        ]
    }


exampleSection name examples =
    Html.div [] (Html.h2 [] [ Html.text name ] :: examples)
