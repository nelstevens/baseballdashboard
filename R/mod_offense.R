#' offense UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#' @noRd
#'
#' @importFrom shiny NS tagList uiOutput
mod_offense_ui <- function(id){
  ns <- NS(id)
  tagList(
    uiOutput(ns("statselUI"))
  )
}

#' offense Server Functions
#'
#' @importFrom fst read_fst
#' @import shiny
#' @importFrom shinyWidgets pickerInput
#'
#' @noRd
mod_offense_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    df <- read_fst(app_sys("app/extdata/VR21off.fst"))
    choic <- names(df)[-c(1:9)]

    output$statselUI <- renderUI(
      pickerInput(
        inputId = ns("statsel"),
        label = "Statistiken: ",
        choices = choic,
        options = list(
          `live-search` = TRUE
        )

      )
    )
  })
}

## To be copied in the UI
# mod_offense_ui("offense_1")

## To be copied in the server
# mod_offense_server("offense_1")
