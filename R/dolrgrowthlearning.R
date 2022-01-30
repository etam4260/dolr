#library for http requests
#library to sanitize strings
#' @import httr
#' @import stringr

# Expanding Growth Opportunities and Learning
#   - OIT Initial Claims
#   - OUI Initial Claims V1
#   - IPIA V1
#   - Quarterly Census Employment and Wage (CEW) V1
#   - Occupational Employment Statistics Survey (OES) V1
#   - Current Population Survey (CPS) V1
#   - Current Employment Statistics (CES) V1
#   - Consumer Price Indexes (CPI) V1
#   - 2010 Workforce Investment Act V1
#   - 2010 Occupational Employment Statistics V1
#   - BLS Numbers V1


#' dol_gol
#' @name dol_gol
#' @title dol_gol
#' @description This function queries the US Department of Labor Expanding Growth Opportunities and Learning Datasets. The datasets currently use V1 of DOL API.
#' @param dataset There are currently 11 datasets to choose from. Specify the one you want with a number from 1-11.
#' @param sheet For each dataset chosen, there are sub sheets within them. You must specify which sub-sheet you want.
#' @param key The API key for this user. You must go to the DOL and sign up for an account and request for an API key.
#' @keywords Expanding Growth Opportunities and Learning
#' @export
#' @returns A dataframe
dol_gol <- function(dataset = 1, sheet = 1, key = pkg.env$curr.key) {

}
