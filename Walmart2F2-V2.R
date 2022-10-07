library(rvest)
library(stringr)

# Loading websites to scrap data
url <- read_html("C:/Users/ptoo5/Documents/R/walmart2.html")

Nameproducto <- url %>% html_nodes(xpath = '//*[@class="absolute w-100 h-100 z-1 hide-sibling-opacity"]') %>% html_text()
Marcaproducto <- url %>% html_nodes(xpath = '//*[@class="b f6 black mr1 mt2 mb1 lh-copy"]') %>% html_text()
PrecioOfersProducto <- url %>% html_nodes(xpath = '//*[@class="flex flex-wrap justify-start items-center lh-title mb2 mb1-m"]') %>% html_text()
Precioproducto <- url %>% html_nodes(xpath = '//*[@class="b black f5 mr1 mr2-xl lh-copy f4-l"]') %>% html_text()

Name <- str_to_lower(Nameproducto)
Brand <- str_to_lower(Marcaproducto)
OffersPrice <- str_to_lower(PrecioOfersProducto)
AllPrice <- str_to_lower(Precioproducto)

VerMatriz <- data.frame(Name, Brand, OffersPrice, AllPrice )
View(VerMatriz)
#Ejemplos de busqueda

cant_data <- sum(str_count(VerMatriz, regex("data")))
cant_science <- sum(str_count(VerMatriz, regex("science")))
cant_harvard <- sum(str_count(VerMatriz, regex("harvard")))

cant_data
cant_science
cant_harvard

Nameproducto
Precioproducto
