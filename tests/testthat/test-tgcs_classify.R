library(mockery)

test_that("it throws an error if .data is not a data.frame", {
  expect_error(tgcs_classify("not a data frame"), "tgcs_classify: .data must be a data.frame")
})

test_that("it calls tgcs_validate_dataframe()", {

  data <- data.frame()

  m <- mock("tgcs_validate_dataframe")
  stub(tgcs_classify, "tgcs_validate_dataframe", m)

  tgcs_classify(data)

  expect_called(m, 1)
  expect_args(m, 1, data)

})