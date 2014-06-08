
fileName <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileName, destfile="localName", method="curl")
rawFile <- unz("localName", "household_power_consumption.txt")
wholeTable <- read.table(rawFile, header=T, sep=';', na.strings="?", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
subsetTable <- wholeTable[(wholeTable$Date == "1/2/2007") | (wholeTable$Date == "2/2/2007"),]
subsetTable$DateTime <- strptime(paste(subsetTable$Date, subsetTable$Time), "%d/%m/%Y %H:%M:%S")
png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(subsetTable$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off()
