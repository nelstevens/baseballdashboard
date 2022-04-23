#' fldprct UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#' @importFrom shinyWidgets pickerInput
#' @noRd
#'
#' @importFrom shiny NS tagList uiOutput plotOutput
mod_fldprct_ui <- function(id){
  ns <- NS(id)
  tagList(
    uiOutput(ns("fpctpickerUI")),
    plotOutput(ns("fdpct"))
  )
}

#' fldprct Server Functions
#'
#' @importFrom shinyWidgets pickerInput
#' @import shiny
#' @noRd
mod_fldprct_server <- function(id, df){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    output$fpctpickerUI <- renderUI({
      pickerInput(
        ns("fpctpicker"),
        choices = unique(df$Player)
      )
    })

    plt <- reactive({
      info <- make_fdpctinfo(df, input$fpctpicker)
      make_fdpct(info)
    })

    output$fdpct <- renderPlot({
      plt()
    })
  })
}

## To be copied in the UI
# mod_fldprct_ui("fldprct_1")

## To be copied in the server
# mod_fldprct_server("fldprct_1")
