#' make_df
#'
#' @noRd
make_df_tabitem <- function(vals, type) {
  if (type == "offense") {
    cato <- "off"
  } else if (type == "defense") {
    cato <- "fld"
  } else {
    cato <- "pit"
  }
  yr <- as.numeric(vals$yr) - 2000
  lge <- vals$lge
  nam <- paste0(vals$rnd, yr, lge, cato, ".fst")
  read_fst(app_sys(paste0("app/extdata/", nam)))
}
