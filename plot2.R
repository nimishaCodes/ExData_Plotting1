setwd("C:/lakshmi/Data Science/coursera/assignments/Exploratory Data Analysis")
#read the entire data 
data_original <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
#subset data for required dates
data_required <- subset(data_original, Date %in% c("1/2/2007","2/2/2007"))
#format date to date/month/year
data_required$Date <- as.Date(data_required$Date, format="%d/%m/%Y")
dateAndtime <- paste(as.Date(data_required$Date), data_required$Time)
data_required$DateAndtime <- as.POSIXct(dateAndtime)

## produce Plot 2
with(data_required, {
  plot(Global_active_power~DateAndtime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
})
#call dev.copy with necessary arguments 
dev.copy(png, file="plot2.png", height=480, width=480)
#now write the plot to the file (plot1.png)
dev.off()