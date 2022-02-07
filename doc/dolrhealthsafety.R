## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- error=TRUE, warning=FALSE-----------------------------------------------
library(dolr)
library(stringr)
library(knitr)

# Set the key
dolsetkey("3e28950b-f0f0-4ba1-b7ec-e4ce5c112779")

# The second dataset corresponds to 'Gulf Oil Spill'
# The sheets available are 1) OSHA_Direct_Read_Sampling and ...
kable(head(str_trunc(dol_hsd(dataset = 2, sheet = 1), 10, ellipsis = "..."))[1:7])

# ... 2) OSHA_NOISE_REPORT
kable(head(str_trunc(dol_hsd(dataset = 2, sheet = 2), 10, ellipsis = "..."))[1:7])

# To get the output in R, just use:
# x <- dol_hsd(dataset = 2, sheet = 2)

## ---- error=TRUE, warning=FALSE-----------------------------------------------
# The ninth dataset corresponds to 'Safety and Health'
# The sheets available are 1) ChemicalExposureInspections ...
kable(head(str_trunc(dol_hsd(dataset = 1, sheet = 1), 10, ellipsis = "..."))[1:7])

# ... 2) EstablishmentSpecificInjuryIllnessRates
kable(head(str_trunc(dol_hsd(dataset = 1, sheet = 2), 10, ellipsis = "..."))[1:7])

# To get the output in R, just use:
# x <- dol_hsd(dataset = 1, sheet = 2)

## ---- error=TRUE, warning=FALSE-----------------------------------------------
# The seventh dataset corresponds to 'DOL OSHA Enforcement'
# The sheets available are:
#        1) accident
#        2) accident_abstract
#        3) accident_injury
#        4) inspection
#        5) optional_info
#        6) related_activity
#        7) strategic_codes
#        8) violation
#        9) violation_event
#        10) violation_gen_duty_std

kable(head(str_trunc(dol_hsd(dataset = 7, sheet = 1), 10, ellipsis = "..."))[1:7])

# To get the output in R, just use:
# x <- dol_hsd(dataset = 7, sheet = 1)

## ---- error=TRUE, echo=FALSE--------------------------------------------------



