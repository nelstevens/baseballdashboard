#' offense UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#' @noRd
#' @importFrom shinydashboardPlus accordion accordionItem
#' @importFrom shiny NS tagList uiOutput
#' @importFrom plotly plotlyOutput
mod_tabitem_ui <- function(id){
  ns <- NS(id)
  tagList(
    accordion(
      id = ns("accordion"),
      accordionItem(
        title = "Spieler vergleichen",
        collapsed = FALSE,
        uiOutput(ns("statselUI")),
        plotlyOutput(ns("barplt"))
      ),
      accordionItem(
        title = "Beitrag zum Total",
        tags$h1("hallo")
      )
    )
  )
}

#' offense Server Functions
#'
#' @importFrom fst read_fst
#' @import shiny
#' @importFrom shinyWidgets pickerInput
#'
#' @noRd
mod_tabitem_server <- function(id, df){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    choic <- names(df)[-c(1:9)]

    output$statselUI <- renderUI(
      pickerInput(
        inputId = ns("statsel"),
        label = "Statistiken: ",
        choices = choic,
        multiple = TRUE,
        options = list(
          `live-search` = TRUE
        )

      )
    )

    plt <- reactive({
      make_barplot(df, input$statsel)
    })


    output$barplt <- renderPlotly(plt())



  })
}

## To be copied in the UI
# mod_tabitem_ui("offense_1")

## To be copied in the server
# mod_tabitem_server("offense_1")
