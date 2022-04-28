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
  httr::stop_for_status(res)
  df <- make_df(res, query$League)
  return(df)
}

#' get data via post
#'
#' @description get data from easyscore api via post method
#' @importFrom httr POST stop_for_status
#' @importFrom purrr map_dfr
#'
#' @noRd
postApi <- function(endpoint, query) {
  message(paste0("resquesting: ", endpoint))
  baseurl <- "https://easyscore.com"
  url <- paste0(baseurl, "/", endpoint)
  res <- httr::POST(
    url = url,
    body = query,
    encode = "json"
  )
  httr::stop_for_status(res)
  make_df_post(res, query$League, query$Year)
}

#' make df for post
#'
#' @importFrom httr content
#' @importFrom stringr str_detect
#' @importFrom dplyr filter mutate_at
#' @importFrom rlang .data
#' @importFrom magrittr %>%
#' @noRd
make_df_post <- function(res, league, year) {
  . <- NULL
  message(paste0("processing", league))
  con <- httr::content(res)
  df <- purrr::map_dfr(con, ~.x)
  df <- df[,-c(1)]
  if (league == 83) {
    cat("subset for NLB")
    df2 <- df %>% filter(stringr::str_detect(.data$Player,"LIO"))
  } else {
    cat("subset for 1. Liga")
    if (year == 2021) df2 <- df %>% filter(stringr::str_detect(.data$Player,"WP4"))
    else df2 <- df %>% filter(stringr::str_detect(.data$Player,"LIO"))
  }
  if (nrow(df2) == 0) stop(paste0("Dataframes is empty after subsetting", league))
  # generate column vector
  cols <- names(df2)[!(names(df2) %in% c("Player", "Nationality", "dtCreated"))]
  df2 %>% mutate_at(cols, as.numeric) %>% replace(is.na(.), 0)
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
  if (league == 83) {
    cat("subset for NLB")
    df2 <- df %>% filter(stringr::str_detect(.data$Player,"LIO"))
  } else {
    cat("subset for 1. Liga")
    df2 <- df %>% filter(stringr::str_detect(.data$Player,"WP4"))
  }
  if (nrow(df2) == 0) stop(paste0("Dataframes is empty after subsetting", league))
  # generate column vector
  cols <- names(df2)[!(names(df2) %in% c("Player", "Nationality", "dtCreated"))]
  df2 %>% mutate_at(cols, as.numeric) %>% replace(is.na(.), 0)
}
