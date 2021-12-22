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
currencyFunc(usd= 2.78)

## -----------------------------------------------------------------------------
priceAna("https://www.thereformation.com/categories/new?gclid=CjwKCAiAm7OMBhAQEiwArvGi3EYt2jozZbzQktEYy2iInclcxHpJKKnWfqu3Jo2mHfABJ-R90ghQVhoCmwAQAvD_BwE" , ".product-prices__price span , .product-summary__name a")

## -----------------------------------------------------------------------------
x<- c(1:10)
y<- c(1:9)

samelNA(x,y)

