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
  df_nlboff <- read_fst(app_sys("app/extdata/VR21nlboff.fst"))
  mod_tabitem_server("nlboff", df = df_nlboff, "NLB Offense")
  df_nlbdef <- read_fst(app_sys("app/extdata/VR21nlbfld.fst"))
  mod_tabitem_server("nlbdef", df = df_nlbdef, "NLB Defense", "defense")
  df_nlbpit <- read_fst(app_sys("app/extdata/VR21nlbpit.fst"))
  mod_tabitem_server("nlbpit", df = df_nlbpit, "NLB Pitching", "pitching")


  df_fstoff <- read_fst(app_sys("app/extdata/VR21fstoff.fst"))
  mod_tabitem_server("flgoff", df = df_fstoff, "1. Liga  Offense")
  df_fstdef <- read_fst(app_sys("app/extdata/VR21fstfld.fst"))
  mod_tabitem_server("flgdef", df = df_fstdef, "1. Liga Defense", "defense")
  df_fstpit <- read_fst(app_sys("app/extdata/VR21fstpit.fst"))
  mod_tabitem_server("flgpit", df = df_fstpit, "1. Liga Pitching", "pitching")
}
