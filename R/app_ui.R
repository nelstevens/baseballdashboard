#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @import shinydashboard
#' @importFrom shinyWidgets pickerInput
#' @noRd
app_ui <- function(request) {
  tagList(
    golem_add_external_resources(),
    dashboardPage(
      skin = "black",
      dashboardHeader(
        title = "Z\u00fcrich Lions"
      ),
      dashboardSidebar(
        sidebarMenu(
          div(
            id = "sidesel",
            pickerInput(
              "lgepic",
              "Liga w\u00e4hlen:",
              choices = c(NLB = "nlb", `1. Liga` = "fst")
            ),
            pickerInput(
              "yrpic",
              "Jahr w\u00e4hlen:",
              choices = NULL,
              selected = NULL
            ),
            pickerInput(
              "rndpic",
              "Runde w\u00e4hlen:",
              choices = NULL,
              selected = NULL
            )
          ),
          make_league_sidebar("cat", expanded = TRUE)
        )
      ),
      dashboardBody(
        fluidRow(
          conditionalPanel(
            condition = "input.rndpic !== null",
            tabItems(
              tabItem(
                tabName = "offense-cat",
                mod_tabitem_ui("catoff", "offense")
              ),
              tabItem(
                tabName = "defense-cat",
                mod_tabitem_ui("catdef", "defense")
              ),
              tabItem(
                tabName = "pitching-cat",
                mod_tabitem_ui("catpit", "pitching")
              )
            )
          )
        )
      )
    )
  )
}
#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function() {
  add_resource_path(
    "www",
    app_sys("app/www")
  )
  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys("app/www"),
      app_title = "lions2022"
    )
  )
}
