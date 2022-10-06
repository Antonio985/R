library(rvest)
library(stringr)
library(dplyr)

# Loading websites to scrap data
url <- read_html("C:/Users/ptoo5/Documents/R/edx.html")


NameCurso <- url %>% html_nodes(xpath = '//*[@class="discovery-card col"]') %>% html_text()

NameCurso
Matriz <- str_to_lower(NameCurso)
VerMatriz <- data.frame(Matriz)
View(VerMatriz)
cant_data
cant_science
cant_harvard
cant_data <- sum(str_count(VerMatriz, regex("data")))
cant_science <- sum(str_count(VerMatriz, regex("science")))
cant_harvard <- sum(str_count(VerMatriz, regex("harvard")))

#data <- VerMatriz %>% filter(str_detect(Matriz, 'data'))

Cantidades_Search <- data.frame(cant_data, cant_science, cant_harvard)
View(Cantidades_Search)
Nombresedx <- data.frame(NameCurso)
View(Nombresedx)

# Write the data to a file
getwd()
write.csv(Cantidades_Search,"C:/Users/ptoo5/Documents/R/Cantidades_Busqueda.csv", row.names = FALSE)


#Matriz <- stringr::str_extract(NameCurso, "([:alpha:]+ ?)+") 
# corta al toparse con un caracter especial
#Final <- data.frame(Matriz)
#View(Final)