#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @importFrom shinyWidgets updatePickerInput
#' @importFrom shinyjs addClass
#' @noRd
app_server <- function(input, output, session) {
  addClass(selector = "body.skin-black", class = "sidebar-open")
  observeEvent(input$lgepic, {
    nam <- input$lgepic
    updatePickerInput(
      session = session,
      inputId = "yrpic",
      choices = rev(names(years[[nam]])),
      selected = character(0)
    )
    updatePickerInput(
      session = session,
      inputId = "rndpic",
      selected = character(0)
    )
  })
  observeEvent(input$yrpic, {
    nam <- input$lgepic
    choic <- rounds[[nam]][[as.character(input$yrpic)]]$rounds
    updatePickerInput(
      session = session,
      inputId = "rndpic",
      choices = choic,
      selected = character(0)
    )
  })
  vals <- reactiveValues()
  observe({
    vals$yr <-  input$yrpic
    vals$rnd <- input$rndpic
    vals$lge <- input$lgepic
  })
  mod_tabitem_server("catoff", "NLB Offense", "offense", vals)
  mod_tabitem_server("catdef", "NLB Defense", "defense", vals)
  mod_tabitem_server("catpit", "NLB Pitching", "pitching", vals)

}
