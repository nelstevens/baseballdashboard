#' player UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList uiOutput
mod_player_ui <- function(id){
  ns <- NS(id)
  tagList(
    uiOutput(ns("selplayUI")),
    uiOutput(ns("playerUI"))
  )
}

#' player Server Functions
#'
#' @import shiny
#' @importFrom shinyWidgets pickerInput
#'
#' @noRd
mod_player_server <- function(id, df, type){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    output$selplayUI <- renderUI({
      pickerInput(
        ns("selplayer"),
        choices = unique(df$Player)
      )
    })
    output$playerUI <- renderUI({
      make_playercards(df, type, input$selplayer)
    })
  })
}

## To be copied in the UI
# mod_player_ui("player_1")

## To be copied in the server
# mod_player_server("player_1")
