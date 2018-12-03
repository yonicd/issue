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

find_icon <- function(state = 'open', pull_request = FALSE, merged = FALSE){
  
  ret <- ''
  
  if(pull_request){
    if(merged){
      ret <- system.file('icons/pull-request-merged.svg',package = 'issue')
      span <- '<span title = "Merged Pull Request">%s</span>'
    }else{
      if(state=='open'){
        ret <- system.file('icons/pull-request-opened.svg',package = 'issue')
        span <- '<span title = "Pull Request Open">%s</span>'        
      }else{
        ret <- system.file('icons/pull-request-closed.svg',package = 'issue')
        span <- '<span title = "Pull Request Closed">%s</span>'
      }

    }
    
  }else{
    if(state=='open'){
      ret <- system.file('icons/issue-opened.svg',package = 'issue')
      span <- '<span title = "Open Issue">%s</span>'
    }else{
      ret <- system.file('icons/issue-closed.svg',package = 'issue')
      span <- '<span title = "Closed Issue">%s</span>'
    }
  }
  
  if(nzchar(ret)){
    ret <- sprintf(span,readLines(ret))
  }
  
  ret
}