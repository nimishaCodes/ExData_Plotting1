setwd("C:/lakshmi/Data Science/coursera/assignments/Exploratory Data Analysis")
#read the entire data 
data_original <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
#subset data for required dates
data_required <- subset(data_original, Date %in% c("1/2/2007","2/2/2007"))
#format date to date/month/year
data_required$Date <- as.Date(data_required$Date, format="%d/%m/%Y")
dateAndtime <- paste(as.Date(data_required$Date), data_required$Time)
data_required$DateAndtime <- as.POSIXct(dateAndtime)

# initiating a composite plot with many graphs
par(mfrow=c(2,2))
# calling plot functions to build 4 plots that form the graph

with(data_required, {
  plot(Global_active_power~DateAndtime, type="l", 
       ylab="Global Active Power", xlab="")
  plot(Voltage~DateAndtime, type="l", 
       ylab="Voltage", xlab="")
  plot(Sub_metering_1~DateAndtime, type="l", 
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~DateAndtime,col='Red')
  lines(Sub_metering_3~DateAndtime,col='Blue')
  legend("topright", lty=1, col=c("black","red","blue"),
         legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
         cex = 0.6)
  plot(Global_reactive_power~DateAndtime, type="l", 
       ylab="Global_reactive_power",xlab="")
})


## Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)

dev.off()