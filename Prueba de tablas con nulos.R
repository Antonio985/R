library(magrittr) #for pipes
library(dplyr) #for pull function
library(rvest) #get html nodes
library(xml2) #pull html data
library(selectr) #for xpath element
library(tibble)
library(purrr) #for map functions
library(datapasta) #for recreating tibble's with ease
#Sample Data
sample_data <- tibble::tibble(
  name = c("pollyanna-eleanor-with-vanilla-beans","brickstone-apa","penrose-taproom-ipa","revolution-rev-pils"),
  link = c("https://www.ratebeer.com/beer/pollyanna-eleanor-with-vanilla-beans/390639/",
           "https://www.ratebeer.com/beer/brickstone-apa/99472/",
           "https://www.ratebeer.com/beer/penrose-taproom-ipa/361258/",
           "https://www.ratebeer.com/beer/revolution-rev-pils/360716/"
  )
)

#the function:
get_beer_stats1 <- function(x){
  read_html(x) %>%
    html_nodes(xpath = '//*[@id="container"]/div[2]/div[2]/div[2]') %>%
    html_text()
}

get_beer_stats2 <- function(x){
  url <- read_html(x)
  html_doc <- html_nodes(url, xpath = '//*[@id="container"]/div[2]/div[2]/div[2]')
  stats <- html_text(html_doc)
  return(stats)
}


sample_data_rev <- sample_data %>%
  mutate(., beer_stats = map_chr(.x = link,    possibly(get_beer_stats1, otherwise= "NULL")))


debug(
  get_beer_stats1 <- function(x){
    read_html(x) %>%
      html_nodes(xpath = '//*[@id="container"]/div[2]/div[2]/div[2]') %>%
      html_text()
  } )


bad_data <- tibble::tribble(
  ~id, ~value,
  390639, “RATINGS: 4 MEAN: 3.83/5.0 WEIGHTED AVG: 3.39/5 IBU: 35 EST. CALORIES: 204 ABV: 6.8%”,
  99472, “RATINGS: 89 WEIGHTED AVG: 3.64/5 EST. CALORIES: 188 ABV: 6.25%”,
  361258, “RATINGS: 8 MEAN: 3.7/5.0 WEIGHTED AVG: 3.45/5 IBU: 85 EST. CALORIES: 213 ABV: 7.1%”
)
#' for reference
#' https://stackoverflow.com/questions/29265172/print-unicode-character-string-in-r
#' stringi also uses mostly UTF-8, which is very comforting to know
#'https://jangorecki.gitlab.io/data.table/library/stringi/html/stringi-encoding.html
str_detect(x$value, "\u00A0")
ex1 <- textclean::replace_non_ascii(bad_data$value)
ex2 <- rvest::repair_encoding(bad_data$value)

bad_data$value <- stringi::stri_trans_general(bad_data$value, “latin-ascii”)


