test_that("make_league_sidebar works", {
  expect_snapshot(make_league_sidebar("test"))
  expect_snapshot(make_league_sidebar("test", expanded = TRUE))
})
test_that("get_relpicker works", {
  expect_snapshot(get_relpicker("offense"))
  expect_snapshot(get_relpicker("defense"))
})
