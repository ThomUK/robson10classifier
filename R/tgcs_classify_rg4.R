tgcs_classify_rg4 <- function(.data){

  x <- .data

  # label unclassifiable
  condition <- {x$Robson_Classification == "not yet classified" & (is.na(x$Parity) | is.na(x$Previous_CS) | is.na(x$Onset_Of_Labour))}

  if(length(x[condition, ]) > 0){
    x$Robson_Classification[condition] <- "Unclassifiable"
  }

  # label group 4
  condition <- {(x$Robson_Classification == "not yet classified") & (x$Parity == "Multipara") & (x$Previous_CS == "None") & (x$Onset_Of_Labour == "Induced" | x$Onset_Of_Labour == "Pre-labour CS")}

  if(length(x[condition, ]) > 0){
    x$Robson_Classification[condition] <- "4"
  }

  return(x)

}
