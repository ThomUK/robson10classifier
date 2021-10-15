library(mockery)

data <- data.frame(
    Parity = 1,
    Previous_CS = 1,
    Onset_Of_Labour = 1,
    Number_Of_Fetuses = 1,
    Gestational_Age = 1,
    Fetal_Lie_And_Presentation = 1
  )

test_that("it throws an error if .data is not a data.frame", {
  expect_error(tgcs_classify("not a data frame"), "tgcs_classify: .data must be a data.frame")
})

test_that("it calls tgcs_validate_dataframe()", {

  m <- mock("tgcs_validate_dataframe")
  stub(tgcs_classify, "tgcs_validate_dataframe", m)

  tgcs_classify(data)

  expect_called(m, 1)
  expect_args(m, 1, data)

})

test_that("it returns a data frame with a column for classification", {
  o <- tgcs_classify(data)
  expect_equal("Robson_Classification" %in% colnames(o), TRUE)
})

test_that("it correctly classifies robson group 8", {

  data <- data.frame(
    Parity = NA,
    Previous_CS = NA,
    Onset_Of_Labour = NA,
    Number_Of_Fetuses = rep(c("Multiple", "Single"), 2),
    Gestational_Age = NA,
    Fetal_Lie_And_Presentation = NA
  )

  o <- tgcs_classify(data)
  expect_equal(nrow(o[o$Robson_Classification == "8", ]), 2) # 2 rows classified as robson 8
})
