#' make sankey plot
#'
#' @import plotly
#'
#' @noRd
make_sankey <- function(df, inps) {
  argu <- make_sankey_inps(df, inps)

  plt <- plot_ly(
    type = "sankey",
    orientation = "v",
    node = list(
      label = argu$labels,
      color = argu$colors,
      pad = 15,
      thickness = 20,
      line = list(color = "black", width = 0.5)
    ),
    link = list(
      source = argu$sources,
      target = argu$targets,
      value = argu$values
    )
  )
  plt
}

#' make inputs for sankey plotly
#'
#' @importFrom dplyr filter select mutate_at all_of mutate
#' @noRd
make_sankey_inps <- function(df, inps) {
  Player <- . <- PA <- Sngls <- Dbls <- Trpls <- HR <- BB <- HBP <- SO <-  NULL
  intr <- c("PA", "Sngls", "Dbls", "Trpls", "HR", "BB", "HBP", "SO")
  vals <- df %>%
    filter(Player == inps) %>%
    select(Player, all_of(intr)) %>%
    mutate(Out = PA - ( Sngls + Dbls + Trpls + HR + BB + HBP + SO)) %>%
    dplyr::mutate_at(c(intr, "Out"), function(x) x/.$PA)
  labs <- c(
    "plate appearance",
    "Single",
    "Double",
    "triple",
    "Homerun",
    "Base on balls",
    "Hit by pitch",
    "Strikeout",
    "Out"
  )
  cols <- c("blue", rep("green", 4), rep("orange", 2), rep("red", 2))
  src <- rep(0, 8)
  targ <- 1:8
  values <- as.numeric(vals[1, 3:10])
  labs <- c(labs[1], paste0(labs[2:9], " - ", round(values*100), "%"))
  list(
    labels = labs,
    colors = cols,
    sources = src,
    targets = targ,
    values = values
  )
}
