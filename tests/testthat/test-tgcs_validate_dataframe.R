test_that("it throws an error if there is a missing column", {

  problem_dataframe <- data.frame(
    Parity = 1,
    some_column = 1
  )

  expect_error(
    tgcs_classify(problem_dataframe),
    "tgcs_validate_dataframe: The data frame must contain a column named 'Previous_CS'."
  )

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
    tgcs_classify(problem_dataframe),
    "tgcs_validate_dataframe: The data frame must contain at least one row."
  )

})

test_that("it returns TRUE if all required columns are present", {

  ok_dataframe <- data.frame(
    Parity = 1,
    Previous_CS = 1,
    Onset_Of_Labour = 1,
    Number_Of_Fetuses = 1,
    Gestational_Age = 1,
    Fetal_Lie_And_Presentation = 1
  )

  expect_equal(tgcs_classify(ok_dataframe), TRUE)

})
