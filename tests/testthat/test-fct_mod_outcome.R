test_that("make_sankey_inps works", {
  df <- suppressWarnings(fst::read_fst(app_sys("app/extdata/VR21nlboff.fst")))
  inps <- c("Campbell, Ja. LIO")
  expect_snapshot(make_sankey_inps(df, inps))
})
test_that("make_sankey works", {
  df <- suppressWarnings(fst::read_fst(app_sys("app/extdata/VR21nlboff.fst")))
  inps <- c("Campbell, Ja. LIO")
  expect_true(all(class(make_sankey(df, inps)) == c("plotly", "htmlwidget")))
})
