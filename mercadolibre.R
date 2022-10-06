install.packages("rvest")
library(rvest)
library(stringr)

# Loading websites to scrap data
mercadolibre <- read_html("https://listado.mercadolibre.com.mx/filtro-de-aire-de-alto-flujo-led-para-motonet-vento-terra-z-150-2016#D[A:filtro%20de%20aire%20de%20alto%20flujo%20led%20para%20motonet%20vento%20terra%20z%20150%202016]")


Nameproducto <- mercadolibre %>% html_nodes(".shops__item-title") %>% html_text()

Nameproducto
