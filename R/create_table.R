#' @title FUNCTION_TITLE
#' @description FUNCTION_DESCRIPTION
#' @param obj PARAM_DESCRIPTION
#' @return OUTPUT_DESCRIPTION
#' @details DETAILS
#' @examples 
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  }
#' }
#' @seealso 
#'  \code{\link[purrr]{map}}
#' @rdname create_table
#' @export 
#' @importFrom purrr map_chr
create_table <- function(obj){

  obj$state   <- purrr::map_chr(obj$value,.f=function(y) y$state)
  
  obj$created <- purrr::map_chr(obj$value,.f=function(y) y$created_at)
  obj$updated <- purrr::map_chr(obj$value,.f=function(y) y$updated_at)
  obj$closed  <- purrr::map_chr(obj$value,.f=function(y) ifelse(is.null(y$closed_at),'',y$closed_at))
  
  obj$created <- as.POSIXct(strptime(obj$created,'%Y-%m-%dT%H:%M:%SZ'))
  obj$updated <- as.POSIXct(strptime(obj$updated,'%Y-%m-%dT%H:%M:%SZ'))
  obj$closed  <- as.POSIXct(strptime(obj$closed,'%Y-%m-%dT%H:%M:%SZ'))
  
  obj$title   <- purrr::map_chr(obj$value,.f=function(y) y$title)

  # 'api/v3/repos/'
  
  obj$url    <- purrr::map_chr(obj$value,.f=function(y) y$url)
  
  gsub_pattern <- 'api\\.|repos/'
  
  if(grepl('^https://ghe',obj$url[1])){
    
    gsub_pattern <- 'api/v3/repos/'
    
  }
  
  obj$url <- gsub(pattern = gsub_pattern,replacement = '',x = obj$url)
  
  obj$title  <- sprintf('[%s](%s)',obj$title,obj$url)
  
  obj$labels <- purrr::map_chr(obj$value,.f=function(y) {
        
        ret <- purrr::map_chr(y$labels,.f=function(yy){
          yy$name
        })
        
        if(length(ret)==0)
          ret <- ''
        
        paste0(ret,collapse = ',')
      })
  
  obj$comments  <- purrr::map_chr(obj$value,.f=function(y) y$comments)
  obj$opened_by <- purrr::map_chr(obj$value,.f=function(y) y$user$login)
      

  obj$assigned_to <- purrr::map_chr(
    obj$value,
    .f=function(y) 
      paste0(purrr::map_chr(y$assignees,.f=function(yy) yy$login),collapse = ',')
    )
  
  obj$value <- NULL
  obj$url <- NULL
  
  obj[order(obj$state,obj$updated,decreasing = TRUE),]

}

