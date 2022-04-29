test_that("make_relplot works", {
  df <- suppressWarnings(fst::read_fst(app_sys("app/extdata/VR21nlboff.fst")))
  inps <- c("H")
  expect_true(all(class(make_relplot(df, inps)) == c("plotly", "htmlwidget")))
})
