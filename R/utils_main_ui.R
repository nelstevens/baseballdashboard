#' sidebarmenuleague
#'
#' @description A utils function
#'
#' @importFrom stringr str_to_upper
#' @import shinydashboard
#' @importFrom shiny icon
#'
#' @return The return value, if any, from executing the utility.
#'
#' @noRd
make_league_sidebar <- function(id) {
  menuItem(
    str_to_upper(id),
    tabName = id,
    icon = icon("baseball-ball"),
    menuSubItem(
      "Offense",
      paste0("offense-", id),
      icon = icon("utensils")
    ),
    menuSubItem(
      "Defense",
      paste0("defense-", id),
      icon = icon("mitten")
    )
  )
}
