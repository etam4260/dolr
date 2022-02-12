#' @import httr


#' @name query_API_2
#' @title query_API_2
#' @description Helper function for query the DOL V2 API.
#' @param data The subpath where the variable is located.
#' @param sheet For each dataset chosen, there are sub sheets within them.
#'   You must specify which sub-sheet you want.
#'   Look up the corresponding sheet at https://developer.dol.gov/dataset/.
#' @param key The API key for this user. You must go to the DOL and sign up
#'   for an account and request for an API key.
#' @returns A dataframe
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
