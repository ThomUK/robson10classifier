test_that("it correctly classifies robson group 10", {

  data <- data.frame(
    Parity = NA,
    Previous_CS = NA,
    Onset_Of_Labour = NA,
    Number_Of_Fetuses = NA,
    Gestational_Age = rep(c("Term", "Preterm", NA), 2),
    Fetal_Lie_And_Presentation = NA,
    Robson_Classification = rep(c("not yet classified"), 6)
  )

  o <- tgcs_classify_rg10(data)
  expect_equal(nrow(o), 6) # 6 rows in total
  expect_equal(nrow(o[o$Robson_Classification == "10", ] ), 2) # 2 rows classified as robson 10
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
