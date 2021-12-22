#' Takes prices from node and parses it and makes it a numerical
#'
#' @param html html code for website
#' @param node data scruture that contains prices
#'
#' @return parsed numerical values
#' @export
#'  @import dplyr
#' @import stringr
#' @import ggplot2
#' @import rvest
#'
#' @examples
#' \dontrun{
#' priceNum(resultsZara,".price__amount-current")}
priceNum <- function(html,node){
  Price <- html %>% html_nodes(node) %>% html_text2()
  numPrice <- str_sub(Price,1,nchar(Price)-3)
  new <- as.numeric(numPrice)
  new
}
