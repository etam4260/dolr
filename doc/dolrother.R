## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- eval=FALSE--------------------------------------------------------------
#  library(dolr)
#  
#  dol_oth(dataset = 10, sheet = 1)
#  

## ---- eval=FALSE--------------------------------------------------------------
#  
#  # This queries the Research and Evaluation Inventory consisting of various documents.
#  # There is only one sheet associated with this dataset: researchEvaluationInventory
#  dol_oth(dataset = 5, sheet = 1)
#  

## ---- eval=FALSE--------------------------------------------------------------
#  
#  # This queries the Geography datasets.
#  # This specifically queries the cities sheet.
#  dol_oth(dataset = 6, sheet = 1)
#  

## ---- eval=TRUE, echo=FALSE---------------------------------------------------

sw <- data.frame("Datasets" = c("1) Sweat & Toil", rep("", 13)),
"Sheets" = paste(c("1) ", "2) ", "3) ", "4) ", "5) ", "6) ", "7) ", "8) ", "9) ", "10) ", "11) ", "12) ", "13) ", "14) "), c("SweatToilAllRegions", "SweatToilAllCountries", "SweatToilAllTerritories", "SweatToilAllAdvancementLevels","SweatToilAllAssessments", "SweatToilAllSectors", "SweatToilAllGoods" ,"SweatToilAllCountryGoods", "SweatToilAllStatistics", "SweatToilAllConventions", "SweatToilAllSuggestedActions", "SweatToilAllLegalStandards", "SweatToilAllEnforcements", "SweatToilMechanisms")))

vet4212 <- data.frame("Datasets" = c("2) VETS4212", rep("",0)),
                      "Sheets" = c("V4212DataDotGov"))

vet100 <- data.frame("Datasets" = c("3) VETS100", rep("",1)),
                     "Sheets" = c("V100DataDotGov", "V100ADataDotGov"))

api <- data.frame("Datasets" = c("4) API Metrics", rep("",14)),
                  "Sheets" = c("NumberOfRequestsPerKeys",
                    "NumberOfRequestsPerDayByKeys",
                    "NumberOfRequestsPerMonthByKeys",
                    "NumberOfRequestsPerYearByKeys",
                    "NumberOfRequestsPerYearByWeeks",
                    "TopDatasetsPerKeys",
                    "TopDatasetsPerYearPerKeys",
                    "TopDatasetsPerMonthPerKeys",
                    "TopDatasetsPerWeekPerKeys",
                    "TopDatasetsPerDayPerKeys",
                    "TopDataTablesPerKeys",
                    "TopDataTablesPerKeyDays",
                    "TopDataTablesPerKeyMonths",
                    "TopDataTablesPerKeyWeeks",
                    "TopDataTablesPerKeyYears"))

research <- data.frame("Datasets" = c("5) Research And Evaluation Inventory", rep("",0)),
                       "Sheets" = c("researchEvaluationInventory"))
  
geography <- data.frame("Datasets" = c("6) Geography", rep("",3)),
                        "Sheets" = c("City",
                          "CongressDistrict",
                          "County",
                          "State"))

form <- data.frame("Datasets" = c("7) Form", rep("",1)),
                   "Sheets" = c("Agencies",
                     "AgencyForms"))
  
faq <- data.frame("Datasets" = c("8) Frequently Asked Questions", rep("",2)),
                  "Sheets" = c("Topics",
                    "SubTopics",
                    "TopicQuestions"))
  
meta <- data.frame("Datasets" = c("9) API Metadata", rep("",0)),
                   "Sheets" = c("APIMetadatas"))
  
agency <- data.frame("Datasets" = c("10) Agency", rep("",0)),
                    "Sheets" = c("Agencies"))

breaker <- data.frame("Datasets" = c(""), "Sheets" = c(""))

knitr::kable(do.call(rbind, list(sw, breaker, vet4212, breaker, vet100, breaker, api, breaker, research, breaker, geography, breaker, form, breaker, faq, breaker, meta, breaker, agency)), "html")

