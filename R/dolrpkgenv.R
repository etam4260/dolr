# Manually create file for having a nice dictionary of available datasets and
# sheets. Looking at the website it seems like it is generic enough to create
# a web-scraping function to auto fill this file.


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
datasets[["Injuries And Illness"]] <- c("II_AREA",
                                        "II_CASE_TYPE",
                                        "II_DATA_PUB",
                                        "II_DATA_TYPE",
                                        "II_FOOTNOTE",
                                        "II_GQT_CASE",
                                        "II_GQT_CHAR",
                                        "II_GQT_OWNERSHIP",
                                        "II_GQT_STATE",
                                        "II_GQT_STATE_OWNERSHIP",
                                        "II_INDUSTRY",
                                        "II_SERIES",
                                        "II_SUPERSECTOR")
datasets[["Gulf Oil Spill"]] <- c("OSHA_Direct_Read_Sampling",
                                  "OSHA_NOISE_REPORT")
datasets[["DOL OSHA Compliance"]] <- c("OSHA_Fatalities")
datasets[["MSHA Employment Production"]] <- c("MSHA_employmentProduction")
datasets[["Mine Violation"]] <- c("MSHA_violations")
datasets[["Fatal Occupational Injuries"]] <- c("FI_AREA",
                                               "FI_CASE",
                                               "FI_CATEGORY",
                                               "FI_CATEGORY2",
                                               "FI_DATA_PUB",
                                               "FI_DATATYPE",
                                               "FI_EVENT",
                                               "FI_FOOTNOTE",
                                               "FI_GQT_CASE",
                                               "FI_GQT_CHAR",
                                               "FI_GQT_CHAR_OWNERSHIP",
                                               "FI_GQT_OWNERSHIP",
                                               "FI_GQT_STATE",
                                               "FI_GQT_STATE_OWNERSHIP",
                                               "FI_INDUSTRY",
                                               "FI_SERIES")
datasets[["DOL OSHA Enforcement"]] <- c("accident",
                                        "accident_abstract",
                                        "accident_injury",
                                        "inspection",
                                        "optional_info",
                                        "related_activity",
                                        "strategic_codes",
                                        "violation",
                                        "violation_event",
                                        "violation_gen_duty_std")
datasets[["Auto Workers"]] <- c("CAR_ClosedRepurposed")
datasets[["Safety and Health"]] <- c("ChemicalExposureInspections",
                                     "EstablishmentSpecificInjuryIllnessRates")
datasets[["Full Mine Information Mines"]] <- c("MSHA_mines")
datasets[["Basic Mine Information"]] <- c("MSHA_addressOfRecord")
datasets[["Mine Accident Injuries "]] <- c("mineAccidents")
datasets[["Mine Inspections "]] <- c("mineInspections")


# Wage and Hour
WH <- c("Farm Labor Contractor and Farm Labor Contractor Employee",
        "Wage and Hour Publications System",
        "WHD Compliance")
data_wh <- c(list("flc_cert", "flce_cert"),
             list("publications_view", "documents_view"),
             "Compliance/WHD"
)
datasets[["Farm Labor Contractor and Farm Labor Contractor Employee"]] <- c("Farm Labor Contractors",
                                                                            "Farm Labor Contractor Employees")
datasets[["Wage and Hour Publications System"]] <- c("PublicationsView",
                                                     "DocumentsView")
datasets[["WHD Compliance"]] <- c("full",
                                  "foodservice",
                                  "hospitality",
                                  "retail")



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
datasets[["Public Workforce System"]] <- c("esFinal",
                                           "model",
                                           "recessionPeriods")
datasets[["OUI Initial Claims"]] <- c("unemploymentInsuranceInitialClaims")
datasets[["IPIA"]] <- c("causeByState",
                        "causeByStateSummary",
                        "rate",
                        "rateSummary")
datasets[["Quarterly Census Employment and Wage"]] <- c("EN_AREA",
                                                        "EN_FOOTNOTE",
                                                        "EN_INDUSTRY",
                                                        "EN_LQAREA",
                                                        "EN_OWNER",
                                                        "EN_STATE",
                                                        "EN_TYPE")
datasets[["Occupational Employment Statistics Survey"]] <- c("OE_AREA",
                                                             "OE_AREATYPE",
                                                             "OE_DATA_PUB",
                                                             "OE_DATATYPE",
                                                             "OE_FOOTNOTE",
                                                             "OE_INDUSTRY",
                                                             "OE_OCCUPATION",
                                                             "OE_RELEASE",
                                                             "OE_SEASONAL",
                                                             "OE_SECTOR",
                                                             "OE_SERIES")
