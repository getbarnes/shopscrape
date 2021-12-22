
#' Web scrapping shopping sites and creating interactive data frames
#'
#' @param url first url from shopping website
#' @param node first data structure that contains price and item
#' @param url2 second url from shopping website
#' @param node2 second data structure that contains price and item
#'
#' @return data frame
#' @export
#' @import dplyr
#' @import stringr
#' @import ggplot2
#' @import rvest
#' @examples
#' \dontrun{
#' shopScrape(url, node, url2, node2)
#' }
#' shopScrape("https://www.thereformation.com/categories/new?gclid=CjwKCAiAm7OMBhAQEiwArvGi3EYt2jozZbzQktEYy2iInclcxHpJKKnWfqu3Jo2mHfABJ-R90ghQVhoCmwAQAvD_BwE" , ".product-prices__price span , .product-summary__name a","https://www.zara.com/us/en/woman-must-haves-l4503.html?v1=1609213", ".price__amount-current , #main .link span")

shopScrape <- function(url,node, url2, node2){

  shopList <- read_html(url) %>% html_nodes(node) %>% html_text2()
  shopList2 <- read_html(url2) %>% html_nodes(node2) %>% html_text2()


  Store1 <- data.frame(Items = shopList2[c(TRUE, FALSE)],
                       Price = shopList2[c(FALSE, TRUE)])
  Store2 <- data.frame(Items = shopList[c(TRUE, FALSE)],
                       Price= shopList[c(FALSE, TRUE)])



  tracks <- list(Store1, Store2)
  df <- do.call(rbind, mapply(transform, tracks,Store=seq_along(tracks), SIMPLIFY = FALSE))

  library(DT)

  ui <- basicPage(
    h2("Store Data"),
    DT::dataTableOutput("mytable")
  )

  server <- function(input, output) {
    output$mytable = DT::renderDataTable({
      df
    })
  }

  shinyApp(ui, server)
}
