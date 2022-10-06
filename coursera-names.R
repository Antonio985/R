library("rvest")
coursera <- "https://www.coursera.org/"
 
pagina <- read_html(coursera)



css_curso <- "div.rc-CardText productCard-title"

curso_html <- html_nodes(pagina, css_curso)

producto_texto <- html_text(curso_html)


producto_texto

