#' @inherit purrr::'%>%'
#' @importFrom purrr %>%
#' @name %>%
#' @rdname pipe
#' @export
NULL

link <- function(x,y) sprintf('[%s](%s)',x,y)