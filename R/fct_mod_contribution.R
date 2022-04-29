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
