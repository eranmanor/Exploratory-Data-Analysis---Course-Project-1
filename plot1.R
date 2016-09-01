# Reading Power Consumption Data into a table
hhPowerConsum <- read.table("household_power_consumption.txt", skip = 1, sep = ";", na.strings = "?")
names(hhPowerConsum) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

# Subsetting the data to include only the relevant data from the plot graphs - between 1/2/2007 - 2/2/2007
plotData <- subset(hhPowerConsum, hhPowerConsum$Date == "1/2/2007" | hhPowerConsum$Date == "2/2/2007")

# Opening the PNG device and defining the file name and Width & Height
png(filename = "plot1.png", width = 489, height = 480, units = "px")

# Calling the Histogram plot function 
hist(plotData$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.off()