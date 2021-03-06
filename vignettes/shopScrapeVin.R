## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(shopscrape)

## -----------------------------------------------------------------------------
shopScrape("https://www.thereformation.com/categories/new?gclid=CjwKCAiAm7OMBhAQEiwArvGi3EYt2jozZbzQktEYy2iInclcxHpJKKnWfqu3Jo2mHfABJ-R90ghQVhoCmwAQAvD_BwE" , ".product-prices__price span , .product-summary__name a","https://www.zara.com/us/en/woman-must-haves-l4503.html?v1=1609213", ".price__amount-current , #main .link span")

## -----------------------------------------------------------------------------
basicPrice("https://www.thereformation.com/categories/new?gclid=CjwKCAiAm7OMBhAQEiwArvGi3EYt2jozZbzQktEYy2iInclcxHpJKKnWfqu3Jo2mHfABJ-R90ghQVhoCmwAQAvD_BwE" , ".product-prices__price span , .product-summary__name a")

## -----------------------------------------------------------------------------
priceAna("https://www.thereformation.com/categories/new?gclid=CjwKCAiAm7OMBhAQEiwArvGi3EYt2jozZbzQktEYy2iInclcxHpJKKnWfqu3Jo2mHfABJ-R90ghQVhoCmwAQAvD_BwE" , ".product-prices__price span , .product-summary__name a")

## -----------------------------------------------------------------------------
library(rvest)
resultsZara <- read_html("https://www.zara.com/us/en/woman-must-haves-l4503.html?v1=1609213")


vals <- priceNum(resultsZara,".price__amount-current")



## -----------------------------------------------------------------------------
currencyFunc(usd= 2.78)
currencyFunc(euro=3)

## -----------------------------------------------------------------------------
x<- c(1:10)
y<- c(1:9)

samelNA(x,y)

