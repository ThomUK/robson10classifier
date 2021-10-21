#' Make Babies
#'
#' Make a dataframe of simulated births, suitable for use testing and
#' demonstrating the {robson10classifier} package.  Each row of the returned
#' dataframe represents a birth.  Optionally, an ID column can also be included.
#'
#' @param qty In integer representing the number of births to create.
#' @param with_id logical. Would you like to create a unique ID column.
#' The ID numbers are sequential, starting at 1.
#'
#' @export
#'
#' @return A data frame of simulated births data.
#'
tgcs_make_babies <- function(qty = 1, with_id = FALSE){

  if(isFALSE(as.integer(qty) == qty)) stop("tgcs_make_babies: The qty argument must be an integer.")

  if(!is.logical(with_id)) stop("tgcs_make_babies: The with_id argument must be logical (TRUE or FALSE).")

  dtf <- data.frame(
    Parity = sample(c("Nullipara", "Multipara", NA), prob = c(0.25, 0.7, 0.05), size = qty, replace = TRUE),
    Previous_CS = sample(c("None", "One or more", NA), prob = c(0.8, 0.1, 0.1), size = qty, replace = TRUE),
    Onset_Of_Labour = sample(c("Spontaneous", "Pre-labour CS", "Induced", NA), prob = c(0.5, 0.2, 0.2, 0.1), size = qty, replace = TRUE),
    Number_Of_Fetuses = sample(c("Multiple", "Single", NA), prob = c(0.1, 0.8, 0.1), size = qty, replace = TRUE),
    Gestational_Age = sample(c("Term", "Preterm", NA), prob = c(0.8, 0.1, 0.1), size = qty, replace = TRUE),
    Fetal_Lie_And_Presentation = sample(c("Cephalic", "Breech", "Transverse or Oblique lie", NA), prob = c(0.6, 0.2, 0.1, 0.1), size = qty, replace = TRUE)
  )

  if(with_id){

    # add an id column
    dtf[["ID"]] <- (1:qty)

    # make the id col the first
    dtf <- dtf[, c(7, 1:6)]

  }

  return(dtf)

}
