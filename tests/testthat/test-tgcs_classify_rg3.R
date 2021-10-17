test_that("it correctly classifies robson group 3", {

  Parity <- c("Nullipara", "Multipara", NA)
  Previous_CS <- c("None", "One or more", NA)
  Onset_Of_Labour <- c("Spontaneous", "Induced", "Pre-labour CS", NA)
  Number_Of_Fetuses <- NA
  Gestational_Age <- NA
  Fetal_Lie_And_Presentation <- NA
  Robson_Classification <- "not yet classified"

  data <- tidyr::crossing(Parity, Previous_CS, Onset_Of_Labour, Number_Of_Fetuses, Gestational_Age, Fetal_Lie_And_Presentation, Robson_Classification)

  o <- tgcs_classify_rg3(data)
  expect_equal(nrow(o), 36) # 36 rows in total
  expect_equal(nrow(o[o$Robson_Classification == "3", ]), 1) # 1 row classified as robson 4
  expect_equal(nrow(o[o$Robson_Classification == "Unclassifiable", ]), 24) # 24 rows unclassifiable
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