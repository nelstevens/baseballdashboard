#' make UI for playercards
#'
#' @description A fct function
#' @importFrom shiny icon
#'
#' @return The return value, if any, from executing the function.
#'
#' @noRd
make_player_UI <- function() {

}

make_statlist_player <- function(type) {
  if (type == "offense") {
    sts <- c(
      Nationality = "Nationality",
      Games = "G",
      `At Bats` = "AB",
      Runs = "R",
      Hits = "H",
      `Runs batted in` = "RBI",
      Singles = "Sngls",
      Doubles = "Dbls",
      Triples = "Trpls",
      Homeruns = "HR",
      Walks = "BB",
      Strikeouts = "SO",
      `Hit by pitches` = "HBP",
      `Batting average` = "AVG",
      `On base percentage` = "OBP",
      Slugging = "SLG",
      `On base plus slugging` = "OPS",
      `Stolen bases` = "SB",
      `Caught stealing` = "CS"
    )
  }
  return(sts)
}

#' make player cards
#' @importFrom purrr map2
#' @importFrom shinydashboard infoBox
#' @importFrom shiny icon
#' @noRd
make_playercards <- function(df, type, player) {
  sts <- make_statlist_player(type)
  cards <- map2(
    sts,
    names(sts),
    function(x, y) {
      infoBox(
        y,
        df[df$Player == player, x],
        icon = icon("baseball-ball")
      )
    }
  )
  return(cards)
}
