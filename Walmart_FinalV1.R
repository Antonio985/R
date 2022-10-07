library(rvest)
library(stringr)

# Loading websites to scrap data
url <- read_html("C:/Users/ptoo5/Documents/R/Walmart.html")

Nameproducto <- url %>% html_nodes(xpath = '//*[@class="text_text__3qcEt"]') %>% html_text()

Precioproducto <- url %>% html_nodes(xpath = '//*[@class="text_text__3qcEt text_inline__2hw9E text_bold__2G1zI"]') %>% html_text()

Name <- str_to_lower(Nameproducto)
AllPrice <- str_to_lower(Precioproducto)

VerMatriz <- data.frame(Name, AllPrice , fix.empty.names = TRUE)
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
