#' Basic Price Histogram
#'
#' @param url url from shopping website
#' @param node data structure that contains price and item
#'
#' @return basic histogram of prices obtained from node
#' @export
#' @import dplyr
#' @import stringr
#' @import ggplot2
#' @import rvest
#'
#'
#'
#'
#' @examples \dontrun{
#' basicPrice(url, node)
#' }
basicPrice <- function(url,node){

  shopList <- read_html(url) %>% html_nodes(node) %>% html_text2()

  Store1 <- data.frame(Items = shopList[c(TRUE, FALSE)],
                       Price = shopList[c(FALSE, TRUE)])

  Store2 <- (Store1 %>% mutate(Cost = as.numeric(gsub("[^0-9.-]", "", Store1$Price))) %>% subset(select=-Price))

  ggplot(Store2, aes(x=Items, y=Cost)) + geom_bar(stat="identity")  + theme(axis.text.x = element_text(angle = 45, hjust = 1))

}

