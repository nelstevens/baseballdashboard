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
#' @importFrom dplyr select mutate arrange desc top_n layout
#' @import plotly
#'
#' @noRd
make_relplot <- function(df, inps) {
  df2 <- df %>%
    select(Player, inps) %>%
    arrange(desc(.[[inps]])) %>%
    top_n(7) %>%
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
