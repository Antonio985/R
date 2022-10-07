#Chedraui sin problemas para generar scrapeo de datos en cuanto a nombre y precio

library(magrittr) #for pipes
library(dplyr) #for pull function
library(rvest) #get html nodes
library(xml2) #pull html data
library(selectr) #for xpath element
library(tibble)
library(purrr)
library(stringr)

# Loading websites to scrap data
url <- read_html("C:/Users/ptoo5/Documents/R/chedraui.html")

Nameproducto <- url %>% html_nodes(xpath = '//*[@class="vtex-product-summary-2-x-productBrand vtex-product-summary-2-x-brandName t-body"]') %>% html_text()
Precioproducto <- url %>% html_nodes(xpath = '//*[@class="vtex-store-components-3-x-sellingPrice vtex-store-components-3-x-sellingPriceValue vtex-product-summary-2-x-sellingPrice dib ph2 t-body t-heading-5-ns vtex-product-summary-2-x-price_sellingPrice"]') %>% html_text()

Name <- str_to_lower(Nameproducto)

AllPrice <- str_to_lower(Precioproducto)


VerMatriz <- data.frame(Name, AllPrice)
View(VerMatriz)

#Ejemplo de busqueda
cant_data
cant_science
cant_harvard
cant_data <- sum(str_count(VerMatriz, regex("data")))
cant_science <- sum(str_count(VerMatriz, regex("science")))
cant_harvard <- sum(str_count(VerMatriz, regex("harvard")))

Nameproducto
Marcaproducto
Precioproducto
