#library for http requests
#library to sanitize strings
#' @import stringr

# Wage and Hour Divisions
#   - Farm Labor Contractor and Farm Labor
#   - Contractor Employee
#   - Wage and Hour Publication System
#   - WHD Compliance


#' @name dol_whd
#' @title dol_whd
#' @description This function queries the US Department of Labor Wage and Hour Divisions Datasets. The datasets currently use V2 of DOL API.
#' @param dataset There are currently 3 datasets to choose from. Specify the one you want with a number from 1-3.
#' 1) Farm Labor Contractor and Farm Labor
#' 2) Contractor Employee
#' 3) Wage and Hour Publication System
#' 4) WHD Compliance
#' @param sheet For each dataset chosen, there are sub sheets within them. You must specify which sub-sheet you want.
#' @param key The API key for this user. You must go to the DOL and sign up for an account and request for an API key.
#' @keywords Wage and Hour Divisions
#' @export
#' @returns A dataframe
dol_whd <- function(dataset = 1, sheet = 1, key = pkg.env$curr.key) {
  if(is.null(key)) stop("You need to supply the key argument or set a key using dolsetkey()")

  # Remove trialing whitespace and convert everything into integers.
  dataset <- as.integer(paste(str_trim(as.character(dataset), side = "both")))
  sheet <- as.integer(paste(str_trim(as.character(sheet), side = "both")))
  key <- paste(str_trim(as.character(key), side = "both"))

  data <- switch(dataset,
                 list("flc_cert", "flce_cert"),
                 list("publications_view", "documents_view"),
                 "Compliance/WHD"
                 )

  # This is the V1 API provided by DOL else need to use V2 API.
  if(!is.list(data)) {
    return(query_API_1(data, sheet, key))
  } else {
    return(query_API_2(data, sheet, key))
  }
}
