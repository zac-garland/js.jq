html_dependency_jq_tabs <- function() {
  htmlDependency(
    "jq-tabs",
    version = "0.01",
    src = "lib/jq-tabs",
    script = "jq-tabs.js",
    stylesheet = "jq-tabs.css",
    package = "js.jq",
    all_files = TRUE
  )
}
