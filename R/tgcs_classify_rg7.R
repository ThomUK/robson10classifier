tgcs_classify_rg7 <- function(.data){

  x <- .data

  # label unclassifiable
  condition <- {x$Robson_Classification == "not yet classified" & (is.na(x$Fetal_Lie_And_Presentation) | is.na(x$Parity))}

  if(length(x[condition, ]) > 0){
    x$Robson_Classification[condition] <- "Unclassifiable"
  }

  # label group 7
  condition <- {(x$Robson_Classification == "not yet classified") & (x$Fetal_Lie_And_Presentation == "Breech") & (x$Parity == "Multipara")}

  if(length(x[condition, ]) > 0){
    x$Robson_Classification[condition] <- "7"
  }

  return(x)

}
