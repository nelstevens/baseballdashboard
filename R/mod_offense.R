#' offense UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#' @noRd
#'
#' @importFrom shiny NS tagList uiOutput
#' @importFrom plotly plotlyOutput
mod_offense_ui <- function(id){
  ns <- NS(id)
  tagList(
    uiOutput(ns("statselUI")),
    plotlyOutput(ns("barplt"))
  )
}

#' offense Server Functions
#'
#' @importFrom fst read_fst
#' @import shiny
#' @import plotly
#' @importFrom dplyr arrange desc
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
        multiple = TRUE,
        options = list(
          `live-search` = TRUE
        )

      )
    )

    plt <- reactive({
      shiny::req(input$statsel)
      pl <- plot_ly()
      df2 <- df %>% arrange(desc(.[[input$statsel[1]]]))
      df2$Player<- factor(df2$Player, levels = df2$Player)
      for (i in input$statsel) {
        pl <- pl %>%
          add_trace(
            x = df2$Player,
            y = df2[[i]],
            type = "bar",
            name = i
          )
      }
      pl
    })


    output$barplt <- renderPlotly(plt())



  })
}

## To be copied in the UI
# mod_offense_ui("offense_1")

## To be copied in the server
# mod_offense_server("offense_1")
