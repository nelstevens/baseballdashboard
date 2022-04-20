#' get api data
#'
#' @description get data from easyscore api
#' @importFrom httr GET stop_for_status
#'
#'
#' @noRd
getApi <- function(endpoint, query) {
  message(paste0("resquesting: ", endpoint))
  baseurl <- "https://easyscore.com"
  res <- httr::GET(
    url = baseurl,
    path = endpoint,
    query = query
  )
  cat(str(query))
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
  message(paste0("processing", league))
  . <- NULL
  con <- httr::content(res) %>%
    as_list()
  df <- unnest(tibblify(con[[1]]))
  cat(str(df))
  if (league == 83) {
    cat("subset for NLB")
    df2 <- df %>% filter(stringr::str_detect(.data$Player,"LIO"))
  } else {
    cat("subset for 1. Liga")
    df2 <- df %>% filter(stringr::str_detect(.data$Player,"WP4"))
  }
  cat(str(df2))
  if (nrow(df2) == 0) stop(paste0("Dataframes is empty after subsetting", league))
  # generate column vector
  cols <- names(df2)[!(names(df2) %in% c("Player", "Nationality", "dtCreated"))]
  df2 %>% mutate_at(cols, as.numeric) %>% replace(is.na(.), 0)
}
