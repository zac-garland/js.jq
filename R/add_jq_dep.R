add_jq_dep <- function(x){

  x <- htmltools::attachDependencies(x,rmarkdown::html_dependency_jquery(),append = TRUE)
  x <- htmltools::attachDependencies(x,rmarkdown::html_dependency_jqueryui(),append = TRUE)
  x


}
