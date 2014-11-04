## Read entire data set, change the date format, and extract data where Date
## between '01/02/2007' and '02/02/2007'

allData <- read.table("household_power_consumption.txt", header=TRUE, sep=";",
                      na.strings = "?")
allData$Date <- as.Date(allData$Date, format="%d/%m/%Y")
data <- subset(allData, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))


## Creating and plotting 4th plot
## Note: Did not plot on screen then copy to png file as the latter does not resize well.

png(file="plot4.png", width=480, height=480)

par(mfcol=c(2,2))

## 1st sub-plot (similar to plot2.R)

plot(strptime(paste(data$Date,data$Time),"%Y-%m-%d %H:%M:%S"), 
     data$Global_active_power, type="l" , xlab="", 
     ylab="Global Active Power (kilowatts)")

## 2nd sub-plot (similar to plot3.R)

plot(strptime(paste(data$Date,data$Time),"%Y-%m-%d %H:%M:%S"), 
     data$Sub_metering_1, type="l" , xlab="", 
     ylab="Energy sub metering")
lines(strptime(paste(data$Date,data$Time),"%Y-%m-%d %H:%M:%S"),
      data$Sub_metering_2, col="red")
lines(strptime(paste(data$Date,data$Time),"%Y-%m-%d %H:%M:%S"),
      data$Sub_metering_3, col="blue")

legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col=c("black","red","blue"), lty=1, bty="n")

## 3rd sub-plot

plot(strptime(paste(data$Date,data$Time),"%Y-%m-%d %H:%M:%S"), 
     data$Voltage, type="l" , xlab="datetime", ylab="Voltage")

## 4th sub-plot

plot(strptime(paste(data$Date,data$Time),"%Y-%m-%d %H:%M:%S"), 
     data$Global_reactive_power, type="l" , xlab="datetime", 
     ylab="Global_reactive_power")

dev.off()