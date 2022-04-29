#' contribution UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#' @importFrom shinyWidgets pickerInput
#' @importFrom plotly plotlyOutput
#' @importFrom shiny NS tagList
mod_contribution_ui <- function(id, type){
  ns <- NS(id)
  tagList(
    shinyWidgets::pickerInput(
      ns("relsel"),
      choices = get_relpicker(type)
    ),
    plotlyOutput(ns("relplt"))
  )
}

#' contribution Server Functions
#'
#' @import shiny
#' @importFrom plotly renderPlotly
#'
#' @noRd
mod_contribution_server <- function(id, df){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    relplt <- reactive({
      make_relplot(df(), input$relsel)
    })

    output$relplt <- renderPlotly(relplt())
  })
}

## To be copied in the UI
# mod_contribution_ui("contribution_1")

## To be copied in the server
# mod_contribution_server("contribution_1")
