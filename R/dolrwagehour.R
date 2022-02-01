#library for http requests
#library to sanitize strings
#' @import httr
#' @import stringr

# Wage and Hour Divisions
#   - Farm Labor Contractor and Farm Labor
#   - Contractor Employee
#   - Wage and Hour Publication System
#   - WHD Compliance

#' dol_gol
#' @name dol_gol
#' @title dol_gol
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

  # Remove trialing whitespace and convert everything into integers.
  dataset <- paste(str_trim(as.integer(dataset), side = "both"))
  sheet <- paste(str_trim(as.integer(sheet), side = "both"))
  key <- paste(str_trim(as.integer(key), side = "both"))

  data <- switch(dataset,
                 c("flc_cert", "flce_cert"),
                 c("publications_view", "documents_view"),
                 "Compliance/WHD"
                 )
}
