tgcs_classify_rg8 <- function(.data){

  x <- .data

  # label unclassifiable
  condition <- {x$Robson_Classification == "not yet classified" & is.na(x$Number_Of_Fetuses)}

  if(length(x[condition, ]) > 0){
    x$Robson_Classification[condition] <- "Unclassifiable"
  }

  # label group 8
  condition <- {(x$Robson_Classification == "not yet classified") & (x$Number_Of_Fetuses == "Multiple")}

  if(length(x[condition, ]) > 0){
    x$Robson_Classification[condition] <- "8"
  }

  return(x)

}
