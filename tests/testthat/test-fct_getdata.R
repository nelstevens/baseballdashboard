test_that("getApi works", {
  expect_error(suppressWarnings(getApi("stats/Stats_Static.asmx/off", list(Year = 2021, League = 83, Round = 53, Splits = "", IndOrTea = "Individual"))))

  expect_s3_class(
    suppressWarnings(getApi("stats/Stats_Static.asmx/off", list(Year = 2021, League = 83, Round = 53, Splits = "", IndOrTeam = "Individual"))),
    "data.frame"
  )
})
