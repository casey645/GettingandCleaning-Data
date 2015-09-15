##DataCleaning Quiz 1, question - 4
library(XML)
file <- "http://d396qusza40orc.cloudfront.net/getdata/data/restaurants.xml"
my.doc <- xmlTreeParse(file=file,useInternal=TRUE)
root.Node <- xmlRoot(my.doc)
xmlName(root.Node)
## [1] "response"
zipcode <- xpathSApply(root.Node, "//zipcode", xmlValue)
length(zipcode[zipcode==21231])
## [1] 127

