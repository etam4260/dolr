#library for http requests
#library to sanitize strings
#' @import httr
#' @import stringr

# Other Datasets
#   - Sweat and Toil
#   - VETS4212
#   - VETS100
#   - API Metrics (per key)
#   - Research And Evaluation Inventory
#   - Geography
#   - Form
#   - Frequently Asked Questions (FAQ)
#   - API Metadata
#   - Agency

#' dol_oth
#' @name dol_oth
#' @title dol_oth
#' @description This function queries the US Department of Labor Other Datasets. The datasets currently use V1 of DOL API.
#' @param dataset There are currently 10 datasets to choose from. Specify the one you want with a number from 1-10.
#' @param sheet For each dataset chosen, there are sub sheets within them. You must specify which sub-sheet you want.
#' @param key The API key for this user. You must go to the DOL and sign up for an account and request for an API key.
#' @keywords Other Datasets
#' @export
#' @returns A dataframe
dol_oth <- function(dataset = 1, sheet = 1, key = pkg.env$curr.key) {

}
