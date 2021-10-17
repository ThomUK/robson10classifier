ok_dataframe <- data.frame(
    Parity = "Nullipara",
    Previous_CS = "None",
    Onset_Of_Labour = "Spontaneous",
    Number_Of_Fetuses = "Single",
    Gestational_Age = "Term",
    Fetal_Lie_And_Presentation = "Cephalic"
  )

test_that("it throws an error if there is a missing column", {

  problem_dataframe <- data.frame(
    Parity = "Nullipara",
    some_column = 1
  )

  expect_error(
    tgcs_validate_dataframe(problem_dataframe),
    "tgcs_validate_dataframe: The data frame must contain a column named 'Previous_CS'."
  )

})

test_that("it throws an error if any column contains an illegal value", {

  run_illegal_values_test <- function(column_name){

    problem_dataframe <- ok_dataframe
    problem_dataframe[[column_name]] <- "an illegal value"

    expect_error(
        tgcs_validate_dataframe(problem_dataframe),
        paste0(
          "tgcs_validate_dataframe: The data frame column '",
          column_name,
          "' contains the value 'an illegal value', which is not valid.\n",
          "Valid values for this column are:\n"
          # in real life the pasted vector of allowed values goes here...
        )
      )
  }

  purrr::walk(colnames(ok_dataframe), run_illegal_values_test)

})

test_that("it throws an error if dataframe has no rows", {

  problem_dataframe <- data.frame(
    Parity=character(),
    Previous_CS=character(),
    Onset_Of_Labour=character(),
    Number_Of_Fetuses=character(),
    Gestational_Age=character(),
    Fetal_Lie_And_Presentation=character()
  )

  expect_error(
    tgcs_validate_dataframe(problem_dataframe),
    "tgcs_validate_dataframe: The data frame must contain at least one row."
  )

})

test_that("it returns TRUE if all required columns are present", {

  ok_dataframe <- data.frame(
    Parity = "Nullipara",
    Previous_CS = "None",
    Onset_Of_Labour = "Spontaneous",
    Number_Of_Fetuses = "Single",
    Gestational_Age = "Term",
    Fetal_Lie_And_Presentation = "Cephalic"
  )

  expect_equal(tgcs_validate_dataframe(ok_dataframe), TRUE)

})
