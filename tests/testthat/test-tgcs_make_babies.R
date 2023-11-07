test_that("qty argument is an integer", {

  expect_error(
    tgcs_make_babies(qty = 2.1),
    "tgcs_make_babies: The qty argument must be an integer."
  )

})

test_that("with_id argument is a logical value", {

  expect_error(
    tgcs_make_babies(with_id = "nope"),
    "tgcs_make_babies: The with_id argument must be logical \\(TRUE or FALSE\\)."
  )

})

test_that("it returns a dataframe with the correct number of columns", {
  o1 <- tgcs_make_babies()
  o2 <- tgcs_make_babies(with_id = TRUE)

  expect_equal(class(o1), "data.frame")
  expect_equal(ncol(o1), 6)
  expect_equal(ncol(o2), 7)

})

test_that("it returns a dataframe with the correct number of rows", {
  o1 <- tgcs_make_babies()
  o2 <- tgcs_make_babies(10)
  o3 <- tgcs_make_babies(qty = 20)

  expect_equal(class(o1), "data.frame")
  expect_equal(nrow(o1), 1)

  expect_equal(class(o2), "data.frame")
  expect_equal(nrow(o2), 10)

  expect_equal(class(o3), "data.frame")
  expect_equal(nrow(o3), 20)

})

test_that("it returns a valid dataframe containing the expected obstetric variables", {

  o <- tgcs_make_babies(10)
  expect_equal(tgcs_validate_dataframe(o), TRUE)

})
