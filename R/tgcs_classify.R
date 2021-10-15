tgcs_classify <- function(.data){

  assertthat::assert_that(
    inherits(.data, "data.frame"),
    msg = "tgcs_classify: .data must be a data.frame"
  )

  tgcs_validate_dataframe(.data)

  # prepare a result dataframe with a Robson_Classification column
  result <- .data %>% dplyr::mutate(Robson_Classification = "not yet classified")

  # classify robson group 8
  result[result$Number_Of_Fetuses == "Multiple","Robson_Classification"] <- "8"

  return(result)

}