datasets[["Current Population Survey"]] <- c("LE_AGES",
                                             "LE_BORN",
                                             "LE_CLASS",
                                             "LE_DATA_PUB",
                                             "LE_EARN",
                                             "LE_EDUCATION",
                                             "LE_FIPS",
                                             "LE_FOOTNOTE",
                                             "LE_INDY",
                                             "LE_LFST",
                                             "LE_OCCUPATION",
                                             "LE_ORIG",
                                             "LE_PCTS",
                                             "LE_RACE",
                                             "LE_SEASONAL",
                                             "LE_SERIES",
                                             "LE_SEXS",
                                             "LE_TDATA",
                                             "LE_UNIN")
datasets[["Current Employment Statistics"]] <- c("CE_DATA_PUB",
                                                 "CE_DATATYPE",
                                                 "CE_FOOTNOTE",
                                                 "CE_INDUSTRY",
                                                 "CE_SEASONAL",
                                                 "CE_SERIES",
                                                 "CE_SUPERSECTOR")
datasets[["Consumer Price Indexes"]] <- c("CU_AREA",
                                          "CU_BASE",
                                          "CU_DATA_PUB",
                                          "CU_FOOTNOTE",
                                          "CU_ITEM",
                                          "CU_PERIODICITY",
                                          "CU_SEASONAL",
                                          "CU_SERIES")
datasets[["2010 Workforce Investment Act"]] <- c("workforceInvestmentAct",
                                                 "workforceInvestmentActUi",
                                                 "workforceInvestmentActWages",
                                                 "lookup codes")
datasets[["2010 Occupational Employment Statistics"]] <- c("area",
                                                           "area_definitions",
                                                           "areatype",
                                                           "data",
                                                           "datatype",
                                                           "footnote",
                                                           "industry",
                                                           "industry_titles",
                                                           "occugroup",
                                                           "occupation",
                                                           "occupation_definitions",
                                                           "release",
                                                           "seasonal",
                                                           "sector",
                                                           "series",
                                                           "statemsa")
datasets[["BLS Numbers"]] <- c("averageHourlyEarnings",
                               "consumerPriceIndex",
                               "employmentCostIndex",
                               "exportPriceIndex",
                               "importPriceIndex",
                               "payrollEmployment",
                               "producerPriceIndex",
                               "productivity",
                               "unemploymentRate",
                               "averageHourlyEarnings12MonthChange",
                               "averageHourlyEarnings1MonthChange",
                               "averageHourlyEarnings1MonthNetChange",
                               "consumerPriceIndex12MonthChange",
                               "consumerPriceIndex1MonthChange",
                               "exportPriceIndex12MonthChange",
                               "exportPriceIndex1MonthChange",
                               "importPriceIndex12MonthChange",
                               "importPriceIndex1MonthChange",
                               "payrollEmployment12MonthChange",
                               "payrollEmployment12MonthNetChange",
                               "payrollEmployment1MonthChange",
                               "payrollEmployment1MonthNetChange",
                               "producerPriceIndex12MonthChange",
                               "producerPriceIndex1MonthChange",
                               "unemploymentRate12MonthChange",
                               "unemploymentRate1MonthChange")

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
datasets[["Sweat & Toil"]] <- c("SweatToilAllRegions",
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
                                "SweatToilMechanisms")
datasets[["VETS4212"]] <- c("V4212DataDotGov")
datasets[["VETS100"]] <- c("V100DataDotGov",
                           "V100ADataDotGov")
datasets[["API Metrics"]] <- c("NumberOfRequestsPerKeys",
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
                               "TopDataTablesPerKeyYears")
datasets[["Research And Evaluation Inventory"]] <- c("researchEvaluationInventory")
datasets[["REI"]] <- datasets[["Research And Evaluation Inventory"]]
datasets[["Geography"]] <- c("City",
                             "CongressDistrict",
                             "County",
                             "State")
datasets[["Form"]] <- c("Agencies",
                        "AgencyForms")
datasets[["Frequently Asked Questions"]] <- c("Topics",
                                              "SubTopics",
                                              "TopicQuestions")
datasets[["FAQ"]] <- datasets[["Frequently Asked Questions"]]
datasets[["API Metadata"]] <- c("APIMetadatas")
datasets[["Agency"]] <- c("Agencies")
