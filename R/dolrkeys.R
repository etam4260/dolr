
#' dolgetkey
#' @name dolgetkey
#' @title dolgetkey
#' @description The function will return the key set by Set.sysenv(). Returns NULL if no key was set.
#' @returns A string. NULL if empty.
#' @export
dolgetkey <- function() {
  return(Sys.getenv("DOL_KEY"))
}
