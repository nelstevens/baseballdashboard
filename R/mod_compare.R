#' compare UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom plotly plotlyOutput
#' @importFrom shiny NS tagList
mod_compare_ui <- function(id){
  ns <- NS(id)
  tagList(
    uiOutput(ns("statselUI")),
    plotlyOutput(ns("barplt"))
  )
}

#' compare Server Functions
#'
#' @import shiny
#' @importFrom shinyWidgets pickerInput
#' @importFrom plotly renderPlotly
#'
#' @noRd
mod_compare_server <- function(id, df){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    choic <- reactive(names(df())[-c(1:9)])
    output$statselUI <- renderUI(
      pickerInput(
        inputId = ns("statsel"),
        label = "Statistiken: ",
        choices = choic(),
        multiple = TRUE,
        selected = choic()[1],
        options = list(
          `live-search` = TRUE
        )

      )
    )

    sts <- reactiveVal()

    observeEvent(input$statsel, {
      req(input$statsel)
      if (length(input$statsel) > length(sts())) {
        sts(c(sts(), setdiff(input$statsel, sts())))
      } else {
        remo <- setdiff(sts(), input$statsel)
        sts(sts()[!(sts() %in% remo)])
      }
    })

    plt <- reactive({
      make_barplot(df(), sts())
    })


    output$barplt <- renderPlotly(plt())

  })
}

## To be copied in the UI
# mod_compare_ui("compare_1")

## To be copied in the server
# mod_compare_server("compare_1")
