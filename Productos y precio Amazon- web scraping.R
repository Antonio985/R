library("rvest")
url <- "https://www.amazon.com.mx/b/ref=s9_acsd_hfnv_hd_bw_bAcAgpX_ct_x_ct00_w?_encoding=UTF8&node=9725407011&pf_rd_m=AVDBXBAVVSXLQ&pf_rd_s=merchandised-search-4&pf_rd_r=Q47SQG6GBGGECT1SXNZY&pf_rd_t=101&pf_rd_p=8cc61471-874f-5f7f-96d7-e2b634466523&pf_rd_i=9725377011"

pagina_web <- read_html(url)

css_producto <- "a.a-link-normal s-underline-text s-underline-link-text s-link-style a-text-normal"

producto_html <- html_nodes(pagina_web, css_product)

producto_texto <- html_text(producto_html)

producto_texto

css_precio <- "span.a-price-whole"

precio_html <- html_nodes(pagina_web,css_precio)

precio_texto <- html_text(precio_html)

precio_texto

precio_limpio <- gsub(",","",precio_texto)
precio_numerico <- as.numeric(precio_limpio)

precio_numerico




productos <- data.frame(Producto = producto_texto, Precio = precio_numerico)

barplot(precio_numerico)
