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
get_issues <- function(repo, last = 100, endpoint = 'api.github.com', PAT = Sys.getenv('GITHUB_PAT')){
  
  get_git <- sprintf('https://%s/repos/%s/issues?state=all&per_page=%s',endpoint,repo,last)
  
  get_git%>%
    httr::GET(
      httr::add_headers(
        Authorization = sprintf('token %s',PAT)
      )
    )%>%
    httr::content()%>%
    tibble::enframe(name = 'issue')
}