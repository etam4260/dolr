## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- eval = FALSE------------------------------------------------------------
#  library(dolr)
#  
#  # The second dataset corresponds to 'OUI Initial Claims'
#  # The sheets shown are 1) unemploymentInsuranceInitialClaims
#  dol_gol(dataset = 2, sheet = 1)
#  

## ---- eval=FALSE--------------------------------------------------------------
#  
#  # The third dataset corresponds to 'IPIA'
#  # The sheets shown are 1) causeByState ...
#  dol_gol(dataset = 3, sheet = 1)
#  
#  # ... 3) rate
#  dol_gol(dataset = 3, sheet = 3)
#  

## ---- eval=FALSE--------------------------------------------------------------
#  
#  # The third dataset corresponds to 'Consumer Price Indexes'
#  # The sheets shown are 1) CU_AREA
#  dol_gol(dataset = 8, sheet = 1)
#  

## ---- eval=TRUE, echo=FALSE---------------------------------------------------
pws <- data.frame("Datasets" = c("1) Public Workforce System", rep("", 2)),
"Sheets" =  c("1) esFinal",
              "2) model",
              "3) recessionPeriods"))

oic <- data.frame("Datasets" = c("2) OUI Initial Claims", rep("", 0)),
"Sheets" =  c("1) unemploymentInsuranceInitialClaims"))

ipia <- data.frame("Datasets" = c("3) IPIA", rep("", 3)),
"Sheets" =  c("1) causeByState",
              "2) causeByStateSummary",
              "3) rate",
              "4) rateSummary"))

cew <- data.frame("Datasets" = c("4) Quarterly Census Employment and Wage (CEW)", rep("", 6)),
"Sheets" =  c("1) EN_AREA",
              "2) EN_FOOTNOTE",
              "3) EN_INDUSTRY",
              "4) EN_LQAREA",
              "5) EN_OWNER",
              "6) EN_STATE",
              "7) EN_TYPE"))

oes <- data.frame("Datasets" = c("5) Occupational Employment Statistics Survey (OES)", rep("", 10)),
"Sheets" =  c("1) OE_AREA",
              "2) OE_AREATYPE",
              "3) OE_DATA_PUB",
              "4) OE_DATATYPE",
              "5) OE_FOOTNOTE",
              "6) OE_INDUSTRY",
              "7) OE_OCCUPATION",
              "8) OE_RELEASE",
              "9) OE_SEASONAL",
              "10) OE_SECTOR",
              "11) OE_SERIES"))

cps <- data.frame("Datasets" = c("6) Current Population Survey (CPS) ", rep("", 18)),
"Sheets" =  c("1) LE_AGES",
              "2) LE_BORN",
              "3) LE_CLASS",
              "4) LE_DATA_PUB",
              "5) LE_EARN",
              "6) LE_EDUCATION",
              "7) LE_FIPS",
              "8) LE_FOOTNOTE",
              "9) LE_INDY",
              "10) LE_LFST",
              "11) LE_OCCUPATION",
              "12) LE_ORIG",
              "13) LE_PCTS",
              "14) LE_RACE",
              "15) LE_SEASONAL",
              "16) LE_SERIES",
              "17) LE_SEXS",
              "18) LE_TDATA",
              "19) LE_UNIN"))

ces <- data.frame("Datasets" = c("7) Current Employment Statistics (CES)", rep("", 6)),
"Sheets" =  c("1) CE_DATA_PUB",
              "2) CE_DATATYPE",
              "3) CE_FOOTNOTE",
              "4) CE_INDUSTRY",
              "5) CE_SEASONAL",
              "6) CE_SERIES",
              "7) CE_SUPERSECTOR"))

cpi <- data.frame("Datasets" = c("8) Consumer Price Indexes (CPI)", rep("", 7)),
"Sheets" =  c("1) CU_AREA",
              "2) CU_BASE",
              "3) CU_DATA_PUB",
              "4) CU_FOOTNOTE",
              "5) CU_ITEM",
              "6) CU_PERIODICITY",
              "7) CU_SEASONAL",
              "8) CU_SERIES"))

wpa <- data.frame("Datasets" = c("9) 2010 Workforce Investment Act", rep("", 3)),
"Sheets" =  c("1) workforceInvestmentAct",
              "2) workforceInvestmentActUi",
              "3) workforceInvestmentActWages",
              "4) lookup codes"))

oes.10 <- data.frame("Datasets" = c("10) 2010 Occupational Employment Statistics", rep("", 15)),
"Sheets" =  c("1) area",
              "2) area_definitions",
              "3) areatype",
              "4) data",
              "5) datatype",
              "6) footnote",
              "7) industry",
              "8) industry_titles",
              "9) occugroup",
              "10) occupation",
              "11) occupation_definitions",
              "12) release",
              "13) seasonal",
              "14) sector",
              "15) series",
              "16) statemsa"))

bls <- data.frame("Datasets" = c("11) BLS Numbers", rep("", 25)),
"Sheets" =  c("1) averageHourlyEarnings",
              "2) consumerPriceIndex",
              "3) employmentCostIndex",
              "4) exportPriceIndex",
              "5) importPriceIndex",
              "6) payrollEmployment",
              "7) producerPriceIndex",
              "8) productivity",
              "9) unemploymentRate",
              "10) averageHourlyEarnings12MonthChange",
              "11) averageHourlyEarnings1MonthChange",
              "12) averageHourlyEarnings1MonthNetChange",
              "13) consumerPriceIndex12MonthChange",
              "14) consumerPriceIndex1MonthChange",
              "15) exportPriceIndex12MonthChange",
              "16) exportPriceIndex1MonthChange",
              "17) importPriceIndex12MonthChange", 
              "18) importPriceIndex1MonthChange", 
              "19) payrollEmployment12MonthChange",
              "20) payrollEmployment12MonthNetChange",
              "21) payrollEmployment1MonthChange",
              "22) payrollEmployment1MonthNetChange",
              "23) producerPriceIndex12MonthChange",
              "24) producerPriceIndex1MonthChange",
              "25) unemploymentRate12MonthChange",
              "26) unemploymentRate1MonthChange"))

breaker <- data.frame("Datasets" = c(""), "Sheets" = c(""))

knitr::kable(do.call(rbind, list(pws, breaker, oic, breaker, ipia, breaker, cew, breaker, oes, breaker, cps, breaker, ces, breaker, cpi, breaker, wpa, breaker, oes.10, breaker, bls)), "html")

