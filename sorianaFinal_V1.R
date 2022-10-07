
library(rvest)
library(stringr)

# Loading websites to scrap data
url <- read_html("C:/Users/ptoo5/Documents/R/Soriana.html")

Nameproducto <- url %>% html_nodes(xpath = '//*[@class="link font-primary--medium product-tile--link ellipsis-product-name"]') %>% html_text()
Marcaproducto <- url %>% html_nodes(xpath = '//*[@class="product-tile--brand-link"]') %>% html_text()
Precioproducto <- url %>% html_nodes(xpath = '//*[@class="mr-0 font-primary--bold font-size-14   null px-1 cart-price price-plp"]') %>% html_text()

Name <- str_to_lower(Nameproducto)
Brand <- str_to_lower(Marcaproducto)
Price <- str_to_lower(Precioproducto)

#Ejemplos de busqueda
VerMatriz <- data.frame(Name, Brand, Price)
View(VerMatriz)
cant_data
cant_science
cant_harvard
cant_data <- sum(str_count(VerMatriz, regex("data")))
cant_science <- sum(str_count(VerMatriz, regex("science")))
cant_harvard <- sum(str_count(VerMatriz, regex("harvard")))

Nameproducto
Marcaproducto
Precioproducto
