## Getting full dataset from working directory 
datafile <- read.csv("C://Users//BZM11//Documents//R//EDA/household_power_consumption.txt", header=T, sep=';', na.strings="?",  
                     nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"') 

## Format date and active power column
datafile$Date <- as.Date(datafile$Date, format="%d/%m/%Y") 
datafile$Global_active_power <- as.numeric(datafile$Global_active_power)
datafile$Sub_metering_1 <- as.numeric(datafile$Sub_metering_1)
datafile$Sub_metering_2 <- as.numeric(datafile$Sub_metering_2)
datafile$Sub_metering_3 <- as.numeric(datafile$Sub_metering_3)
## Subsetting the data 

subsetdata <- subset(datafile, Date == "2007-02-01" | Date =="2007-02-02")

## Converting the dates

Datetime <- paste(as.Date(subsetdata$Date), subsetdata$Time)  
subsetdata$Datetime <- as.POSIXct(datetime) 


## Create the plot


with(subsetdata, {
  plot(Datetime, Sub_metering_1, type = "l",
       ylab = "Energy sub metering", xlab = "")
  lines(Datetime, Sub_metering_2, col = "Red")
  lines(Datetime, Sub_metering_3, col = "Blue")
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


## Saving to file 
dev.copy(png, file="plot3.png", width=480, height=480) 
dev.off() 
