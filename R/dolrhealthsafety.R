#library for http requests
#library to sanitize strings
#' @import stringr

# Health and Safety
#   - Injuries and Illness
#   - Gulf Oil Spill
#   - DOL OSHA Compliance
#   - MSHA Employment Production
#   - Mine Violation
#   - Fatal Occupational Injuries
#   - DOL OSHA Enforcement
#   - Auto Workers
#   - Safety and Health
#   - Full Mine Information
#   - Basic Mine Information
#   - Mine Accident Injuries
#   - Mine Inspections



#' @name dol_hsd
#' @title dol_hsd
#' @description This function queries the US Department of Labor Health and Safety Datasets. The datasets currently use V1 of DOL API.
#' @param dataset There are currently 13 datasets to choose from. Specify the one you want with a number from 1-13.
#' 1) Injuries and Illness
#' 2) Gulf Oil Spill
#' 3) DOL OSHA Compliance
#' 4) MSHA Employment Production
#' 5) Mine Violation
#' 6) Fatal Occupational Injuries
#' 7) DOL OSHA Enforcement V2
#' 8) Auto Workers
#' 9) Safety and Health
#' 10) Full Mine Information
#' 11) Basic Mine Information
#' 12) Mine Accident Injuries
#' 13) Mine Inspections
#' @param sheet For each dataset chosen, there are sub sheets within them. You must specify which sub-sheet you want. For example,
#' if you chose Gulf Oil Spill, there are the subsheets, 1) OSHA_Direct_Read_Sampling Table as well as 2) OSHA_NOISE_REPORT Table.
#' @param key The API key for this user. You must go to the DOL and sign up for an account and request for an API key.
#' @keywords Health and Safety, Mining
#' @export
#' @returns A dataframe
dol_hsd <- function(dataset = 1, sheet = 1, key = pkg.env$curr.key) {
  if(is.null(key)) stop("You need to supply the key argument or set a key using dolsetkey()")

  # Remove trialing whitespace and convert everything into integers.
  dataset <- as.integer(paste(str_trim(as.character(dataset), side = "both")))
  sheet <- as.integer(paste(str_trim(as.character(sheet), side = "both")))
  key <- paste(str_trim(as.character(key), side = "both"))

  if(dataset <= 0 || dataset >= 14) stop("Dataset number of out of bounds.")

  data <- switch(dataset,
                    'Safety/InjuriesAndIllness',
                    'Safety/GulfOilSpill',
                    'Safety/Fatalities',
                    'Employment',
                    'Mining/Violation',
                    'Safety/FatalOccupationalInjuries',
                    list('accident', 'accident_injury', 'inspection', 'optional_info',
                      'related_activity', 'strategic_codes', 'violation', 'violation_event',
                      'violation_gen_duty_std'),
                    'AutoWorkers',
                    'SafetyHealth',
                    'Mining/FullMineInfo',
                    'Mining/BasicMineInfo',
                    'Safety/Accidents',
                    'Compliance/MineInspection',
                    )

  # This is the V1 API provided by DOL else need to use V2 API.
  if(!is.list(data)) {
    return(query_API_1(data, sheet, key))
  } else {
    return(query_API_2(data, sheet, key))
  }
}
