
fileName <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileName, destfile="localName", method="curl")
rawFile <- unz("localName", "household_power_consumption.txt")
wholeTable <- read.table(rawFile, header=T, sep=';', na.strings="?", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
subsetTable <- wholeTable[(wholeTable$Date == "1/2/2007") | (wholeTable$Date == "2/2/2007"),]
subsetTable$DateTime <- strptime(paste(subsetTable$Date, subsetTable$Time), "%d/%m/%Y %H:%M:%S")
png(filename = "plot3.png", width = 480, height = 480, units = "px")
cols = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
plot(subsetTable$DateTime, subsetTable$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(subsetTable$DateTime, subsetTable$Sub_metering_2, type="l", col="red")
lines(subsetTable$DateTime, subsetTable$Sub_metering_3, type="l", col="blue")
legend("topright", lty=1, lwd=1, col=c("black","blue","red"), legend=cols)
dev.off()
