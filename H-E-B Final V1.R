library(rvest)
library(stringr)

# Loading websites to scrap data
url <- read_html("https://www.heb.com.mx/super/salchichoneria")

Nameproducto <- url %>% html_nodes(xpath = '//*[@class="product-item-link"]') %>% html_text()
Marcaproducto <- url %>% html_nodes(xpath = '//*[@class="category-brand"]') %>% html_text()
Precioproducto <- url %>% html_nodes(xpath = '//*[@class="price-box price-final_price"]') %>% html_text()
PrecioOfertaproducto <- url %>% html_nodes(xpath = '//*[@data-price-type="finalPrice"]') %>% html_text()

Name <- str_to_lower(Nameproducto)
Brand <- str_to_lower(Marcaproducto)
AllPrice <- str_to_lower(Precioproducto)
OfferPrice <- str_to_lower(PrecioOfertaproducto)

VerMatriz <- data.frame(Name, Brand, AllPrice, OfferPrice)
View(VerMatriz)

#ejemplos de busqueda
cant_data
cant_science
cant_harvard
cant_data <- sum(str_count(VerMatriz, regex("data")))
cant_science <- sum(str_count(VerMatriz, regex("science")))
cant_harvard <- sum(str_count(VerMatriz, regex("harvard")))

Nameproducto
Marcaproducto
Precioproducto
