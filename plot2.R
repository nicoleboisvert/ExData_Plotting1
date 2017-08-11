##read data
mydata <- read.csv("household_power_consumption.txt", header = T, sep = ';', na.strings = "?", stringsAsFactors = F)

##subset data by date
mydata$Date <- as.Date(mydata$Date, format = "%d/%m/%Y")
mydata <- subset(mydata, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

##convert date to correct format
datetime <- paste(as.Date(mydata$Date), mydata$Time)
mydata$Datetime <- as.POSIXct(datetime)

##create and export plot 
png(filename = "./plot2.png", width = 480, height = 480)
plot(mydata$Global_active_power ~ mydata$Datetime, type = "l",ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()