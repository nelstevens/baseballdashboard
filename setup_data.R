# laod all
devtools::load_all()
postApi <- purrr::insistently(postApi)
postApi <- purrr::slowly(postApi)

ends <- c("stats/Stats_Static.asmx/off", "stats/Stats_Static.asmx/fld", "stats/Stats_Static.asmx/pit")
yrs <- 2016:2023
cls <- list()
for (i in yrs) {
  for (j in ends) {
    sub1 <- list(
      list(
        endpoint = j,
        args = list(Year = i, League = 83, Round = 53, Splits = "", IndOrTeam = "Individual", PlayerID = 0)
      )
    )
    cls <- c(cls, sub1)
    sub2 <- list(
      list(
        endpoint = j,
        args = list(Year = i, League = 83, Round = 303, Splits = "", IndOrTeam = "Individual", PlayerID = 0)
      )
    )
    cls <- c(cls, sub2)
    sub3 <- list(
      list(
        endpoint = j,
        args = list(Year = i, League = 84, Round = 57, Splits = "", IndOrTeam = "Individual", PlayerID = 0)
      )
    )
    cls <- c(cls, sub3)
  }

}
avlssub <- purrr::map(
  purrr::set_names(yrs),
  function(x) {
    list(
      rounds = c()
    )
  }
)
avls <- list(
  nlb = avlssub,
  fst = avlssub
)
purrr::walk(
  cls,
  function(x) {
    rnd <- ifelse(x$args$Round == 303, "PL", "VR")
    lge <- ifelse(x$args$League == 83, "nlb", "fst")
    yr <- x$args$Year - 2000
    typ <- stringr::str_split(x$endpoint, "/")[[1]][3]
    nm <- paste0(rnd, yr, lge, typ)
    path <- paste0(app_sys("app/extdata"), "/", nm, ".fst")
    df <- tryCatch(
      {
        postApi(x$endpoint, x$args)
      },
      error = function(m) message(m)
    )
    if (!is.null(df)) {
      if (x$endpoint == "stats/Stats_Static.asmx/off")
      avls[[lge]][[as.character(yr+2000)]]$rounds <<- c(avls[[lge]][[as.character(yr+2000)]]$rounds, rnd)
      fst::write_fst(df, path)
    }
  }
)
rounds <- avls

a <- purrr::map(
  avls,
  function(x) {
    purrr::map(
      x,
      function(y) {
        if (!is.null(y$rounds)) return(y)
      }
    )
  }
)
years <- a %>% purrr::map(., purrr::discard, .p = rlang::is_null)
usethis::use_data(rounds, years, internal = TRUE, overwrite = TRUE)

