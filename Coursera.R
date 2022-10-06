## Install & Evoke packages
#install.packages("rvest")
library(rvest)
library(stringr)

# Loading websites to scrap data
url <- read_html("https://www.coursera.org/browse/computer-science")


namesC <- url %>% html_nodes(".nostyle div div div :nth-child(1)") %>% html_text()
namesC2 <- url %>% html_nodes(".CardText-link") %>% html_text()

namesC

sum(str_count(namesC, regex("game")))
