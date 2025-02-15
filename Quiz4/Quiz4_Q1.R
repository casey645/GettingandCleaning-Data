#Cousera Getting and Cleaning Data
# Quiz4_Q1

# download data
file.url <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv'
file.dest <- 'ACS4.csv'
download.file(file.url, file.dest, method='curl')

# load the data
ACS <- read.csv(file.dest)

# extract names
names <- names(ACS)

# string split
strsplit(names, 'wgtp')[123]