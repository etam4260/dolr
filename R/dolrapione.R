#' @import httr

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