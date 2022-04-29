test_that("make_barplot works", {
  df <- suppressWarnings(fst::read_fst(app_sys("app/extdata/VR21nlboff.fst")))
  inps <- c("H", "AB")
  expect_true(all(class(make_barplot(df, inps)) == c("plotly", "htmlwidget")))
})
