# Ethan Bambock
# exdata-031 - Project 1: plot1.R
# 2015/08/07

library(dplyr)

# read in all data from source file
all_hpc<-read.csv("household_power_consumption.txt", sep=";", as.is=TRUE, skipNul=TRUE)
all_hpc$Date<-as.Date(all_hpc$Date, format="%d/%m/%Y")
class(all_hpc$Time) = c('POSIXt')

# parse out the february data for graphing
feb_hpc<-dplyr::filter(all_hpc, (all_hpc$Date == "2007/2/1" | all_hpc$Date == "2007/2/2"))

# set up the basic graphic device criteria for the plot
png("figure/plot1.png", height=480, width=480, res=100)
par(cex.axis=0.8, cex.lab=0.8)

# add the plots and annotations and write the file to disk with dev.off.
hist(as.numeric(feb_hpc$Global_active_power), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylim=c(0,1200))
dev.off()
