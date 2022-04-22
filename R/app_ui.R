#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @import shinydashboard
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
          make_league_sidebar("nlb", expanded = TRUE),
          make_league_sidebar("flg")
        )
      ),
      dashboardBody(
        fluidRow(
          tabItems(
            tabItem(
              tabName = "offense-nlb",
              mod_tabitem_ui("nlboff", "offense")
            ),
            tabItem(
              tabName = "defense-nlb",
              mod_tabitem_ui("nlbdef", "defense")
            ),
            tabItem(
              tabName = "pitching-nlb",
              mod_tabitem_ui("nlbpit", "pitching")
            ),
            tabItem(
              tabName = "offense-flg",
              mod_tabitem_ui("flgoff", "offense")
            ),
            tabItem(
              tabName = "defense-flg",
              mod_tabitem_ui("flgdef", "defense")
            ),
            tabItem(
              tabName = "pitching-flg",
              mod_tabitem_ui("flgpit", "pitching")
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
