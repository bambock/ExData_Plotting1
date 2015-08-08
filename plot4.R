# Ethan Bambock
# exdata-031 - Project 1: plot4.R
# 2015/08/07

library(dplyr)

# read in all data from source file
all_hpc<-read.csv("household_power_consumption.txt", sep=";", as.is=TRUE, skipNul=TRUE)
all_hpc$Date<-as.Date(all_hpc$Date, format="%d/%m/%Y")
class(all_hpc$Time) = c('POSIXt')

# parse out the february data for graphing
feb_hpc<-dplyr::filter(all_hpc, (all_hpc$Date == "2007/2/1" | all_hpc$Date == "2007/2/2"))

# set up the basic graphic device criteria for the plot
png("figure/plot4.png", height=600, width=600, res=100)
par(cex.axis=0.8, cex.lab=0.8, mfrow=c(2,2))

# adding the plots and annotations
plot(as.POSIXct(paste(feb_hpc$Date, feb_hpc$Time)), as.numeric(feb_hpc$Global_active_power), xlab="", ylab="Global Active Power (kilowatt)", type="l")
plot(as.POSIXct(paste(feb_hpc$Date, feb_hpc$Time)), as.numeric(feb_hpc$Voltage), xlab="datetime", ylab="Voltage", type="l")
with(feb_hpc, { 
    plot(as.POSIXct(paste(Date, Time)), as.numeric(Sub_metering_1), xlab="", ylab="Global Active Power (kilowatt)", col="black", type="l")
    lines(as.POSIXct(paste(Date, Time)), as.numeric(Sub_metering_2), col="red")
    lines(as.POSIXct(paste(Date, Time)), as.numeric(Sub_metering_3), col="blue")
    legend("topright", col=c("black","red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), cex=0.8)
})
plot(as.POSIXct(paste(feb_hpc$Date, feb_hpc$Time)), as.numeric(feb_hpc$Global_reactive_power), xlab="datetime", ylab="Global_reactive_power", type="l")

# write the graphics device to file
dev.off()
