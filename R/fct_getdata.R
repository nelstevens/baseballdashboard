#' get api data
#'
#' @description get data from easyscore api
#' @importFrom httr GET content stop_for_status
#' @importFrom tibblify tibblify
#' @importFrom tidyr unnest
#' @importFrom dplyr filter
#' @importFrom stringr str_detect
#' @importFrom magrittr %>%
#' @importFrom xml2 as_list
#' @importFrom rlang .data
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
  con <- httr::content(res) %>%
    as_list()
  df <- unnest(tibblify(con[[1]]))
  df %>% filter(stringr::str_detect(.data$Player,"LIO"))
}
