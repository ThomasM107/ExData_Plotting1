
## Load data into alldata and then select only 1st and 2nd February 2007
alldata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
##colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
twodaydata <- alldata[(alldata$Date == "1/2/2007" | alldata$Date == "2/2/2007" ),]

## Plot figure and close png device
png(filename = "plot1.png")
hist(twodaydata$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", xlim = c(0, 8), ylim = c(0, 1200))

dev.off()