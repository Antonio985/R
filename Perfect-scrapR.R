## Install & Evoke packages
install.packages("rvest")
library(rvest)
library(stringr)

# Loading websites to scrap data
url <- read_html("https://libretilla.com/webs-mas-visitadas-mexico/")


Sites <- url %>% html_nodes(".row-hover .column-2") %>% html_text()
Timein <- url %>% html_nodes(".row-hover .column-3") %>% html_text()
DailyPerPerson <-  url %>% html_nodes(".row-hover .column-4") %>% html_text()


# Creating a DataFrame
TopMexico <- data.frame(Sites, Timein, DailyPerPerson)
View(TopMexico)

sum(str_count(Sites, regex(".mx")))

# Write the data to a file
getwd()
write.csv(Alexatopsites, file = "Alexa Top Sites.csv")