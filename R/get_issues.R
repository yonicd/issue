#' @title FUNCTION_TITLE
#' @description FUNCTION_DESCRIPTION
#' @param repo PARAM_DESCRIPTION
#' @param last PARAM_DESCRIPTION
#' @param endpoint PARAM_DESCRIPTION, Default: 'api.github.com'
#' @param PAT PARAM_DESCRIPTION, Default: Sys.getenv("GITHUB_PAT")
#' @return OUTPUT_DESCRIPTION
#' @details DETAILS
#' @examples 
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  }
#' }
#' @rdname get_issues
#' @export 
#' @importFrom httr GET add_headers content
#' @importFrom tibble enframe
#' @importFrom purrr map_chr
get_issues <- function(repo, last = 100, endpoint = 'api.github.com', PAT = Sys.getenv('GITHUB_PAT')){
  
  get_git <- sprintf('https://%s/repos/%s/issues?state=all&per_page=%s',endpoint,repo,last)
  
  obj <- get_git%>%
    httr::GET(
      httr::add_headers(
        Authorization = sprintf('token %s',PAT)
      )
    )%>%
    httr::content()
  
  if(!is.null(obj$message)){
    msg <- obj$message
    
    if(msg=="Bad credentials"){
      msg <- sprintf('%s\nSee {usethis::browse_github_pat} at https://goo.gl/TWfTVy to set up a GitHub PAT',msg)
    }
      
    return(message(msg))
  }
  
  tbl <- obj%>%
    tibble::enframe(name = 'issue')
  
  tbl$issue <- purrr::map_chr(tbl$value,.f=function(y) y$number)
  
  attr(tbl,'repo') <- repo
  attr(tbl,'endpoint') <- endpoint
  attr(tbl,'pat') <- deparse(substitute(PAT))
  
  tbl
}