#' @title FUNCTION_TITLE
#' @description FUNCTION_DESCRIPTION
#' @param repo PARAM_DESCRIPTION
#' @param number PARAM_DESCRIPTION
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
#' @rdname get_pr_merge
#' @export 
#' @importFrom httr GET add_headers status_code
get_pr_merge <- function(repo,number, endpoint = 'api.github.com', PAT = Sys.getenv('GITHUB_PAT')){

get_git <- sprintf('https://%s/repos/%s/pulls/%s/merge',endpoint,repo,number)

ret <- get_git%>%
  httr::GET(
    httr::add_headers(
      Authorization = sprintf('token %s',PAT)
    )
  )%>%
  httr::status_code()

  ret==204
}