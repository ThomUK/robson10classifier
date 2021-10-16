tgcs_classify_rg9 <- function(.data){

  x <- .data

  # label unclassifiable
  condition <- {x$Robson_Classification == "not yet classified" & is.na(x$Fetal_Lie_And_Presentation)}

  if(length(x[condition, ]) > 0){
    x$Robson_Classification[condition] <- "Unclassifiable"
  }

  # label group 9
  condition <- {(x$Robson_Classification == "not yet classified") & (x$Fetal_Lie_And_Presentation == "Transverse or Oblique lie")}

  if(length(x[condition, ]) > 0){
    x$Robson_Classification[condition] <- "9"
  }

  return(x)

}
