#' Making two lists the same length by adding NA's
#'
#' @param x first list of items
#' @param y second list of item
#'
#' @return finds longest list and makes other list the same length with added NA's
#' @export
#'
#' @examples
#' \dontrun{
#' samelNA(rev, zara)
#' samelNa(list1, list2)
#' }
samelNA <- function(x,y){
  n <- max(length(x), length(y))
  length(x) <- n
  length(y) <- n
  cbind(x,y)
}

