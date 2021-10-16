tgcs_classify_rg2 <- function(.data){

  x <- .data

  # label unclassifiable
  condition <- {x$Robson_Classification == "not yet classified" & is.na(x$Onset_Of_Labour)}

  if(length(x[condition, ]) > 0){
    x$Robson_Classification[condition] <- "Unclassifiable"
  }

  # label group 2
  condition <- {(x$Robson_Classification == "not yet classified") & ((x$Onset_Of_Labour == "Induced") | (x$Onset_Of_Labour == "Pre-labour CS"))}

  if(length(x[condition, ]) > 0){
    x$Robson_Classification[condition] <- "2"
  }

  return(x)

}
