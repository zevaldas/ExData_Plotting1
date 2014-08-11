## Read and prepare data
data <- read.csv("household_power_consumption.txt", sep=';', na.strings="?",
                 stringsAsFactors=F)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data <- subset(data, subset=(Date == "2007-02-01" | Date == "2007-02-02"))
data$DateTime <- as.POSIXct(paste(as.Date(data$Date), data$Time))

## Save plot number 4 to png
png(filename="plot4.png", height=480, width=480)
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data, {
        plot(Global_active_power ~ DateTime, type="l", 
               ylab="Global Active Power", xlab="")
        plot(Voltage ~ DateTime, type="l",  ylab="Voltage", xlab="datatime")
        plot(Sub_metering_1 ~ DateTime, type="l", 
               ylab="Energy sub metering", xlab="")
        lines(Sub_metering_2 ~ DateTime, col='Red')
        lines(Sub_metering_3 ~ DateTime, col='Blue')
        legend("topright", col=c("black", "red", "blue"), 
               lty=1, lwd=2, bty="n", 
               legend=c("Sub_metering_1", "Sub_metering_2",
                        "Sub_metering_3"))
        plot(Global_reactive_power ~ DateTime, type="l", 
               xlab="datattime")
})
dev.off()