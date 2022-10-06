url.ibex <- "http://www.bolsamadrid.es/esp/aspx/Mercados/Precios.aspx?indice=ESI100000000"
tmp <- read_html(url.ibex)
tmp <- html_nodes(tmp, "table")
length(tmp)
sapply(tmp, class)
sapply(tmp, function(x) dim(html_table(x, fill = TRUE)))
ibex <- html_table(tmp[[5]])
ibex
