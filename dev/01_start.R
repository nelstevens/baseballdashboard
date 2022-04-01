#
#
#
golem::fill_desc(
  pkg_name = "lionsdash",
  pkg_title = "Lions stats dashboard",
  pkg_description = "Visualize current zürich lions statistics.",
  author_first_name = "Nelson",
  author_last_name = "Stevens",
  author_email = "nelson.stevens92@gmail.com",
  repo_url = NULL
)
golem::set_golem_options()
usethis::use_mit_license("Nelson Stevens")
#usethis::use_readme_rmd(open = FALSE)
#usethis::use_code_of_conduct(contact = "Nelson Stevens")
usethis::use_lifecycle_badge("Experimental")
#usethis::use_news_md(open = FALSE)
usethis::use_git()
golem::use_recommended_tests()
#golem::use_favicon() # To Fix: add favicon later
golem::use_utils_ui(with_test = TRUE)
golem::use_utils_server(with_test = TRUE)
rstudioapi::navigateToFile("dev/02_dev.R")
