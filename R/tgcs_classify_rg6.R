tgcs_classify_rg6 <- function(.data){

  x <- .data

  # label unclassifiable
  condition <- {x$Robson_Classification == "not yet classified" & (is.na(x$Fetal_Lie_And_Presentation) | is.na(x$Parity))}

  if(length(x[condition, ]) > 0){
    x$Robson_Classification[condition] <- "Unclassifiable"
  }

  # label group 6
  condition <- {(x$Robson_Classification == "not yet classified") & (x$Fetal_Lie_And_Presentation == "Breech") & (x$Parity == "Nullipara")}

  if(length(x[condition, ]) > 0){
    x$Robson_Classification[condition] <- "6"
  }

  return(x)

}
