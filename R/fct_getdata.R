#' get api data
#'
#' @description get data from easyscore api
#' @importFrom httr GET stop_for_status
#'
#'
#' @noRd
getApi <- function(endpoint, query) {
  baseurl <- "https://easyscore.com"
  res <- httr::GET(
    url = baseurl,
    path = endpoint,
    query = query
  )
  httr::stop_for_status(res)
  make_df(res)
}

#' response to df
#'
#' @importFrom httr content
#' @importFrom xml2 as_list
#' @importFrom stringr str_detect
#' @importFrom magrittr %>%
#' @importFrom dplyr filter mutate_at
#' @importFrom rlang .data
#' @importFrom tidyr unnest
#' @importFrom tibblify tibblify
#' @noRd
make_df <- function(res) {
  . <- NULL
  con <- httr::content(res) %>%
    as_list()
  df <- unnest(tibblify(con[[1]]))
  df2 <- df %>% filter(stringr::str_detect(.data$Player,"LIO"))
  # generate column vector
  cols <- names(df2)[!(names(df2) %in% c("Player", "Nationality", "dtCreated"))]
  df2 %>% mutate_at(cols, as.numeric) %>% replace(is.na(.), 0)
}
