# Using edit distance on user inputs to allow them to specify the name of the dataset and sheet
# that they want to access. Will return the closest matching datasets and sheet associated
# with text entry. 

# Using environments in R as a hashmap for retrieving dataset-sheet relationships.
datasets <- new.env(parent = emptyenv())

# Health and Safety
HS <- c("Injuries And Illness", "Gulf Oil Spill",
                      "DOL OSHA Compliance", "MSHA Employment Production",
                      "Mine Violation", "Fatal Occupational Injuries",
                      "DOL OSHA Enforcement", "Auto Workers",
                      "Safety and Health", "Full Mine Information Mines",
                      "Basic Mine Information", "Mine Accident Injuries",
                      "Mine Inspections"
                      )
data_hs <- c('Safety/InjuriesAndIllness',
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
             'Compliance/MineInspection'
)
datasets[["Injuries And Illness"]] <- c() 
datasets[["Gulf Oil Spill"]] <- c()
datasets[["DOL OSHA Compliance"]] <- c() 
datasets[["MSHA Employment Production"]] <- c()
datasets[["Mine Violation"]] <- c()
datasets[["Fatal Occupational Injuries"]] <- c()
datasets[["DOL OSHA Enforcement"]] <- c()
datasets[["Auto Workers"]] <- c()
datasets[["Safety and Health"]] <- c()
datasets[["Full Mine Information Mines"]] <- c()
datasets[["Basic Mine Information"]] <- c()
datasets[["Mine Accident Injuries "]] <- c()
datasets[["Mine Inspections "]] <- c()


# Wage and Hour
WH <- c("Farm Labor Contractor and Farm Labor Contractor Employee", 
                      "Wage and Hour Publications System",
                      "WHD Compliance")
data_wh <- c(list("flc_cert", "flce_cert"),
             list("publications_view", "documents_view"),
             "Compliance/WHD"
)
datasets[["Farm Labor Contractor and Farm Labor Contractor Employee"]] <- c()
datasets[["Wage and Hour Publications System"]] <- c()
datasets[["WHD Compliance"]] <- c() 



# Growth and Learning
GL <- c("Public Workforce System", "OUI Initial Claims", "IPIA",
                      "Quarterly Census Employment and Wage", "Occupational Employment Statistics Survey",
                      "Current Population Survey", "Current Employment Statistics",
                      "Consumer Price Indexes", "2010 Workforce Investment Act",
                      "2010 Occupational Employment Statistics", "BLS Numbers"
                      )
data_gl <- c('Statistics/PWSD',
             'Statistics/OUI_InitialClaims',
             'IPIA',
             'Statistics/CEW',
             'Statistics/OES/$metadata',
             'Statistics/CPS',
             'Statistics/CES',
             'Statistics/CPI',
             'Statistics/WIA',
             'Statistics/OES2010',
             'statistics/BLS_Numbers'
)
datasets[["Public Workforce System"]] <- c()
datasets[["OUI Initial Claims"]] <- c()
datasets[["IPIA"]] <- c() 
datasets[["Quarterly Census Employment and Wage"]] <- c()
datasets[["Occupational Employment Statistics Survey"]] <- c()
datasets[["Current Population Survey"]] <- c()
datasets[["Current Employment Statistics"]] <- c()
datasets[["Consumer Price Indexes"]] <- c()
datasets[["2010 Workforce Investment Act"]] <- c()
datasets[["2010 Occupational Employment Statistics"]] <- c()
datasets[["BLS Numbers"]] <- c()

datasets[["PWSD"]] <- datasets[["Public Workforce System"]]
datasets[["OUI"]] <- datasets[["OUI Initial Claims"]] 
datasets[["CEW"]] <- datasets[["Quarterly Census Employment and Wage"]]
datasets[["OES"]] <- datasets[["Occupational Employment Statistics Survey"]] 
datasets[["CPS"]] <- datasets[["Current Population Survey"]]
datasets[["CES"]] <- datasets[["Current Employment Statistics"]]
datasets[["CPI"]] <- datasets[["Consumer Price Indexes"]] 
datasets[["WIA"]] <- datasets[["2010 Workforce Investment Act"]]
datasets[["OES2010"]] <- datasets[["2010 Occupational Employment Statistics"]]
datasets[["BLS"]] <- datasets[["BLS Numbers"]]



# Other
OT <- c("Sweat & Toil", "VETS4212", "VETS100",
                      "API Metrics", "Research And Evaluation Inventory", "Geography",
                      "Form", "Frequently Asked Questions", "API Metadata",
                      "Agency"
                      )
data_ot <- c(list("SweatToilAllRegions",
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
datasets[["Sweat & Toil"]] <- c()
datasets[["VETS4212"]] <- c()
datasets[["VETS100"]] <- c() 
datasets[["API Metrics"]] <- c()
datasets[["Research And Evaluation Inventory"]] <- c()
datasets[["REI"]] <- datasets[["Research And Evaluation Inventory"]]
datasets[["Geography"]] <- c()
datasets[["Form"]] <- c()
datasets[["Frequently Asked Questions"]] <- c()
datasets[["FAQ"]] <- datasets[["Frequently Asked Questions"]] 
datasets[["API Metadata"]] <- c()
datasets[["Agency"]] <- c()




# Helper function for guessing the dataset that the user inputted using edit distance.  
guess_dataset_sheet <- function(dataset, sheet) {
  scores <- adist(dataset, ls(datasets))
  guessed_set <- ls(datasets)[which.min(scores)]
  
  if(which.min(scores) != 0) warning(paste("Your **dataset** input doesn't seem to match anything we have in store. I'll take a guess. Assuming it is ", guessed_set, ".", sep = ""))
  
  scores < adist(sheet, datasets[guessed_set])
  guessed_sheet  <- datasets[guessed_set][which.min(scores)]
  
  if(which.min(scores) != 0) warning(paste("Your *sheet* input doesn't seem to match anything we have in store. I'll take a guess. Assuming it is", guessed_sheet, ".", sep = ""))
  
  # return both the dataset and the sheet. 
  return(c(guessed_set, guessed_sheet))
}


#' @name dol
#' @title dol
#' @description This function queries the US Department of Labor Wage and Hour Divisions Datasets.
#' This is the base function where users supply the name of the dataset as well as the sheet that they want. 
#' This is built to autocorrect for spelling errors that could arise and warn users. Some abbreviations are supported.
#' @param dataset A list of dataset are shown at https://developer.dol.gov/dataset/
#' @param sheet For each dataset chosen, there are sub sheets within them. You must specify which sub-sheet you want. Look up the corresponding sheet at https://developer.dol.gov/dataset/.
#' @param key The API key for this user. You must go to the DOL and sign up for an account and request for an API key.
#' @export
#' @returns A dataframe
dol <- function(dataset, sheet, key) {
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
