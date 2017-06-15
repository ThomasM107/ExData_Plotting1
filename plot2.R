## Load data into alldata and then select only 1st and 2nd February 2007
alldata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
##colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
twodaydata <- alldata[(alldata$Date == "1/2/2007" | alldata$Date == "2/2/2007" ),]

datetimechar <- do.call(paste, c(twodaydata[c("Date", "Time")], sep=" "))
twodaydata$datetime <- strptime(datetimechar, format = "%d/%m/%Y %H:%M:%S")
twodaydata$day <- weekdays(twodaydata$datetime)

## Plot figure and close png device
png(filename = "plot2.png")

plot(twodaydata$datetime, twodaydata$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)" )

dev.off()