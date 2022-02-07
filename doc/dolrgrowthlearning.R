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

# The second dataset corresponds to 'OUI Initial Claims'
# The sheets shown are 1) unemploymentInsuranceInitialClaims
kable(head(str_trunc(dol_gol(dataset = 2, sheet = 1), 10, ellipsis = "..."))[1:4])

# To get the output in R, just use:
# x <- dol_gol(dataset = 2, sheet = 1)

## ---- error=TRUE, warning=FALSE-----------------------------------------------

# The third dataset corresponds to 'IPIA'
# The sheets shown are 1) causeByState ...
kable(head(str_trunc(dol_gol(dataset = 3, sheet = 1), 10, ellipsis = "..."))[1:7])

# ... 3) rate
kable(head(str_trunc(dol_gol(dataset = 3, sheet = 3), 10, ellipsis = "..."))[1:7])

# To get the output in R, just use:
# x <- dol_gol(dataset = 3, sheet = 3)

## ---- error=TRUE, warning=FALSE-----------------------------------------------

# The third dataset corresponds to 'Consumer Price Indexes'
# The sheets shown are 1) CU_AREA 
kable(head(str_trunc(dol_gol(dataset = 8, sheet = 1), 10, ellipsis = "..."))[1:7])

# To get the output in R, just use:
# x <- dol_gol(dataset = 8, sheet = 1)

## ---- error=TRUE, echo=FALSE--------------------------------------------------



