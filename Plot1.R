## Getting full dataset from working directory 
datafile <- read.csv("./EDA/household_power_consumption.txt", header=T, sep=';', na.strings="?",  
nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"') 

## Format date and active power column
datafile$Date <- as.Date(datafile$Date, format="%d/%m/%Y") 
datafile$Global_active_power <- as.numeric(datafile$Global_active_power)
 ## Subsetting the data 

subsetdata <- subset(datafile, Date == "2007-02-01" | Date =="2007-02-02")


## Plot Histogram 
hist(subsetdata$Global_active_power, main = "Global active power", xlab = "Global active power (kilowatts)",
     ylab = "Frequency", col = "Red")



## Saving to file 
dev.copy(png, file="plot1.png", width=480, height=480) 
dev.off() 
