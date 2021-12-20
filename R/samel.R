#' Making two lists the same length by repeating values
#'
#' @param x first list of items
#' @param y second list of item
#'
#' @return finds longest list and makes other list the same length by repeating values
#' @export
#'
#' @examples
#' \dontrun{
#' samel(x, y)
#' samel(list1, list2)
#' }
#'
samel  <- function(x,y){
  n <- max(length(x), length(y))
  length(x) <- n
  length(y) <- n
}
