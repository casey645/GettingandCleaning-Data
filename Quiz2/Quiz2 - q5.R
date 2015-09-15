# Problem 5.
list.files()
data <- read.csv("./getdata-wksst8110.for", header=T)
head(data)
dim(data)
file_name <- "./getdata-wksst8110.for"
df <- read.fwf(file=file_name,widths=c(-1,9,-5,4,4,-5,4,4,-5,4,4,-5,4,4), skip=4)
head(df)
sum(df[, 4])