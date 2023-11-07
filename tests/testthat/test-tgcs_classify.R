library(mockery)

data <- data.frame(
    Parity = "Nullipara",
    Previous_CS = "None",
    Onset_Of_Labour = "Spontaneous",
    Number_Of_Fetuses = "Single",
    Gestational_Age = "Term",
    Fetal_Lie_And_Presentation = "Cephalic"
  )

test_that("it throws an error if .data is not a data.frame", {
  expect_error(tgcs_classify("not a data frame"), "tgcs_classify: .data must be a data.frame")
})

test_that("it calls tgcs_validate_dataframe()", {

  m <- mock("tgcs_validate_dataframe")
  stub(tgcs_classify, "tgcs_validate_dataframe", m)

  tgcs_classify(data)

  expect_called(m, 1)
  expect_args(m, 1, data)

})

test_that("it returns a data frame with a column for classification", {
  o <- tgcs_classify(data)
  expect_equal("Robson_Classification" %in% colnames(o), TRUE)
})

test_that("the returned robson classification column is a factor", {
  o <- tgcs_classify(data)
  expect_equal(class(o$Robson_Classification), "factor")
})

test_that("it can classify every combination of the 6 obstetric variables", {

  # define all possible levels for each obstetric variable
  Parity <- c("Nullipara", "Multipara", NA)
  Previous_CS <- c("None", "One or more", NA)
  Onset_Of_Labour <- c("Spontaneous", "Induced", "Pre-labour CS", NA)
  Number_Of_Fetuses <- c("Multiple", "Single", NA)
  Gestational_Age <- c("Term", "Preterm", NA)
  Fetal_Lie_And_Presentation <- c("Cephalic", "Breech", "Transverse or Oblique lie", NA)

  # combine them to give a data frame of all 1296 mathematically possible combinations
  # note not all combinations make physical sense (eg. Nullipara with previous CS)
  data <- tidyr::crossing(Parity, Previous_CS, Onset_Of_Labour, Number_Of_Fetuses, Gestational_Age, Fetal_Lie_And_Presentation)

  o <- tgcs_classify(data)
  expect_equal(nrow(o[o$Robson_Classification == "Unclassifiable", ]), 635)
  expect_equal(nrow(o[o$Robson_Classification == "1", ]), 2)
  expect_equal(nrow(o[o$Robson_Classification == "2", ]), 4)
  expect_equal(nrow(o[o$Robson_Classification == "3", ]), 1)
  expect_equal(nrow(o[o$Robson_Classification == "4", ]), 2)
  expect_equal(nrow(o[o$Robson_Classification == "5", ]), 4)
  expect_equal(nrow(o[o$Robson_Classification == "6", ]), 36)
  expect_equal(nrow(o[o$Robson_Classification == "7", ]), 36)
  expect_equal(nrow(o[o$Robson_Classification == "8", ]), 432)
  expect_equal(nrow(o[o$Robson_Classification == "9", ]), 108)
  expect_equal(nrow(o[o$Robson_Classification == "10", ]), 36)

})
