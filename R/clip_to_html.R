clip_to_html <- function() {
  clip_in <- clipr::read_clip() %>%
    paste(collapse = "") %>%
    str_squish() %>%
    HTML()

  charpente::html_2_R(clip_in) %>%
    capture.output(type = "message") %>%
    .[-c(1:6)] %>%
    clipr::write_clip()

  charpente::html_2_R(clip_in)
  message("copied to clipboard")

}
