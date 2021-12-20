#' Currency Changing Function to Peso, Euro, or USD
#'
#' @param euro type of currency
#' @param usd type of currency
#' @param peso type of currency
#'
#' @return list of all values and corresponding currency
#' @export
#'
#' @examples
#' \dontrun{
#' currencyFunc(usd= 2.78)
#' currencyFunc(peso= 1200)
#' }
currencyFunc <- function( euro= .89 *usd, usd= 1.13 * euro, peso = 21 * usd) {
  tbl <- data.frame(c(euro = euro, usd=usd, peso=peso ))
  names(tbl) <- c('Currency')
  tbl

}
