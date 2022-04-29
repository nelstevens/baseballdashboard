#' outcome UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#' @importFrom plotly plotlyOutput
#' @importFrom shiny NS tagList uiOutput
mod_outcome_ui <- function(id){
  ns <- NS(id)
  tagList(
    uiOutput(ns("sankeyUI")),
    plotlyOutput(ns("sankeyplt"))
  )
}

#' outcome Server Functions
#' @import shiny
#' @importFrom shinyWidgets pickerInput
#' @importFrom plotly renderPlotly
#' @noRd
mod_outcome_server <- function(id, df){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    output$sankeyUI <- renderUI(
      pickerInput(
        inputId = ns("sankey"),
        label = "Spieler:",
        choices = unique(df()$Player)
      )
    )

    sankey <- reactive({
      req(input$sankey)
      make_sankey(df(), input$sankey)
    })

    output$sankeyplt <- renderPlotly(sankey())
  })
}

## To be copied in the UI
# mod_outcome_ui("outcome_1")

## To be copied in the server
# mod_outcome_server("outcome_1")
