#library for http requests
#library to sanitize strings
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

#' @name dol_oth
#' @title dol_oth
#' @description This function queries the US Department of Labor Other Datasets. The datasets currently use V1 of DOL API.
#' @param dataset There are currently 10 datasets to choose from. Specify the one you want with a number from 1-10.
#' 1) Sweat and Toil
#' 2) VETS4212
#' 3) VETS100
#' 4) API Metrics (per key)
#' 5) Research And Evaluation Inventory
#' 6) Geography
#' 7) Form
#' 8) Frequently Asked Questions (FAQ)
#' 9) API Metadata
#' 10) Agency
#' @param sheet For each dataset chosen, there are sub sheets within them. You must specify which sub-sheet you want.
#' @param key The API key for this user. You must go to the DOL and sign up for an account and request for an API key.
#' @keywords Other Datasets
#' @export
#' @returns A dataframe
dol_oth <- function(dataset = 1, sheet = 1, key = pkg.env$curr.key) {
  if(is.null(key)) stop("You need to supply the key argument or set a key using dolsetkey()")

  # Remove trialing whitespace and convert everything into integers.
  dataset <- as.integer(str_trim(as.character(dataset), side = "both"))
  sheet <- as.integer(str_trim(as.character(sheet), side = "both"))
  key <- str_trim(as.character(key), side = "both")

  data <- switch(dataset,
                 list("SweatToilAllRegions",
                   "SweatToilAllCountries",
                   "SweatToilAllTerritories",
                   "SweatToilAllAdvancementLevels",
                   "SweatToilAllAssessments",
                   "SweatToilAllSectors",
                   "SweatToilAllGoods",
                   "SweatToilAllCountryGoods",
                   "SweatToilAllStatistics",
                   "SweatToilAllConventions",
                   "SweatToilAllSuggestedActions",
                   "SweatToilAllLegalStandards",
                   "SweatToilAllEnforcements",
                   "SweatToilMechanisms"),
                 list("V4212DataDotGov"),
                 "VETS100",
                 "ApiMetrics/PerKey",
                 "Statistics/REI",
                 "Geography",
                 "FORMS",
                 "FAQ",
                 "APIMetadata",
                 "DOLAgency"
  )

  # This is the V1 API provided by DOL else need to use V2 API.
  if(!is.list(data)) {
    return(query_API_1(data, sheet, key))
  } else {
    return(query_API_2(data, sheet, key))
  }
}
