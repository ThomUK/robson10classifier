tgcs_validate_dataframe <- function(.data){

  # check for zero rows
  if(nrow(.data) == 0){
    stop("tgcs_validate_dataframe: ",
         "The data frame must contain at least one row."
    )
  }

  # check for missing columns
  check_missing_column <- function(column_name) {
    if (column_name %in% colnames(.data)) {
      return(TRUE)
    }
    stop("tgcs_validate_dataframe: ",
         "The data frame must contain a column named '", column_name, "'."
    )
  }

  # do the column check
  check_missing_column("Parity")
  check_missing_column("Previous_CS")
  check_missing_column("Onset_Of_Labour")
  check_missing_column("Number_Of_Fetuses")
  check_missing_column("Gestational_Age")
  check_missing_column("Fetal_Lie_And_Presentation")

  # check for illegal values in columns
  check_column_values <- function(column_name, values_to_check){

    allowed_values <- list(
      Parity = c("Nullipara", "Multipara", NA),
      Previous_CS = c("None", "One or more", NA),
      Onset_Of_Labour = c("Spontaneous", "Induced", "Pre-labour CS", NA),
      Number_Of_Fetuses = c("Multiple", "Single", NA),
      Gestational_Age = c("Term", "Preterm", NA),
      Fetal_Lie_And_Presentation = c("Cephalic", "Breech", "Transverse or Oblique lie", NA)
    )

    for(i in 1:length(values_to_check)){
      if(!values_to_check[i] %in% allowed_values[[column_name]]) {
        stop(
          "tgcs_validate_dataframe: The data frame column '",
          column_name,
          "' contains the value '",
          values_to_check[i],
          "', which is not valid.\n",
          "Valid values for this column are:\n",
          paste(allowed_values[[column_name]], collapse = ", ")
        )
      }
    }
  }

  # do the check for illegal values
  check_column_values("Parity", .data$Parity)
  check_column_values("Previous_CS", .data$Previous_CS)
  check_column_values("Onset_Of_Labour", .data$Onset_Of_Labour)
  check_column_values("Number_Of_Fetuses", .data$Number_Of_Fetuses)
  check_column_values("Gestational_Age", .data$Gestational_Age)
  check_column_values("Fetal_Lie_And_Presentation", .data$Fetal_Lie_And_Presentation)

  return(TRUE)

}
