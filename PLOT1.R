course <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
course$Date <- as.Date(course$Date, format="%d/%m/%Y")
febsubset <- course[(course$Date=="2007-02-01") | (course$Date=="2007-02-02"),]
febsubset$Global_active_power <- as.numeric(as.character(febsubset$Global_active_power))
febsubset$Global_reactive_power <- as.numeric(as.character(febsubset$Global_reactive_power))
febsubset$Voltage <- as.numeric(as.character(febsubset$Voltage))
febsubset <- transform(febsubset, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
hist(febsubset$Global_active_power, main = paste("Global Active Power"), col="red", xlab="Global Active Power (kilowatts)") 
dev.copy(png, file="plot1.png", width=480, height=480) 
dev.off() 





