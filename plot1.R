# Ethan Bambock
# exdata-014 - Project 1: plot1.R
# 2015/05/04

library(lubridate)
library(dplyr)

# read data from file
data<-read.csv("feb_power.txt", header=TRUE, sep=";")

# move to a dplyr table
power<-tbl_df(data)

# modify the date stamp
power<-power%>%mutate(NewDate=dmy(Date))


# set some standard settings for the plot
png("figure/Plot1.png", height=480, width=480, res=120)

# set some standard plot settings
par(cex.axis=0.6, cex.lab=0.6)

hist(power$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
