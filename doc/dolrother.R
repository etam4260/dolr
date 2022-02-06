## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- error=TRUE--------------------------------------------------------------
library(dolr)

dolsetkey("3e28950b-f0f0-4ba1-b7ec-e4ce5c112779")

head(dol_oth(dataset = 10, sheet = 1))


## ---- error=TRUE--------------------------------------------------------------

head(dol_oth(dataset = 5, sheet = 1))


## ---- error=TRUE--------------------------------------------------------------

head(dol_oth(dataset = 6, sheet = 1))


