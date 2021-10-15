test_that("it throws an error if .data is not a data.frame", {
  expect_error(tgcs_classify("not a data frame"), "tgcs_classify: .data must be a data.frame")
})