tgcs_classify <- function(.data){

  assertthat::assert_that(
    inherits(.data, "data.frame"),
    msg = "tgcs_classify: .data must be a data.frame"
  )

  tgcs_validate_dataframe(.data)

  # prepare a result dataframe with a Robson_Classification column
  result <- .data %>%
    dplyr::mutate(Robson_Classification = "not yet classified")

  result <- result %>%
    tgcs_classify_rg8() %>%
    tgcs_classify_rg9() %>%
    tgcs_classify_rg7() %>%
    tgcs_classify_rg6() %>%
    tgcs_classify_rg10() %>%
    tgcs_classify_rg5() %>%
    tgcs_classify_rg4() %>%
    tgcs_classify_rg3() %>%
    tgcs_classify_rg2() %>%
    tgcs_classify_rg1()

  return(result)

}
