##read data
mydata <- read.csv("household_power_consumption.txt", header = T, sep = ';', na.strings = "?", stringsAsFactors = F)

##subset data by date
mydata$Date <- as.Date(mydata$Date, format = "%d/%m/%Y")
mydata <- subset(mydata, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

##convert date to correct format
datetime <- paste(as.Date(mydata$Date), mydata$Time)
mydata$Datetime <- as.POSIXct(datetime)

##create and export plot 
png(filename = "./plot3.png", width = 480, height = 480)
plot(mydata$Sub_metering_1 ~ mydata$Datetime, type = "l", ylab = "Energy sub metering", xlab = "")
lines(mydata$Sub_metering_2 ~ mydata$Datetime, type="l", col="red")
lines(mydata$Sub_metering_3 ~ mydata$Datetime, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty=1)
dev.off()