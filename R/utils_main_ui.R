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
make_league_sidebar <- function(id, expanded = FALSE) {
  menuItem(
    ifelse(id == "flg", "1. Liga", str_to_upper(id)),
    tabName = id,
    startExpanded = expanded,
    icon = icon("baseball-ball"),
    menuSubItem(
      "Offense",
      tabName = paste0("offense-", id),
      icon = icon("utensils")
    ),
    menuSubItem(
      "Defense",
      tabName = paste0("defense-", id),
      icon = icon("mitten")
    ),
    menuSubItem(
      "Pitching",
      tabName = paste0("pitching-", id),
      icon = icon("baseball-ball")
    )
  )
}

#' make pickerinput for relative contribution
#'
#' @noRd
get_relpicker <- function(type) {
  if (type == "offense") {
    c(
      "R",
      "H",
      "RBI",
      "Sngls",
      "Dbls",
      "Trpls",
      "HR",
      "HBP",
      "SO"
    )
  } else if (type == "defense") {
    c(
      "Assists",
      "Putouts",
      "Errors",
      "DP"
    )
  } else {
    c(
      "IP",
      "H",
      "R",
      "ER",
      "HR",
      "BB",
      "K",
      "HBP"
    )
  }
}
