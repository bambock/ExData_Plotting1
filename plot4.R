# Ethan Bambock
# exdata-014 - Project 1: plot4.R
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
png("figure/Plot4.png", height=500, width=500, res=120)

# set some standard plot settings
par(cex.axis=0.6, cex.lab=0.6, mfrow=c(2,2), mar=c(2, 4, 2, 2))

## plot voltage over time
plot(as.POSIXct(paste(power$NewDate, power$Time)), power$Global_active_power, xlab="datetime", ylab="Global Active Power (kilowatts)", type="l")


## plot voltage over time
plot(as.POSIXct(paste(power$NewDate, power$Time)), power$Voltage, xlab="datetime", ylab="Voltage", type="l")


## plot sub metering counts over time
plot(as.POSIXct(paste(power$NewDate, power$Time)), power$Sub_metering_1, xlab="", ylab="Energy sub metering", type="l")
lines(as.POSIXct(paste(power$NewDate, power$Time)), power$Sub_metering_2, col="red")
lines(as.POSIXct(paste(power$NewDate, power$Time)), power$Sub_metering_3, col="blue")

## plot reactive power over time
plot(as.POSIXct(paste(power$NewDate, power$Time)), power$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="l")

dev.off()
