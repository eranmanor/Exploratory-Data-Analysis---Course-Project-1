# Reading Power Consumption Data into a table
hhPowerConsum <- read.table("household_power_consumption.txt", skip = 1, sep = ";", na.strings = "?")
names(hhPowerConsum) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

# Subsetting the data to include only the relevant data from the plot graphs - between 1/2/2007 - 2/2/2007
plotData <- subset(hhPowerConsum, hhPowerConsum$Date == "1/2/2007" | hhPowerConsum$Date == "2/2/2007")

# Transforming the Date and Time variables to Date/Time classes

datetime <- strptime(paste(plotData$Date, plotData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
plotData$dateTime <- as.POSIXct(datetime)

# Opening the PNG device and defining the file name and Width & Height
png(filename = "plot4.png", width = 489, height = 480, units = "px")

# Setting Environment parameters for multi plot graphs
par(mfrow=c(2,2))

# Creating top left graph - Global Active Power~Date/Time
with(plotData, plot(dateTime, Global_active_power, type = "l", ylab = "Global Active Power", xlab = ""))

# Creating top right graph - Voltage~Date/Time
with(plotData, plot(dateTime, Voltage, type = "l", ylab = "Voltage", xlab = "datetime"))

# Creating bottom left graph - Energy Sub metering~Date/Time
with(plotData, plot(dateTime, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = ""))
with(plotData, lines(dateTime, Sub_metering_2, col = "red"))
with(plotData, lines(dateTime, Sub_metering_3, col = "blue"))
legend("topright", lty=1, bty = "n", col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# Creating bottom right graph - Global Reactive Power~Date/Time
with(plotData, plot(dateTime, Global_reactive_power, type = "l"))

# Shuting off plot device
dev.off()
