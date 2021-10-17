tgcs_classify_rg1 <- function(.data){

  x <- .data

  # label unclassifiable
  condition <- {x$Robson_Classification == "not yet classified" & is.na(x$Onset_Of_Labour)}

  if(length(x[condition, ]) > 0){
    x$Robson_Classification[condition] <- "Unclassifiable"
  }

  # label group 1
  condition <- {(x$Robson_Classification == "not yet classified") & (x$Onset_Of_Labour == "Spontaneous")}

  if(length(x[condition, ]) > 0){
    x$Robson_Classification[condition] <- "1"
  }

  return(x)

}
