##Data Cleaning Quiz1 
##Question 5
library(data.table)
DT <- fread(input="getdata-data-ss06pid.csv", sep=",")
system.time(mean(DT$pwgtp15,by=DT$SEX))
##    user  system elapsed 
##       0       0       0
system.time(tapply(DT$pwgtp15,DT$SEX,mean))
##    user  system elapsed 
##   0.002   0.001   0.003
system.time(mean(DT[DT$SEX==1,]$pwgtp15), mean(DT[DT$SEX==2,]$pwgtp15))
##    user  system elapsed 
##   0.043   0.005   0.050
system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))
##    user  system elapsed 
##   0.001   0.000   0.001
system.time(DT[,mean(pwgtp15),by=SEX])
##    user  system elapsed 
##   0.003   0.001   0.005
system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))
##    user  system elapsed 
##   0.002   0.000   0.001


