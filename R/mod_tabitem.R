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
  tagList(
    uiOutput(ns("titlUI")),
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
        shinyWidgets::pickerInput(
          ns("relsel"),
          choices = get_relpicker(type)
        ),
        plotlyOutput(ns("relplt"))
      ),
      accordionItem(
        title = "Daten",
        DTOutput(ns("dats"))
      )
    )
  )
}

#' offense Server Functions
#'
#' @importFrom fst read_fst
#' @import shiny
#' @import DT
#' @importFrom shinyWidgets pickerInput
#'
#' @noRd
mod_tabitem_server <- function(id, df, title = NULL){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    choic <- names(df)[-c(1:9)]

    output$titlUI <- renderUI({
      if (is.null(title)) h1(style = "text-align: center;", "blank title")
      else h1(style = "text-align: center;", title)
    })

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
      make_barplot(df, sts())
    })


    output$barplt <- renderPlotly(plt())

    output$dats <- renderDT(DT::datatable(df, options = list(scrollX = TRUE)))

    relplt <- reactive({
      make_relplot(df, input$relsel)
    })

    output$relplt <- renderPlotly(relplt())



  })
}

## To be copied in the UI
# mod_tabitem_ui("offense_1")

## To be copied in the server
# mod_tabitem_server("offense_1")
