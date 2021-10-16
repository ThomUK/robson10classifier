test_that("it correctly classifies robson group 2", {

  data <- data.frame(
    Parity = NA,
    Previous_CS = NA,
    Onset_Of_Labour <- rep(c("Spontaneous", "Induced", "Pre-labour CS", NA), 2),
    Number_Of_Fetuses = NA,
    Gestational_Age = NA,
    Fetal_Lie_And_Presentation = NA,
    Robson_Classification = "not yet classified"
  )

  o <- tgcs_classify_rg2(data)
  expect_equal(nrow(o), 8) # 8 rows in total
  expect_equal(nrow(o[o$Robson_Classification == "2", ] ), 4) # 4 rows classified as robson 2
  expect_equal(nrow(o[o$Robson_Classification == "Unclassifiable", ]), 2) # 2 rows unclassifiable
})
