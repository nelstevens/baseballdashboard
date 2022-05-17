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
  df2$Player<- factor(df2$Player, levels = unique(df2$Player))
  for (i in inps) {
    pl <- pl %>%
      add_trace(
        x = df2$Player,
        y = df2[[i]],
        type = "bar",
        name = i
      )
  }
  pl %>% layout(hovermode = "x unified")
}
