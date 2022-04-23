#' make fielding percentage info
#'
#' @description A fct function
#'
#' @return The return value, if any, from executing the function.
#'
#' @noRd
make_fdpctinfo <- function(df, player) {
  plr <- df[df$Player == player, c("FPctP", "FPctC", "FPct1B", "FPct2B", "FPct3B", "FPctSS", "FPctOF")]
  info <- list(
    x = c(0, 0, 63, 20, -63, -20, 0),
    y = c(63, 0, 83, 126, 83, 126, 190),
    txt = as.numeric(plr)
  )
  return(info)
}

#' make fielding percentage plot
#'
#' @importFrom sportyR geom_baseball
#' @importFrom ggplot2 annotate theme unit
#'
#' @noRd
make_fdpct <- function(info) {
  geom_baseball(league = "MLB") +
    annotate(
      "text",
      x = info$x,
      y = info$y,
      label = info$txt,
      size = 10,
      color = "red"
    ) +
    theme(
      plot.margin = unit(c(1,1,1,1), "cm")
    )
}
