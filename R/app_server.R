#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {
  df_nlboff <- read_fst(app_sys("app/extdata/VR21nlboff.fst"))
  mod_tabitem_server("nlboff", df = df_nlboff, "NLB Offense")
  df_nlbdef <- read_fst(app_sys("app/extdata/VR21nlbfld.fst"))
  mod_tabitem_server("nlbdef", df = df_nlbdef, "NLB Defense")
  df_nlbpit <- read_fst(app_sys("app/extdata/VR21nlbpit.fst"))
  mod_tabitem_server("nlbpit", df = df_nlbpit, "NLB Pitching")
}
