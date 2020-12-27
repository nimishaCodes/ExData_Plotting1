setwd("C:/lakshmi/Data Science/coursera/assignments/Exploratory Data Analysis")
#read the entire data 
data_original <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
#subset data for required dates
data_required <- subset(data_original, Date %in% c("1/2/2007","2/2/2007"))
#format date to date/month/year
data_required$Date <- as.Date(data_required$Date, format="%d/%m/%Y")
dateAndtime <- paste(as.Date(data_required$Date), data_required$Time)
data_required$DateAndtime <- as.POSIXct(dateAndtime)
#produce plots for sub_metering_1, Sub_metering_2 and Sub_metering_3
with(data_required, {
  plot(Sub_metering_1~DateAndtime, type="l",
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~DateAndtime,col='Red')
  lines(Sub_metering_3~DateAndtime,col='Blue')
})
#legend
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Saving commands to file
dev.copy(png, file="plot3.png", height=480, width=480)
#writing plots to the png file
dev.off()