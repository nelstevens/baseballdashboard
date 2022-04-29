#' offense UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#' @noRd
#' @importFrom shinydashboardPlus accordion accordionItem
#' @importFrom shiny NS tagList uiOutput
#' @importFrom plotly plotlyOutput
#' @importFrom DT DTOutput
mod_tabitem_ui <- function(id, type = "offense"){
  ns <- NS(id)
  if (type == "offense") {
    tagList(
      uiOutput(ns("titlUI")),
      accordion(
        id = ns("accordion"),
        accordionItem(
          title = "Spieler vergleichen",
          collapsed = FALSE,
          mod_compare_ui(ns("comp"))
        ),
        accordionItem(
          title = "Spielerprofile",
          mod_player_ui(ns("play"))
        ),
        accordionItem(
          title = "Beitrag zum Total",
          mod_contribution_ui(ns("cont"), type)
        ),
        accordionItem(
          title = "Ergebnis Wahrscheinlichkeiten",
          mod_outcome_ui(ns("outc"))
        ),
        accordionItem(
          title = "Daten",
          mod_data_ui(ns("data"))
        )
      )
    )
  } else if (type == "defense") {
    tagList(
      uiOutput(ns("titlUI")),
      accordion(
        id = ns("accordion"),
        accordionItem(
          title = "Spieler vergleichen",
          collapsed = FALSE,
          mod_compare_ui(ns("comp"))
        ),
        accordionItem(
          title = "Spielerprofile",
          mod_player_ui(ns("play"))
        ),
        accordionItem(
          title = "Beitrag zum Total",
          mod_contribution_ui(ns("cont"), type)
        ),
        accordionItem(
          title = "Fielding percentage nach Position",
          mod_fldprct_ui(ns("fdpct"))
        ),
        accordionItem(
          title = "Daten",
          mod_data_ui(ns("data"))
        )
      )
    )
  } else {
    tagList(
      uiOutput(ns("titlUI")),
      accordion(
        id = ns("accordion"),
        accordionItem(
          title = "Spieler vergleichen",
          collapsed = FALSE,
          mod_compare_ui(ns("comp"))
        ),
        accordionItem(
          title = "Spielerprofile",
          mod_player_ui(ns("play"))
        ),
        accordionItem(
          title = "Beitrag zum Total",
          mod_contribution_ui(ns("cont"), type)
        ),
        accordionItem(
          title = "Daten",
          mod_data_ui(ns("data"))
        )
      )
    )
  }
}

#' offense Server Functions
#'
#' @importFrom fst read_fst
#' @import shiny
#'
#' @noRd
mod_tabitem_server <- function(id, title = NULL, type = "offense", vals){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

    output$titlUI <- renderUI({
      if (is.null(title)) h1(style = "text-align: center;", "blank title")
      else h1(style = "text-align: center;", title)
    })
    df <- eventReactive(reactiveValuesToList(vals), {
      req(vals$rnd, vals$yr, vals$lge)
      make_df_tabitem(vals, type)
    })
    mod_compare_server(
      "comp",
      df = df
    )
    mod_player_server(
      "play",
      df,
      type
    )
    mod_contribution_server(
      "cont",
      df = df
    )
    if (type == "defense") {
      mod_fldprct_server(
        "fdpct",
        df
      )
    }

    if (type == "offense") {
     mod_outcome_server(
       "outc",
       df
     )
    }
    mod_data_server(
      "data",
      df
    )

  })
}

## To be copied in the UI
# mod_tabitem_ui("offense_1")

## To be copied in the server
# mod_tabitem_server("offense_1")
