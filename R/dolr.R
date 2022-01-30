# An R interface for accessing Department of Labor (DOL) APIS
# The DOL APIs are split into 4 main overarching categories:
# Health and Safety
# Wage and Hour Divisions
# Expanding Growth Opportunities and Learning
# Other Datasets

pkg.env <- new.env(parent = emptyenv())
pkg.env$curr.key <- NULL

#' dolsetkey
#' @name dolsetkey
#' @title dolsetkey
#' @description The function will save the key into your library download. You will need to
#' update this when you call library(dolr) again. You can also set a new key by using this function with a new one.
#' @param key The token given by the DOL here https://devtools.dol.gov/developer
#' @export
dolsetkey <- function(key) {
  pkg.env$curr.key <- key
}
