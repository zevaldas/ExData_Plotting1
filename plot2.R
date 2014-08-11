## Read and prepare data
data <- read.csv("household_power_consumption.txt", sep=';', na.strings="?",
                stringsAsFactors=F)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data <- subset(data, subset=(Date == "2007-02-01" | Date == "2007-02-02"))
data$DateTime <- as.POSIXct(paste(as.Date(data$Date), data$Time))

## Save plot number 2 to png
png(filename="plot2.png", height=480, width=480)
plot(data$Global_active_power ~ data$DateTime, 
                type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()