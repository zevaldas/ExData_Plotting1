## Read and prepare data
data <- read.csv("household_power_consumption.txt", sep=';', na.strings="?",
                stringsAsFactors=F)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data <- subset(data, subset=(Date == "2007-02-01" | Date == "2007-02-02"))

## Save plot number 1 to png
png(filename="plot1.png", height=480, width=480)
hist(data$Global_active_power, main="Global Active Power", 
                xlab="Global Active Power (kilowatts)", col="Red")
dev.off()