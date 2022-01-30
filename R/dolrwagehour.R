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
#' @description This function queries the US Department of Labor Wage and Hour Divisions Datasets. The datasets currently use V1 of DOL API.
#' @param dataset There are currently 4 datasets to choose from. Specify the one you want with a number from 1-4.
#' @param sheet For each dataset chosen, there are sub sheets within them. You must specify which sub-sheet you want.
#' @param key The API key for this user. You must go to the DOL and sign up for an account and request for an API key.
#' @keywords Wage and Hour Divisions
#' @export
#' @returns A dataframe
dol_whd <- function(dataset = 1, sheet = 1, key = pkg.env$curr.key) {

}
