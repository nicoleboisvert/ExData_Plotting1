##read data
mydata <- read.csv("household_power_consumption.txt", header = T, sep = ';', na.strings = "?", stringsAsFactors = F)

##subset data by date
mydata$Date <- as.Date(mydata$Date, format = "%d/%m/%Y")
mydata <- subset(mydata, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

##convert date to correct format
datetime <- paste(as.Date(mydata$Date), mydata$Time)
mydata$Datetime <- as.POSIXct(datetime)

##create and export plot 
png(filename = "./plot1.png", width = 480, height = 480)
hist(mydata$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")
dev.off()