## Install & Evoke packages
install.packages("rvest")
library(rvest)
library(stringr)

# Loading websites to scrap data
url <- read_html("https://www.edx.org/search?subject=Data+Analysis+%26+Statistics&tab=course")


NameCurso <- url %>% html_nodes(".h4 span") %>% html_text()
CostCurso <- url %>% html_nodes("span.price-text--container--103D9 .udlite-heading-md span") %>% html_text()

NameCurso
costCurso

sum(str_count(namesC, regex("game")))