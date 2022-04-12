#' make barplot
#'
#' @description A fct function
#'
#' @import plotly
#' @importFrom dplyr arrange desc
#' @return The return value, if any, from executing the function.
#'
#' @noRd
make_barplot <- function(df, inps) {
  shiny::req(inps)
  . <- NULL
  pl <- plot_ly()
  df2 <- df %>% arrange(desc(.[[inps[1]]]))
  df2$Player<- factor(df2$Player, levels = df2$Player)
  for (i in inps) {
    pl <- pl %>%
      add_trace(
        x = df2$Player,
        y = df2[[i]],
        type = "bar",
        name = i
      )
  }
  pl
}

#' make plot for relative contributions
#' @importFrom dplyr select mutate arrange desc slice
#' @import plotly
#'
#' @noRd
make_relplot <- function(df, inps) {
  . <- Player <- NULL
  df2 <- df %>%
    select(Player, inps) %>%
    arrange(desc(.[[inps]])) %>%
    slice(1:7) %>%
    mutate(total = sum(.[inps])) %>%
    mutate(cont = as.vector(.[[inps]] / .$total))

  plt <- plot_ly(
    df2,
    labels = ~Player,
    values = df2[[inps]],
    text =  ~Player,
    type = "pie"
  ) %>% layout(showlegend = FALSE)
  plt
}

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
#' @importFrom dplyr filter select mutate_at all_of
#' @noRd
make_sankey_inps <- function(df, inps) {
  Player <- . <- NULL
  intr <- c("PA", "Sngls", "Dbls", "Trpls", "HR", "BB", "HBP", "SO")
  vals <- df %>%
    filter(Player == inps) %>%
    select(Player, all_of(intr)) %>%
    dplyr::mutate_at(intr, function(x) x/.$PA)
  labs <- c(
    "plate appearance",
    "Single",
    "Double",
    "triple",
    "Homerun",
    "Base on balls",
    "Hit by pitch",
    "Strikeout"
  )
  cols <- c("blue", rep("green", 4), rep("orange", 2), "red")
  src <- rep(0, 87)
  targ <- 1:7
  values <- as.numeric(vals[1, 3:9])
  labs <- c(labs[1], paste0(labs[2:8], " - ", round(values*100), "%"))
  list(
    labels = labs,
    colors = cols,
    sources = src,
    targets = targ,
    values = values
  )
}

