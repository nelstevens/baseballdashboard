#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {
  df_nlboff <- read_fst(app_sys("app/extdata/VR21off.fst"))
  mod_tabitem_server("nlboff", df = df_nlboff)
  df_nlbdef <- read_fst(app_sys("app/extdata/VR21fld.fst"))
  mod_tabitem_server("nlbdef", df = df_nlbdef)
}
