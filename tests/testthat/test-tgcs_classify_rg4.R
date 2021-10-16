test_that("it correctly classifies robson group 4", {

  Parity <- c("Nullipara", "Multipara", NA)
  Previous_CS <- c("None", "One or more", NA)
  Onset_Of_Labour <- c("Spontaneous", "Induced", "Pre-labour CS", NA)
  Number_Of_Fetuses <- NA
  Gestational_Age <- NA
  Fetal_Lie_And_Presentation <- NA
  Robson_Classification <- "not yet classified"

  data <- tidyr::crossing(Parity, Previous_CS, Onset_Of_Labour, Number_Of_Fetuses, Gestational_Age, Fetal_Lie_And_Presentation, Robson_Classification)

  o <- tgcs_classify_rg4(data)
  expect_equal(nrow(o), 36) # 36 rows in total
  expect_equal(nrow(o[o$Robson_Classification == "4", ]), 2) # 2 row classified as robson 4
  expect_equal(nrow(o[o$Robson_Classification == "Unclassifiable", ]), 24) # 24 rows unclassifiable
})
