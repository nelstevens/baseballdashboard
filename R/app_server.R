#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @importFrom shinyWidgets updatePickerInput
#' @noRd
app_server <- function(input, output, session) {
  observeEvent(input$lgepic, {
    nam <- ifelse(input$lgepic == "NLB", "nlb", "fst")
    updatePickerInput(
      session = session,
      inputId = "yrpic",
      choices = rev(names(years[[nam]]))
    )
  })
  observeEvent(input$yrpic, {
    nam <- ifelse(input$lgepic == "NLB", "nlb", "fst")
    choic <- rounds[[nam]][[as.character(input$yrpic)]]$rounds
    updatePickerInput(
      session = session,
      inputId = "rndpic",
      choices = choic,
      selected = choic[1]
    )
  })
  vals <- reactiveValues()
  observe({
    vals$yr = input$yrpic
    vals$rnd <- input$rndpic
    vals$lge <- input$lgepic
  })
  mod_tabitem_server("catoff", "NLB Offense", "offense", vals)
  mod_tabitem_server("catdef", "NLB Defense", "defense", vals)
  mod_tabitem_server("catpit", "NLB Pitching", "pitching", vals)

}
