## Read entire data set, change the date format, and extract data where Date
## between '01/02/2007' and '02/02/2007'

allData <- read.table("household_power_consumption.txt", header=TRUE, sep=";",
                      na.strings = "?")
allData$Date <- as.Date(allData$Date, format="%d/%m/%Y")
data <- subset(allData, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))


## Creating and plotting 3rd plot
## Note: Did not plot on screen then copy to png file as the latter does not resize well.

png(file="plot3.png", width=480, height=480)

plot(strptime(paste(data$Date,data$Time),"%Y-%m-%d %H:%M:%S"), 
     data$Sub_metering_1, type="l" , xlab="", 
     ylab="Energy sub metering")
lines(strptime(paste(data$Date,data$Time),"%Y-%m-%d %H:%M:%S"),
     data$Sub_metering_2, col="red")
lines(strptime(paste(data$Date,data$Time),"%Y-%m-%d %H:%M:%S"),
      data$Sub_metering_3, col="blue")

legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col=c("black","red","blue"), lty=1)

dev.off()