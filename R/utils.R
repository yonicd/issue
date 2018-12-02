#' @inherit purrr::'%>%'
#' @importFrom purrr %>%
#' @name %>%
#' @rdname pipe
#' @export
NULL

link <- function(text,anchor,span = NULL){
  
  ret <- sprintf('[%s](%s)',text,anchor) 
  
  if(!is.null(span)){
    ret <- sprintf('<span title ="%s">%s</span>',clean_span(span),ret) 
  }
    
  ret
}

clean_span <- function(obj){
  obj <- gsub('\\n(.*?)$','...',obj)
  obj <- gsub('\\r','',obj)
  obj <- gsub('"',"'",obj)
  obj
}