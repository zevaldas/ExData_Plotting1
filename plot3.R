## Read and prepare data
data <- read.csv("household_power_consumption.txt", sep=';', na.strings="?",
                stringsAsFactors=F)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data <- subset(data, subset=(Date == "2007-02-01" | Date == "2007-02-02"))
data$DateTime <- as.POSIXct(paste(as.Date(data$Date), data$Time))

## Save plot number 3 to png
png(filename="plot3.png", height=480, width=480)
with(data, {
        plot(Sub_metering_1 ~ DateTime, type="l", ylab="Energy sub metering", 
                xlab="")
        lines(Sub_metering_2 ~ DateTime, col='Red')
        lines(Sub_metering_3 ~ DateTime, col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, 
        legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()ss