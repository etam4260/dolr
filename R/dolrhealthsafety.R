#library for http requests
#library to sanitize strings
#' @import httr
#' @import stringr

# Health and Safety
#   - Injuries and Illness
#   - Gulf Oil Spill
#   - DOL OSHA Compliance
#   - MSHA Employment Production
#   - Mine Violation
#   - Fatal Occupational Injuries
#   - DOL OSHA Enforcement
#   - Auto Workers
#   - Safety and Health
#   - Full Mine Information
#   - Basic Mine Information
#   - Mine Accident Injuries
#   - Mine Inspections


#' dol_hsd
#' @name dol_hsd
#' @title dol_hsd
#' @description This function queries the US Department of Labor Health and Safety Datasets. The datasets currently use V1 of DOL API.
#' @param dataset There are currently 13 datasets to choose from. Specify the one you want with a number from 1-13.
#' 1) Injuries and Illness
#' 2) Gulf Oil Spill
#' 3) DOL OSHA Compliance
#' 4) MSHA Employment Production
#' 5) Mine Violation
#' 6) Fatal Occupational Injuries
#' 7) DOL OSHA Enforcement V2
#' 8) Auto Workers
#' 9) Safety and Health
#' 10) Full Mine Information
#' 11) Basic Mine Information
#' 12) Mine Accident Injuries
#' 13) Mine Inspections
#' @param sheet For each dataset chosen, there are sub sheets within them. You must specify which sub-sheet you want. For example,
#' if you chose Gulf Oil Spill, there are the subsheets, 1) OSHA_Direct_Read_Sampling Table as well as 2) OSHA_NOISE_REPORT Table.
#' @param key The API key for this user. You must go to the DOL and sign up for an account and request for an API key.
#' @keywords Health and Safety, Mining
#' @export
#' @returns A dataframe
dol_hsd <- function(dataset = 1, sheet = 1, key = pkg.env$curr.key) {

  # Remove trialing whitespace and convert everything into integers.
  dataset <- paste(str_trim(as.integer(dataset), side = "both"))
  sheet <- paste(str_trim(as.integer(sheet), side = "both"))
  key <- paste(str_trim(as.integer(key), side = "both"))

  if(dataset <= 0 || dataset >= 14) stop("Dataset number of out of bounds.")

  data <- switch(dataset,
                    'Safety/InjuriesAndIllness',
                    'Safety/GulfOilSpill',
                    'Safety/Fatalities',
                    'Employment',
                    'Mining/Violation',
                    'Safety/FatalOccupationalInjuries',
                    c('accident', 'accident_injury', 'inspection', 'optional_info',
                      'related_activity', 'strategic_codes', 'violation', 'violation_event',
                      'violation_gen_duty_std'),
                    'AutoWorkers',
                    'SafetyHealth',
                    'Mining/FullMineInfo',
                    'Mining/BasicMineInfo',
                    'Safety/Accidents',
                    'Safety/Accidents',
                    )

  # This is the V1 API provided by DOL else need to use V2 API.
  if(length(data) == 1) {
    URL <- paste("https://api.dol.gov/V1/Safety/", data, "/?KEY=", key, sep="") #build URL
    call<-try(GET(URL),silent = TRUE) #try to make call
    cont<-try(content(call), silent = TRUE) #parse returned data

    if(as.integer(sheet) > length(cont$d$EntitySets) || sheet <= 0) stop("Sheet number is out of bounds")
    type <- cont$d$EntitySets[sheet]

    URL <- paste("https://api.dol.gov/V1/Safety/", data, "/", sheet,"/?KEY=", key, sep="") #build URL
    call<-try(GET(URL),silent = TRUE) #try to make call
    cont<-try(content(call), silent = TRUE) #parse returned data

    res <- data.frame(matrix(0, ncol = length(names(cont$d$results[[1]])), nrow = length(cont$d$results)))
    colnames(res) <- names(cont$d$results[[1]])
    for(i in seq(1, length(cont$d$results))) {
      for(j in seq(1, ncol(res))) {
        print(cont$d$results[[i]][j])
        res[i,j] <- if(is.na(cont$d$results[[i]][j]) || length(cont$d$results[[i]][j]) > 1) "" else toString(unlist(cont$d$results[[i]][j]))
      }
    }
  } else {
    # dataset[data][sheet]
    # This V2 API only allows returning 200 records at a time.
    URL <- paste("https://data.dol.gov/get/", 'accident', "/format/json/limit/200", sep="") #build URL
    call<-try(GET(URL, add_headers(.headers = c(`X-API-KEY` = as.character(key)))), silent = TRUE)
    cont<-try(content(call), silent = TRUE) #parse returned data
  }
}

#/?KEY=d9c6c290-da4c-424e-a378-fb4bd027b58z
# key = "3e28950b-f0f0-4ba1-b7ec-e4ce5c112779"
# URL <- paste("https://www.huduser.gov/hudapi/public/usps?type=", type, "&query=", query, "&year=", thisyear, "&quarter=", thisquarter, sep="") #build URL
# call<-try(GET(URL, add_headers(Authorization=paste("X-API-KEY: ", as.character(key)))),silent = TRUE) #try to make call
# cont<-try(content(call), silent = TRUE) #parse returned data

