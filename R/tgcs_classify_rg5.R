tgcs_classify_rg5 <- function(.data){

  x <- .data

  # label unclassifiable
  condition <- {x$Robson_Classification == "not yet classified" & (is.na(x$Parity) | is.na(x$Previous_CS))}

  if(length(x[condition, ]) > 0){
    x$Robson_Classification[condition] <- "Unclassifiable"
  }

  # label group 5
  condition <- {(x$Robson_Classification == "not yet classified") & (x$Parity == "Multipara") & (x$Previous_CS == "One or more")}

  if(length(x[condition, ]) > 0){
    x$Robson_Classification[condition] <- "5"
  }

  return(x)

}
