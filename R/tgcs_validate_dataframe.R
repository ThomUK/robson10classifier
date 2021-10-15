tgcs_validate_dataframe <- function(.data){

  check <- function(op) {
    if (op %in% colnames(.data)) {
      return(TRUE)
    }
    stop("tgcs_validate_dataframe: ",
         "The data frame must contain a column named '", op, "'."
    )
  }

  # check for zero rows
  if(nrow(.data) == 0){
    stop("tgcs_validate_dataframe: ",
         "The data frame must contain at least one row."
    )
  }

  # required columns
  check("Parity")
  check("Previous_CS")
  check("Onset_Of_Labour")
  check("Number_Of_Fetuses")
  check("Gestational_Age")
  check("Fetal_Lie_And_Presentation")

  return(TRUE)

}
