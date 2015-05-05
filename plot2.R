# Ethan Bambock
# exdata-014 - Project 1: plot2.R
# 2015/05/04

library(lubridate)
library(dplyr)

# read data from file
data<-read.csv("feb_power.txt", header=TRUE, sep=";")

# move to a dplyr table
power<-tbl_df(data)

# add day of week column
power<-power%>%mutate(NewDate=dmy(Date))
power<-power%>%mutate(Weekday=wday(Date, label=TRUE))

# set some standard settings for the plot
png("figure/Plot2.png", height=480, width=480, res=120)

# set some standard plot settings
par(cex.axis=0.6, cex.lab=0.6)
plot(as.POSIXct(paste(power$NewDate, power$Time)), power$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="l")
dev.off()