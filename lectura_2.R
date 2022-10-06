library(dplyr)
library(xml2)
library(rvest)
url <- read_html("C:/Users/ptoo5/Documents/R/edx.html")



url
str(url)

body_nodes <- url %>%
  html_node("body") %>%
  html_children()

nombres <- url %>%
  rvest::html_nodes('body') %>%
  xml2::xml_find_all("//span[contains(@class,'.selectorgadget_suggested')]") %>%
  rvest::html_text(nombres)