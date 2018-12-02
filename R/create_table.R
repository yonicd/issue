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
#' @rdname create_table
#' @export 
create_table <- function(obj){

  obj$state        <- sapply(obj$value,FUN=function(y) y$state,simplify = TRUE)
  obj$pull_request <- sapply(obj$value,function(y) 'pull_request'%in%names(y))
  obj$body         <- sapply(obj$value,FUN=function(y) y$body,simplify = TRUE)
  obj$created      <- sapply(obj$value,FUN=function(y) y$created_at,simplify = TRUE)
  obj$updated      <- sapply(obj$value,FUN=function(y) y$updated_at,simplify = TRUE)
  obj$closed       <- sapply(obj$value,FUN=function(y) ifelse(is.null(y$closed_at),'',y$closed_at),simplify = TRUE)
  
  obj$created      <- as.POSIXct(strptime(obj$created,'%Y-%m-%dT%H:%M:%SZ'))
  obj$updated      <- as.POSIXct(strptime(obj$updated,'%Y-%m-%dT%H:%M:%SZ'))
  obj$closed       <- as.POSIXct(strptime(obj$closed,'%Y-%m-%dT%H:%M:%SZ'))
  
  obj$title        <- sapply(obj$value,FUN=function(y) y$title,simplify = TRUE)

  obj$url          <- sapply(obj$value,FUN=function(y) y$html_url,simplify = TRUE)

  obj$title  <- link(obj$title,obj$url,obj$body)
  
  obj$labels <- sapply(obj$value,FUN=function(y) {
        
        ret <- sapply(y$labels,FUN=function(yy) yy$name,simplify = TRUE)
        
        if(length(ret)==0)
          ret <- ''
        
        paste0(ret,collapse = ',')
      },simplify = TRUE)
  
  obj$comments  <- sapply(obj$value,FUN=function(y) y$comments,simplify = TRUE)
  
  obj$comments_users <- sapply(obj$issue,function(y){
    get_issue_comments(
      number   = y,
      repo     = attr(obj,'repo'),
      endpoint = attr(obj,'endpoint'),
      PAT      = eval(parse(text = attr(obj,'pat')))
      )%>%
      fetch_comment_users()
  },simplify = TRUE)
  
  obj$opened_by <- sapply(obj$value,FUN=function(y) link(y$user$login,y$user$html_url),simplify = TRUE)
      
  obj$assigned_to <- sapply(
    obj$value,
    FUN=function(y) 
      paste0(sapply(y$assignees,FUN=function(yy) yy$login),collapse = ','),
    simplify = TRUE
    )
  
  obj$value <- NULL
  obj$url <- NULL
  
  obj <- obj[order(obj$state,-obj$pull_request,obj$updated,decreasing = TRUE),]
  
  obj <- obj[,c('issue','pull_request','title','state','labels','opened_by','comments','comments_users','assigned_to','created','updated','closed')]
  
  obj

}

fetch_comment_users <- function(obj){
  
  sapply(obj$value,function(y){
    link(y$user$login,y$html_url,y$body)
  })%>%
    paste0(collapse = ', ') 
  
}
