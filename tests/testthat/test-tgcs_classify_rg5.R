test_that("it correctly classifies robson group 5", {

  data <- data.frame(
    Parity = rep(c("Nullipara", "Multipara", NA), each = 3),
    Previous_CS = rep(c("None", "One or more", NA), 3),
    Onset_Of_Labour = NA,
    Number_Of_Fetuses = NA,
    Gestational_Age = NA,
    Fetal_Lie_And_Presentation = NA,
    Robson_Classification = rep(c("not yet classified"), 9)
  )

  o <- tgcs_classify_rg5(data)
  expect_equal(nrow(o), 9) # 9 rows in total
  expect_equal(nrow(o[o$Robson_Classification == "5", ]), 1) # 1 row classified as robson 5
  expect_equal(nrow(o[o$Robson_Classification == "Unclassifiable", ]), 5) # 6 rows unclassifiable
})
