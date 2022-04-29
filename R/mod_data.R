#' data UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#' @importFrom DT DTOutput
#' @importFrom shiny NS tagList
mod_data_ui <- function(id){
  ns <- NS(id)
  tagList(
    DTOutput(ns("dats"))
  )
}

#' data Server Functions
#'
#' @importFrom DT renderDT datatable
#'
#' @noRd
mod_data_server <- function(id, df){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    output$dats <- renderDT(DT::datatable(df(), options = list(scrollX = TRUE)))
  })
}

## To be copied in the UI
# mod_data_ui("data_1")

## To be copied in the server
# mod_data_server("data_1")
