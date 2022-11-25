

create_tab_panels <- function(named_list = list(
                                `example` = div("hello"),
                                `show this one` = div("tab 2")
                              )) {
  input_list <- list(index = seq_along(named_list), value = named_list, name = names(named_list))
  list_el <- pmap(input_list, function(index, value, name) {
    link_el <- tags$a(
      class = "tab-control",
      href = glue::glue("#tab-{index}"),
      tags$h3(name)
    )
    if (index == 1) {
      list_el <- tags$li(class = "active", link_el)
    } else {
      list_el <- tags$li(link_el)
    }
  })

  content_el <- pmap(input_list, function(index, value, name) {
    tab_id <- glue::glue("tab-{index}")
    if (index == 1) {
      list_el <- tags$div(class = "tab-panel active", value, id = tab_id)
    } else {
      list_el <- tags$div(class = "tab-panel", value, id = tab_id)
    }
  })


  tagList(
    tags$div(
      class = "tabs",
      tags$ul(
        class = "tab-list",
        list_el
      ),
      content_el
    ),
    html_dependency_jq_tabs()
  ) %>%
    shiny::fluidPage() -> out_htm

  browsable(out_htm)
}
