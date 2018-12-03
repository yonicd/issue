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
  obj <- gsub('\\|','\\\\|',obj)
  obj <- gsub('"',"'",obj)
  obj
}

find_icon <- function(state = 'open', pull_request = FALSE, merged = FALSE){
  
  ret <- ''
  
  if(pull_request){
    if(merged){
      #ret <- system.file('icons/pull-request-merged.svg',package = 'issue')
      ret <- 'https://github.com/yonicd/issue/blob/master/inst/icons/pull-request-merged.png?raw=true'
      span <- '<span title = "Merged Pull Request"><img src="%s"></span>'
    }else{
      if(state=='open'){
        #ret <- system.file('icons/pull-request-opened.svg',package = 'issue')
        ret <- 'https://github.com/yonicd/issue/blob/master/inst/icons/pull-request-opened.png?raw=true'
        span <- '<span title = "Pull Request Open"><img src="%s"></span>'        
      }else{
        #ret <- system.file('icons/pull-request-closed.svg',package = 'issue')
        ret <- 'https://github.com/yonicd/issue/blob/master/inst/icons/pull-request-closed.png?raw=true'
        span <- '<span title = "Pull Request Closed"><img src="%s"></span>'
      }

    }
    
  }else{
    if(state=='open'){
      #ret <- system.file('icons/issue-opened.svg',package = 'issue')
      ret <- 'https://github.com/yonicd/issue/blob/master/inst/icons/issue-opened.png?raw=true'
      span <- '<span title = "Open Issue"><img src="%s"></span>'
    }else{
      ret <- system.file('icons/issue-closed.svg',package = 'issue')
      ret <- 'https://github.com/yonicd/issue/blob/master/inst/icons/issue-closed.png?raw=true'
      span <- '<span title = "Closed Issue"><img src="%s"></span>'
    }
  }
  
  if(nzchar(ret)){
    ret <- sprintf(span,ret)
  }
  
  ret
}