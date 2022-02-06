# An R interface for accessing Department of Labor (DOL) APIS
# The DOL APIs are split into 4 main overarching categories:
# Health and Safety
# Wage and Hour Divisions
# Expanding Growth Opportunities and Learning
# Other Datasets

#' @import httr

pkg.env <- new.env(parent = emptyenv())
pkg.env$curr.key <- NULL


#' dolsetkey
#' @name dolsetkey
#' @title dolsetkey
#' @description The function will save the key into your library download. You will need to
#' update this when you call library(dolr) again. You can also set a new key by using this function with a new one.
#' @param key The token given by DOL here https://devtools.dol.gov/developer
#' @export
dolsetkey <- function(key) {
  pkg.env$curr.key <- key
}


#' dolgetkey
#' @name dolgetkey
#' @title dolgetkey
#' @description The function will return the key set by dolsetkey(). Returns NULL if no key was set.
#' @returns A string vector set by dolsetkey(). NULL if empty.
#' @export
dolgetkey <- function() {
  return(pkg.env$curr.key)
}


# Helper function to make query to DOL API Version 1.
query_API_1 <- function(data, sheet, key) {
  URL <- paste("https://api.dol.gov/V1/", data, "/?KEY=", key, sep="") #build URL
  call<-try(GET(URL),silent = TRUE) #try to make call
  if(call$status_code != 200) stop("Failed to get the specific dataset.")
  cont<-try(content(call), silent = TRUE) #parse returned data

  if(as.integer(sheet) > length(cont$d$EntitySets) || sheet <= 0) stop("Sheet number is out of bounds")
  type <- cont$d$EntitySets[sheet]

  URL <- paste("https://api.dol.gov/V1/", data, "/", type,"/?KEY=", key, sep="") #build URL
  call<-try(GET(URL),silent = TRUE) #try to make call
  if(call$status_code != 200) stop("Failed to get the specific sheet.")
  cont<-try(content(call), silent = TRUE) #parse returned data

  res <- data.frame(matrix(0, ncol = length(names(cont$d$results[[1]])), nrow = length(cont$d$results)))
  colnames(res) <- names(cont$d$results[[1]])
  for(i in seq(1, length(cont$d$results))) {
    for(j in seq(1, ncol(res))) {
      res[i,j] <- if(is.na(cont$d$results[[i]][j]) || length(cont$d$results[[i]][j]) > 1) "" else toString(unlist(cont$d$results[[i]][j]))
    }
  }
  return(res)
}


# Helper function to make query to DOL API Version 2.
query_API_2 <- function(data, sheet, key) {
  if(as.integer(sheet) > length(data) || sheet <= 0) stop("Sheet number is out of bounds")

  # This V2 API only allows returning 200 records at a time. So need to keep looping through.
  offset <- 0
  URL <- paste("https://data.dol.gov/get/", data[sheet], "/format/json/limit/200/offset/", as.character(offset), sep="") #build URL
  call<-try(GET(URL, add_headers(.headers = c(`X-API-KEY` = as.character(key)))), silent = TRUE)
  if(call$status_code != 200) stop("Failed to get the specific dataset.")
  cont<-try(content(call), silent = TRUE) #parse returned data

  if(is.null(cont$data)){
    allres <- as.data.frame(do.call(rbind, cont))
  } else {
    allres <- as.data.frame(do.call(rbind, cont$data))
  }


  # offset <- 200
  # while(offset < 1000) {
  #
  #   URL <- paste("https://data.dol.gov/get/", data[sheet], "/format/json/limit/200/offset/", as.character(offset), sep="") #build URL
  #   call<-try(GET(URL, add_headers(.headers = c(`X-API-KEY` = as.character(key)))), silent = TRUE)
  #   cont<-try(content(call), silent = TRUE) #parse returned data
  #
  #   allres <- rbind(allres, as.data.frame(do.call(rbind, cont$data)))
  #   offset <- offset + 200
  # }
  return(allres)
}
