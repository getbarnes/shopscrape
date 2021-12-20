#' Histogram of means for shopping item Categories
#'
#' @param url url from shopping website
#' @param node data structure that contains price and item
#'
#' @return histogram of means for all the types of items obtained in node
#' @export
#'
#' @examples
#'
#' priceAna("https://www.thereformation.com/categories/new?gclid=CjwKCAiAm7OMBhAQEiwArvGi3EYt2jozZbzQktEYy2iInclcxHpJKKnWfqu3Jo2mHfABJ-R90ghQVhoCmwAQAvD_BwE" , ".product-prices__price span , .product-summary__name a")
priceAna <- function(url,node){

  shopList <- read_html(url) %>% html_nodes(node) %>% html_text2()

  Store1 <- data.frame(Items = shopList[c(TRUE, FALSE)],
                       Price = shopList[c(FALSE, TRUE)])

  Store2 <- (Store1 %>% mutate(Cost = as.numeric(gsub("[^0-9.-]", "", Store1$Price))) %>% subset(select=-Price))

  Store2$Category <- word(Store2$Items, -1)
  Store2

  new <- Store2 %>% group_by(Category) %>% summarise_at(vars(Cost),
                                                        list(Mean = mean))


  ggplot(new, aes(x=Category, y=Mean, color= Category)) + geom_bar(stat="identity")  + theme(axis.text.x = element_text(angle = 45, hjust = 1))

}
