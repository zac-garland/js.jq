create_new_htm_dependency <- function(widget_name){
  widget_name_sc <- snakecase::to_snake_case(widget_name)
  widget_name <- stringr::str_replace_all(widget_name_sc,"_","-")
  usethis::use_directory(glue::glue("inst/lib/{widget_name}"))
  file.edit(glue::glue("inst/lib/{widget_name}/{widget_name}.css"))
  file.edit(glue::glue("inst/lib/{widget_name}/{widget_name}.js"))

  glue::glue("html_dependency_{widget_name_sc} <- function(){{
    htmlDependency(
             '{widget_name}',
             version = '0.01',
             src = 'lib/{widget_name}',
             script = '{widget_name}.js',
             stylesheet = '{widget_name}.css',
             package = '{stringr::str_remove(list.files(pattern = '.Rproj'),'.Rproj')}',
             all_files = TRUE
  )
  }}") %>% styler::style_text()

}


