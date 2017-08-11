##read data
mydata <- read.csv("household_power_consumption.txt", header = T, sep = ';', na.strings = "?", stringsAsFactors = F)

##subset data by date
mydata$Date <- as.Date(mydata$Date, format = "%d/%m/%Y")
mydata <- subset(mydata, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

##convert date to correct format
datetime <- paste(as.Date(mydata$Date), mydata$Time)
mydata$Datetime <- as.POSIXct(datetime)

##create and export plot 
png(filename = "./plot4.png", width = 480, height = 480, units = "px", bg = "white")
par(mfrow = c(2,2), mar = c(4,4,4,3))
plot(mydata$Global_active_power ~ mydata$Datetime, type = "l",ylab = "Global Active Power (kilowatts)", xlab = "")

plot(mydata$Voltage ~ mydata$Datetime, type="l", ylab = "Voltage", xlab = "datetime")

plot(mydata$Sub_metering_1 ~ mydata$Datetime, type = "l", ylab = "Energy sub metering", xlab = "")
legend("topright", inset = .02, legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty=1, box.lwd = 0, box.col = "white",bg = "white")
lines(mydata$Sub_metering_2 ~ mydata$Datetime, type="l", col="red")
lines(mydata$Sub_metering_3 ~ mydata$Datetime, type="l", col="blue")

plot(mydata$Global_reactive_power ~ mydata$Datetime, type = "l", ylab = "Global_reactive_power", xlab = "datetime")
dev.off()