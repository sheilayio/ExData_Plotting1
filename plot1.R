## Read entire data set, change the date format, and extract data where Date
## between '01/02/2007' and '02/02/2007'

allData <- read.table("household_power_consumption.txt", header=TRUE, sep=";",
                   na.strings = "?")
allData$Date <- as.Date(allData$Date, format="%d/%m/%Y")
data <- subset(allData, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))


## Creating and plotting 1st plot
## Note: Did not plot on screen then copy to png file as the latter does not resize well.

png(file="plot1.png", width=480, height=480)

hist(data$Global_active_power, main="Global Active Power", col="red",
     xlab="Global Active Power (kilowatts)", ylab="Frequency")

dev.off()
