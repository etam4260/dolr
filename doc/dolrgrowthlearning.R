## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- error=TRUE--------------------------------------------------------------
library(dolr)

dolsetkey("3e28950b-f0f0-4ba1-b7ec-e4ce5c112779")

head(dol_gol(dataset = 2, sheet = 1))


## ---- error=TRUE--------------------------------------------------------------

head(dol_gol(dataset = 3, sheet = 1))

head(dol_gol(dataset = 3, sheet = 3))


## ---- error=TRUE--------------------------------------------------------------

head(dol_gol(dataset = 8, sheet = 1))


