tgcs_classify_rg3 <- function(.data){

  x <- .data

  # label unclassifiable
  condition <- {x$Robson_Classification == "not yet classified" & (is.na(x$Parity) | is.na(x$Previous_CS) | is.na(x$Onset_Of_Labour))}

  if(length(x[condition, ]) > 0){
    x$Robson_Classification[condition] <- "Unclassifiable"
  }

  # label group 3
  condition <- {(x$Robson_Classification == "not yet classified") & (x$Parity == "Multipara") & (x$Previous_CS == "None") & (x$Onset_Of_Labour == "Spontaneous")}

  if(length(x[condition, ]) > 0){
    x$Robson_Classification[condition] <- "3"
  }

  return(x)

}
