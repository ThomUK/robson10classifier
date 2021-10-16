tgcs_classify_rg10 <- function(.data){

  x <- .data

  # label unclassifiable
  condition <- {x$Robson_Classification == "not yet classified" & is.na(x$Gestational_Age)}

  if(length(x[condition, ]) > 0){
    x$Robson_Classification[condition] <- "Unclassifiable"
  }

  # label group 10
  condition <- {(x$Robson_Classification == "not yet classified") & (x$Gestational_Age == "Preterm")}

  if(length(x[condition, ]) > 0){
    x$Robson_Classification[condition] <- "10"
  }

  return(x)

}
