#' This function will return the API Call results from diffbot

#' See RunDemo for Usage Example

#'Input Variables:
#' @param url     : Article URL to process (URL encoded)
#' @param token   : Developer token
#' @param api     : e.g. 'analyze' 
#' @param version : 2
#' @paramfields   : Used to control which fields are returned by the API see Options below example:
#'                  fields <- c('meta', 'html', 'tags')

#' @Author Simon Müller, info@muon-stat.com


#'Output  Argument:
#' @return data   : a R list

diffbot <- function(url, token, api, fields=NULL, version=2) {
  
  # load R libraries
  library(RCurl)
  library(RJSONIO)
  
  # frontpage has a different api url
  if (api == "frontpage") {
    api_url <- 'http://www.diffbot.com/api/' 
  } else {
    api_url <- 'http://api.diffbot.com/'  
  }
  
  # request urls dependent on fields
  if (is.null(fields)) {
    request <- paste0(api_url, paste0("v", version, "/"), api, '?token=', token, "&url=", url)
  } else {
    request <- paste0(api_url, paste0("v", version, "/"), api, '?token=', token, "&url=", url, "&fields=", paste(fields, collapse=","))
  }
  
  # get data
  response <- getURL(request)
  
  # json to R list
  data <- fromJSON(response)

  return(data)
}
