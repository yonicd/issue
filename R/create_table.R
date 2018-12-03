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
#' @importFrom purrr map_chr pmap_chr map2_lgl map_lgl
#' @export 
create_table <- function(obj){

  obj$state        <- purrr::map_chr(obj$value,.f=function(y) y$state)
  obj$pull_request <- purrr::map_lgl(obj$value,function(y) 'pull_request'%in%names(y))
  obj$body         <- purrr::map_chr(obj$value,.f=function(y) y$body)
  obj$created      <- purrr::map_chr(obj$value,.f=function(y) y$created_at)
  obj$updated      <- purrr::map_chr(obj$value,.f=function(y) y$updated_at)
  obj$closed       <- purrr::map_chr(obj$value,.f=function(y) ifelse(is.null(y$closed_at),'',y$closed_at))
  
  obj$created      <- as.POSIXct(strptime(obj$created,'%Y-%m-%dT%H:%M:%SZ'))
  obj$updated      <- as.POSIXct(strptime(obj$updated,'%Y-%m-%dT%H:%M:%SZ'))
  obj$closed       <- as.POSIXct(strptime(obj$closed,'%Y-%m-%dT%H:%M:%SZ'))
  
  obj$title        <- purrr::map_chr(obj$value,.f=function(y) y$title)

  obj$url          <- purrr::map_chr(obj$value,.f=function(y) y$html_url)

  obj$title  <- link(obj$title,obj$url,obj$body)
  
  obj$labels <- purrr::map_chr(obj$value,.f=function(y) {
        
        ret <- purrr::map_chr(y$labels,.f=function(yy) yy$name)
        
        if(length(ret)==0)
          ret <- ''
        
        paste0(ret,collapse = ',')
      })
  
  obj$comments  <- purrr::map_chr(obj$value,.f=function(y) y$comments)
  
  obj$comments_users <- purrr::map_chr(obj$issue,function(y){
    get_issue_comments(
      number   = y,
      repo     = attr(obj,'repo'),
      endpoint = attr(obj,'endpoint'),
      PAT      = eval(parse(text = attr(obj,'pat')))
      )%>%
      fetch_comment_users()
  })
  
  obj$opened_by <- purrr::map_chr(obj$value,.f=function(y) link(y$user$login,y$user$html_url))
      
  obj$assigned_to <- purrr::map_chr(
    obj$value,
    .f=function(y) 
      paste0(purrr::map_chr(y$assignees,.f=function(yy) yy$login),collapse = ',')
    )
  
  obj$merged <- purrr::map2_lgl(
    obj$pull_request,
    obj$issue,
    .f=function(pr,number,repo,endpoint,PAT) {
      if(pr){
        get_pr_merge(
                  number = number,
                  repo = repo,
                  endpoint = endpoint,
                  PAT = PAT
        )
      }else{
        pr
      } 
    },
    repo     = attr(obj,'repo'),
    endpoint = attr(obj,'endpoint'),
    PAT      = eval(parse(text = attr(obj,'pat')))
    )
  
  
  obj$icon <- purrr::pmap_chr(
    list(state = obj$state,
         pull_request = obj$pull_request,
         merged = obj$merged),
         find_icon)
  
  obj$value <- NULL
  obj$url <- NULL
  
  obj <- obj[order(obj$state,-obj$pull_request,obj$updated,decreasing = TRUE),]
  
  obj <- obj[,c('issue','icon','title','labels','opened_by','comments','comments_users','assigned_to','created','updated','closed')]
  
  obj

}

fetch_comment_users <- function(obj){
  
  sapply(obj$value,function(y){
    link(y$user$login,y$html_url,y$body)
  })%>%
    paste0(collapse = ', ') 
  
}
