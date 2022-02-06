## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- error=TRUE--------------------------------------------------------------
library(dolr)

dolsetkey("3e28950b-f0f0-4ba1-b7ec-e4ce5c112779")

dol_whd(dataset = 3, sheet = 4)


## ---- error=TRUE--------------------------------------------------------------

dol_whd(dataset = 2, sheet = 1)


