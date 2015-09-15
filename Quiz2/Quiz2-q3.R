sqldf("select distinct AGEP from acs")
length(unique(acs$AGEP)) # 91