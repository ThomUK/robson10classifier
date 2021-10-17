test_that("it correctly classifies robson group 1", {

  data <- data.frame(
    Parity = NA,
    Previous_CS = NA,
    Onset_Of_Labour <- rep(c("Spontaneous", "Induced", "Pre-labour CS", NA), 2),
    Number_Of_Fetuses = NA,
    Gestational_Age = NA,
    Fetal_Lie_And_Presentation = NA,
    Robson_Classification = "not yet classified"
  )

  o <- tgcs_classify_rg1(data)
  expect_equal(nrow(o), 8) # 8 rows in total
  expect_equal(nrow(o[o$Robson_Classification == "1", ] ), 2) # 2 rows classified as robson 1
  expect_equal(nrow(o[o$Robson_Classification == "Unclassifiable", ]), 2) # 2 rows unclassifiable
})

test_that("it does not alter existing classifications", {

  data <- data.frame(
    Parity = NA,
    Previous_CS = NA,
    Onset_Of_Labour = NA,
    Number_Of_Fetuses = NA,
    Gestational_Age = NA,
    Fetal_Lie_And_Presentation = NA,
    Robson_Classification = c("1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "Unclassifiable")
  )

  o <- tgcs_classify_rg10(data)
  expect_equal(nrow(o), 11) # 11 rows in total
  expect_equal(o$Robson_Classification, c("1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "Unclassifiable"))
})