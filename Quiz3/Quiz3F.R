setwd("~/R_Coursera Files/GettingandCleaning-Data/Quiz3")

#QUESTION 1
#The American Community Survey distributes downloadable data about United States communities. 
#Download the 2006 microdata survey about housing for the state of Idaho using download.file() from here:
#https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv
#and load the data into R. The code book, describing the variable names is here:
#https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf
#Create a logical vector that identifies the households on greater than 10 acres who sold more than $10,000 
#worth of agriculture products. Assign that logical vector to the variable agricultureLogical. 
#Apply the which() function like this to identify the rows of the data frame where the logical vector is TRUE. 
#which(agricultureLogical) What are the first 3 values that result?

Load packages.

packages <- c("data.table", "jpeg")
sapply(packages, require, character.only = TRUE, quietly = TRUE)

## data.table       jpeg 
##       TRUE       TRUE

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
f <- file.path(getwd(), "ss06hid.csv")
download.file(url, f)
dt <- data.table(read.csv(f))
agricultureLogical <- dt$ACR == 3 & dt$AGS == 6
which(agricultureLogical)[1:3]

## [1] 125 238 262

##Question 2

##Using the jpeg package read in the following picture of your instructor into R

##https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg

##Use the parameter native=TRUE. What are the 30th and 80th quantiles of the resulting data?

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
f <- file.path(getwd(), "jeff.jpg")
download.file(url, f, mode = "wb")
img <- readJPEG(f, native = TRUE)
quantile(img, probs = c(0.3, 0.8))

##       30%       80% 
## -15259150 -10575416


# write the file url and file destination to an object
file.url <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv'
file.dest <- 'GDP.csv'

# download from the URL
download.file(file.url, file.dest )

# specify the right lines
rowNames <- seq(10,200, 2)

# read the data
gdp <- read.csv('GDP.csv', header=F, skip=5, nrows=190)
View(gdp)

# second data file
file.url <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv'
file.dest <- 'GDP2.csv'

# download from the URL
download.file(file.url, file.dest )

# read second file
fed <- read.csv('GDP2.csv')
View(fed)

# merge datasets
combined <- merge(gdp, fed, by.x='V1', by.y='CountryCode', sort=TRUE)
View(combined)

## Q3.
# sort the data
combined[with(combined, order(-V2) )]

# [1] 189

## Q4.
# OECD
mean(combined[combined$Income.Group=='High income: OECD',]$V2)
#[1] 32.96667

# non OECD
mean(combined[combined$Income.Group=='High income: nonOECD',]$V2)

#[1] 91.91304

## Q5.
# assign quentile values
quentile <- c(0.2,0.4,0.6,0.8,1)
q <- quantile(combined$V2, quentile)
q1 <- combined$V2 <= 38

xtabs(q1 ~ combined$Income.Group)

#combined$Income.Group
##High income: nonOECD    High income: OECD 
#0                    4                   18 
##Low income  Lower middle income  Upper middle income 
#0                    5                   11 