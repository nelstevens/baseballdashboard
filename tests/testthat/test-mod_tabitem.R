testServer(
  mod_tabitem_server,
  # Add here your module params
  args = list(title = "NLB Offense", vals = shiny::reactiveValues(yr = 2021, rnd = "VR", lge = "NLB"))
  , {
    ns <- session$ns
    expect_true(
      inherits(ns, "function")
    )
    expect_true(
      grepl(id, ns(""))
    )
    expect_true(
      grepl("test", ns("test"))
    )
})

test_that("module ui works", {
  ui <- mod_tabitem_ui(id = "test")
  golem::expect_shinytaglist(ui)
  # Check that formals have not been removed
  fmls <- formals(mod_tabitem_ui)
  for (i in c("id")){
    expect_true(i %in% names(fmls))
  }
})

