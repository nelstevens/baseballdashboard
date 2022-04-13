test_that("make_barplot works", {
  df <- suppressWarnings(fst::read_fst(app_sys("app/extdata/VR21off.fst")))
  inps <- c("H", "AB")
  expect_true(all(class(make_barplot(df, inps)) == c("plotly", "htmlwidget")))
})

test_that("make_relplot works", {
  df <- suppressWarnings(fst::read_fst(app_sys("app/extdata/VR21off.fst")))
  inps <- c("H")
  expect_true(all(class(make_relplot(df, inps)) == c("plotly", "htmlwidget")))
})
test_that("make_sankey_inps works", {
  df <- suppressWarnings(fst::read_fst(app_sys("app/extdata/VR21off.fst")))
  inps <- c("Campbell, Ja. LIO")
  expect_snapshot(make_sankey_inps(df, inps))
})
test_that("make_sankey works", {
  df <- suppressWarnings(fst::read_fst(app_sys("app/extdata/VR21off.fst")))
  inps <- c("Campbell, Ja. LIO")
  expect_true(all(class(make_sankey(df, inps)) == c("plotly", "htmlwidget")))
})
