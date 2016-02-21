course <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
course$Date <- as.Date(course$Date, format="%d/%m/%Y")
febsubset <- course[(course$Date=="2007-02-01") | (course$Date=="2007-02-02"),]
febsubset$Global_active_power <- as.numeric(as.character(febsubset$Global_active_power))
febsubset$Global_reactive_power <- as.numeric(as.character(febsubset$Global_reactive_power))
febsubset$Voltage <- as.numeric(as.character(febsubset$Voltage))
febsubset <- transform(febsubset, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

febsubset$Sub_metering_1 <- as.numeric(as.character(febsubset$Sub_metering_1))
febsubset$Sub_metering_2 <- as.numeric(as.character(febsubset$Sub_metering_2))
febsubset$Sub_metering_3 <- as.numeric(as.character(febsubset$Sub_metering_3))

par(mfrow=c(2,2))
plot(febsubset$timestamp, febsubset$Global_active_power, type="l", xlab="", ylab="Global Active Power")
plot(febsubset$timestamp, febsubset$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(febsubset$timestamp, febsubset$Sub_metering_1, type="l", xlab="", ylab="Energy Sub Metering")
lines(febsubset$timestamp, febsubset$Sub_metering_2,col="red")
lines(febsubset$timestamp, febsubset$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1 ","Sub_metering_2 ", "Sub_metering_3"),lty=c(1,1), bty="n", cex=.5) 
plot(febsubset$timestamp, febsubset$Global_reactive_power, type="l", xlab="datetime", ylab="Global Reactive Power")
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()

