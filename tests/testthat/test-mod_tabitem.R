testServer(
  mod_tabitem_server,
  # Add here your module params
  args = list(df = fst::read_fst(app_sys("app/extdata/VR21off.fst")), title = "NLB Offense")
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

