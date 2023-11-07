#' Add Robson Classification
#'
#' Adds Robson Classifications to a data frame of births, where each birth
#' has details of the 6 obstetric variables recorded.
#'
#' @param .data A data frame containing at least 6 columns, one for each
#' obstetric variable. Additional columns are preserved in the output.
#'
#' @export
#'
#' @return A data frame with Robson Classification added.
#'
#' @importFrom magrittr %>%
#' @import dplyr
#' @import assertthat

tgcs_classify <- function(.data){

  assertthat::assert_that(
    inherits(.data, "data.frame"),
    msg = "tgcs_classify: .data must be a data.frame"
  )

  tgcs_validate_dataframe(.data)

  # prepare a result dataframe with a Robson_Classification column
  result <- .data %>%
    dplyr::mutate(Robson_Classification = "not yet classified", .before = .data$Parity)

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

  # make the robson group column into factors, with a defined order
  result$Robson_Classification <- factor(result$Robson_Classification, levels = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, "Unclassifiable"))

  return(result)

}
