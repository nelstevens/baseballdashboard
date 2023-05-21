test_that("getApi works", {
  expect_s3_class(
    suppressWarnings(postApi("stats/Stats_Static.asmx/off", list(Year = 2021, League = 83, Round = 53, Splits = "", IndOrTeam = "Individual", PlayerID = 0))),
    "data.frame"
  )
})
