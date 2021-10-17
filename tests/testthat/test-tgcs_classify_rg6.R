test_that("it correctly classifies robson group 6", {

  data <- data.frame(
    Parity = rep(c("Nullipara", "Multipara", NA), each = 4),
    Previous_CS = NA,
    Onset_Of_Labour = NA,
    Number_Of_Fetuses = NA,
    Gestational_Age = NA,
    Fetal_Lie_And_Presentation = rep(c("Cephalic", "Breech", "Transverse or Oblique lie", NA), 3),
    Robson_Classification = rep(c("not yet classified"), 12)
  )

  o <- tgcs_classify_rg6(data)
  expect_equal(nrow(o), 12) # 12 rows in total
  expect_equal(nrow(o[o$Robson_Classification == "6", ]), 1) # 1 row classified as robson 7
  expect_equal(nrow(o[o$Robson_Classification == "Unclassifiable", ]), 6) # 6 rows unclassifiable
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