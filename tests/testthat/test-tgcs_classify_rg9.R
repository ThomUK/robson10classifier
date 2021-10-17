test_that("it correctly classifies robson group 9", {

  data <- data.frame(
    Parity = NA,
    Previous_CS = NA,
    Onset_Of_Labour = NA,
    Number_Of_Fetuses = NA,
    Gestational_Age = NA,
    Fetal_Lie_And_Presentation = rep(c("Cephalic", "Breech", "Transverse or Oblique lie", NA), 2),
    Robson_Classification = rep(c("not yet classified"), 8)
  )

  o <- tgcs_classify_rg9(data)
  expect_equal(nrow(o), 8) # 8 rows in total
  expect_equal(nrow(o[o$Robson_Classification == "9", ]), 2) # 2 rows classified as robson 9
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