hurl <- "http://biostat.jhsph.edu/~jleek/contact.html" 
con <- url(hurl)
htmlCode <- readLines(con)
close(con)
sapply(htmlCode[c(10, 20, 30, 100)], nchar)
#<meta name="Distribution" content="Global" /> 
#    45 
#<script type="text/javascript"> 
#    31 
#})(); 
#7 
#\t\t\t\t<ul class="sidemenu"> 
#    25