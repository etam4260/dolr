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

# This queries WHD Compliance datasets. 
# This gets the sheet associated with retail.
kable(head(str_trunc(dol_whd(dataset = 3, sheet = 4), 10, ellipsis = "..."))[1:7])

# To get the output in R, just use:
# x <- dol_whd(dataset = 3, sheet = 4)

## ---- error=TRUE, warning=FALSE-----------------------------------------------

# This queries the Wage and Hour Publications System 
# This get the sheet associated with: PublicationsView
kable(head(str_trunc(dol_whd(dataset = 2, sheet = 1), 10, ellipsis = "..."))[1:7])

# To get the output in R, just use:
# x <- dol_whd(dataset = 2, sheet = 1)

## ---- error=TRUE, echo=FALSE--------------------------------------------------



