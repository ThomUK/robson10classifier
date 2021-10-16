test_that("it correctly classifies robson group 8", {

  data <- data.frame(
    Parity = NA,
    Previous_CS = NA,
    Onset_Of_Labour = NA,
    Number_Of_Fetuses = rep(c("Multiple", "Single", NA), 2),
    Gestational_Age = NA,
    Fetal_Lie_And_Presentation = NA,
    Robson_Classification = rep(c("not yet classified"), 6)
  )

  o <- tgcs_classify_rg8(data)
  expect_equal(nrow(o), 6) # 6 rows in total
  expect_equal(nrow(o[o$Robson_Classification == "8", ] ), 2) # 2 rows classified as robson 8
  expect_equal(nrow(o[o$Robson_Classification == "Unclassifiable", ]), 2) # 2 rows unclassifiable
})
