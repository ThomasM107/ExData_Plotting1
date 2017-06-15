## Load data into alldata and then select only 1st and 2nd February 2007
alldata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
##colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
twodaydata <- alldata[(alldata$Date == "1/2/2007" | alldata$Date == "2/2/2007" ),]

datetimechar <- do.call(paste, c(twodaydata[c("Date", "Time")], sep=" "))
twodaydata$datetime <- strptime(datetimechar, format = "%d/%m/%Y %H:%M:%S")
twodaydata$day <- weekdays(twodaydata$datetime)

## Plot figure and close png device
png(filename = "plot3.png")

plot(twodaydata$datetime, twodaydata$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering" )
lines(twodaydata$datetime, twodaydata$Sub_metering_2, type = "l", xlab = "", ylab = "Energy sub metering", col = "red")
lines(twodaydata$datetime, twodaydata$Sub_metering_3, type = "l", xlab = "", ylab = "Energy sub metering", col = "blue")
legend("topright", lty = 1, col = c("Black", "Red", "Blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()