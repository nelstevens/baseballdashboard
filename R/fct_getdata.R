#' get api data
#'
#' @description get data from easyscore api
#' @importFrom httr GET stop_for_status
#'
#'
#' @noRd
getApi <- function(endpoint, query) {
  Sys.sleep(10)
  baseurl <- "https://easyscore.com"
  res <- httr::GET(
    url = baseurl,
    path = endpoint,
    query = query
  )
  httr::stop_for_status(res)
  df <- make_df(res, query$League)
  return(df)
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
make_df <- function(res, league) {
  . <- NULL
  con <- httr::content(res) %>%
    as_list()
  df <- unnest(tibblify(con[[1]]))
  if (league == 83) {
    df2 <- df %>% filter(stringr::str_detect(.data$Player,"LIO"))
  } else {
    df2 <- df %>% filter(stringr::str_detect(.data$Player,"WP4"))
  }
  if (nrow(df2) == 0) stop(sprintf("Dataframes is empty after subsetting", league))
  # generate column vector
  cols <- names(df2)[!(names(df2) %in% c("Player", "Nationality", "dtCreated"))]
  df2 %>% mutate_at(cols, as.numeric) %>% replace(is.na(.), 0)
}
