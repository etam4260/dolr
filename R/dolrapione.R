#' @import httr


#' @name query_API_1
#' @title query_API_1
#' @description Helper function for query the DOL V1 API.
#' @param data The subpath where the variable is located.
#' @param sheet For each dataset chosen, there are sub sheets within them.
#'   You must specify which sub-sheet you want.
#'   Look up the corresponding sheet at https://developer.dol.gov/dataset/.
#' @param key The API key for this user. You must go to the DOL and sign up
#'   for an account and request for an API key.
#' @returns A dataframe
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
