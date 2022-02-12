# Using edit distance on user inputs to allow them to specify the name of the dataset and sheet
# that they want to access. Will return the closest matching datasets and sheet associated
# with text entry.



#' @name guess_dataset_sheet
#' @title guess_dataset_sheet
#' @description This function determines what dataset/sheet the user likely selected
#'   from a list of available datasets and sheet in this library.
#' @param dataset A list of dataset are shown at https://developer.dol.gov/dataset/
#' @param sheet For each dataset chosen, there are sub sheets within them.
#'   You must specify which sub-sheet you want. Look up the corresponding sheet
#'   at https://developer.dol.gov/dataset/.
#' @returns The guessed dataset and sheet.
guess_dataset_sheet <- function(dataset, sheet) {
  dataset <- tolower(dataset)
  sheet <- tolower(sheet)

  scores <- adist(dataset, ls(datasets))
  guessed_set <- ls(datasets)[which.min(scores)]

  if(which.min(scores) > 4) warning(paste("Your **dataset** input doesn't seem to match anything we have in store. I'll take a guess. Assuming it is ", guessed_set, ".", sep = ""))

  scores < adist(sheet, datasets[[guessed_set]])
  guessed_sheet  <- datasets[[guessed_set]][which.min(scores)]

  if(which.min(scores) > 4) warning(paste("Your *sheet* input doesn't seem to match anything we have in store. I'll take a guess. Assuming it is", guessed_sheet, ".", sep = ""))

  # return both the dataset and the sheet.
  return(c(guessed_set, guessed_sheet))
}


#' @name dol
#' @title dol
#' @description This function queries the US Department of Labor Wage and Hour
#'   Divisions Datasets. This is the base function where users supply the name
#'   of the dataset as well as the sheet that they want. This is built to
#'   autocorrect for spelling errors that could arise and warn users.
#'   Some abbreviations are supported.
#' @param dataset A list of dataset are shown at https://developer.dol.gov/dataset/
#' @param sheet For each dataset chosen, there are sub sheets within them.
#'   You must specify which sub-sheet you want. Look up the corresponding sheet
#'   at https://developer.dol.gov/dataset/.
#' @param key The API key for this user. You must go to the DOL and sign up
#'   for an account and request for an API key.
#' @export
#' @returns A dataframe
dol <- function(dataset, sheet, key = Sys.getenv("DOL_KEY")) {
  dataset_sheet <- guess_dataset_sheet(dataset, sheet)
  if(dataset_sheet[1] %in% HS){
    dol_hsd(which(HS == dataset_sheet[1])[[1]], which(dataset[[dataset_sheet[1]]] == dataset_sheet[2])[[1]], key)
  } else if(dataset_sheet[1] %in% WH) {
    dol_whd(which(WH == dataset_sheet[1])[[1]], which(dataset[[dataset_sheet[1]]] == dataset_sheet[2])[[1]], key)
  } else if(dataset_sheet[1] %in% GL) {
    dol_gol(which(GL == dataset_sheet[1])[[1]], which(dataset[[dataset_sheet[1]]] == dataset_sheet[2])[[1]], key)
  } else if(dataset_sheet[1] %in% OT) {
    dol_oth(which(OT == dataset_sheet[1])[[1]], which(dataset[[dataset_sheet[1]]] == dataset_sheet[2])[[1]], key)
  }
}
