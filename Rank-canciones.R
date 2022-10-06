library(dplyr)
library(xml2)
library(rvest)
hot100page <- ("https://www.billboard.com/charts/hot-100/")

hot100 <- read_html(hot100page)

hot100
str(hot100)

body_nodes <- hot100 %>%
  html_node("body") %>%
  html_children()

rank <- hot100 %>%
  rvest::html_nodes('body') %>%
  xml2::xml_find_all("//span[contains(@class,'c-label  a-font-primary-bold-l u-font-size-32@tablet u-letter-spacing-0080@tablet')]") %>%
  rvest::html_text(rank)

artist <- hot100 %>%
  rvest::html_nodes('body') %>%
  xml2::xml_find_all("//span[contains(@class,'c-label  a-no-trucate a-font-primary-s lrv-u-font-size-14@mobile-max u-line-height-normal@mobile-max u-letter-spacing-0021 lrv-u-display-block a-truncate-ellipsis-2line u-max-width-330 u-max-width-230@tablet-only u-font-size-20@tablet')]") %>%
  rvest::html_text(artist)

title <- hot100 %>%
  rvest::html_nodes('body') %>%
  xml2::xml_find_all("//h3[contains(@class,'c-title  a-no-trucate a-font-primary-bold-s u-letter-spacing-0021 u-font-size-23@tablet lrv-u-font-size-16 u-line-height-125 u-line-height-normal@mobile-max a-truncate-ellipsis u-max-width-245 u-max-width-230@tablet-only u-letter-spacing-0028@tablet')]") %>%
  rvest::html_text(title)

chart_df <- data.frame(rank, artist, title)
knitr::kable(
  chart_df head(10)
)
