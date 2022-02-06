## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- warning=FALSE, results='hide',message=FALSE-----------------------------
# install.packages("devtools")
library(devtools)
devtools::install_github("etam4260/dolr")

## -----------------------------------------------------------------------------
library(dolr)

# The function will not output anything. 
dolsetkey("3e28950b-f0f0-4ba1-b7ec-e4ce5c112779")

# To check the current key.
# print(dolgetkey())

