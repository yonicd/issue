#' @importFrom knitr kable
#' @importFrom markdown markdownToHTML
#' @importFrom rstudioapi viewer
#' @export
show_issue <- function(object){
  
  x <- object%>%
    knitr::kable()
  
  if(interactive()){
    tf <- tempfile(fileext = '.html')
    markdown::markdownToHTML(text = x,output = tf)
    Sys.sleep(0.1)
    rstudioapi::viewer(tf)  
  }
  
  return(x)
  
}
