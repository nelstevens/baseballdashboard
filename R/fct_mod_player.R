#' make stats list for player cars
#'
#' @noRd
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
  } else if (type == "defense") {
    sts <- c(
      Nationality = "Nationality",
      Games = "Games",
      Chances = "Chances",
      Putouts = "Putouts",
      Assists = "Assists",
      Errors = "Errors",
      `Double plays` = "DP",
      `Fielding percentage` = "FPct"
    )
  } else {
    sts <- c(
      Nationality = "Nationality",
      Games = "G",
      `Games started` = "GS",
      `Games finished` = "GF",
      `Innings pitched` = "IP",
      `Earned run average` = "ERA",
      Hits = "H",
      Runs = "R",
      `Earned runs` = "ER",
      `Home runs` = "HR",
      Walks = "BB",
      Strikeouts = "K",
      `Hit by pitches` = "HBP",
      `Wild pitches` = "WP",
      Balks = "BK",
      Wins = "W",
      Losses = "L",
      `Win lose percentage` = "WLPct",
      Saves = "SV",
      `Blown saves` = "BS",
      Outs = "Outs",
      `Batters faced` = "BF",
      `Opponent batting average` = "OAVG",
      `Opponent on base percentage` = "OOBP",
      `Opponent slugging percentage` = "OSLG",
      `Opponent on base plus slugging` = "OOPS",
      `Batters faces per inning` = "BFIP"
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
