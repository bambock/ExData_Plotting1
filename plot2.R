# Ethan Bambock
# exdata-031 - Project 1: plot2.R
# 2015/08/07

library(dplyr)

# read in all data from source file
all_hpc<-read.csv("household_power_consumption.txt", sep=";", as.is=TRUE, skipNul=TRUE)
all_hpc$Date<-as.Date(all_hpc$Date, format="%d/%m/%Y")
class(all_hpc$Time) = c('POSIXt')

# parse out the february data for graphing
feb_hpc<-dplyr::filter(all_hpc, (all_hpc$Date == "2007/2/1" | all_hpc$Date == "2007/2/2"))

# set up the basic graphic device criteria for the plot
png("figure/plot2.png", height=480, width=480, res=100)
par(cex.axis=0.8, cex.lab=0.8)

# add the plots and annotations and write the file to disk with dev.off.
plot(as.POSIXct(paste(feb_hpc$Date, feb_hpc$Time)), as.numeric(feb_hpc$Global_active_power), xlab="", ylab="Global Active Power (kilowatt)", type="l")
dev.off()







