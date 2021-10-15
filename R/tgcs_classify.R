tgcs_classify <- function(.data){

  assertthat::assert_that(
    inherits(.data, "data.frame"),
    msg = "tgcs_classify: .data must be a data.frame"
  )

}
