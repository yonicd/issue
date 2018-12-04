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
#' @rdname md_table
#' @export 
#' @importFrom purrr pmap_chr map_chr
md_table <- function(obj){
  
  obj$title <- purrr::pmap_chr(list(text = obj$title,anchor = obj$url, span = obj$body),link)
  
  obj$opened_by <- purrr::pmap_chr(list(text = obj$opened_by,anchor = obj$opened_by_url),link)
  
  obj$comments_users <- purrr::map_chr(
    obj$comments_users,
    .f = function(y){
      if(nrow(y)==0){
        return('')
      }
      purrr::pmap_chr(
        list(
          text   = sapply(y$user,function(yy) yy$login),
          anchor = y$html_url,
          span   = y$body),
        link)%>%
        paste0(collapse =', ')
    })
  
  obj$icon <-  purrr::pmap_chr(
    list(state = obj$state,
         pull_request = obj$pull_request,
         merged = obj$merged),
    find_icon)
  
  obj <- obj[,c('issue','icon','title','labels','opened_by','comments','comments_users','assigned_to','created','updated','closed')]
  
  obj
}

# x1 <- x%>%
#   issue_tibble()%>%
#   md_table()