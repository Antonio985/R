## Install & Evoke packages
install.packages("rvest")
library(rvest)
library(stringr)

# Loading websites to scrap data
url <- read_html("https://www.udemy.com/courses/development/")


NameCurso <- url %>% html_nodes("udlite-heading-md course-card--course-title--vVEjC") %>% html_text()
CostCurso <- url %>% html_nodes("span.price-text--container--103D9 .udlite-heading-md span") %>% html_text()

NameCurso
costCurso

sum(str_count(namesC, regex("game")))