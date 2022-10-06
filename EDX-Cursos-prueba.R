library(rvest)
library(stringr)

# Loading websites to scrap data
url <- read_html("C:/Users/ptoo5/Documents/R/edx.html")


NameCurso <- url %>% html_nodes(".selectorgadget_suggested") %>% html_text()

NameCurso

sum(str_count(NameCurso, regex("Data")))
lapply(Nombresedx, tolower)



Nombresedx <- data.frame(NameCurso)
View(Nombresedx)

