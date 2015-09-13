# read data file
pow <- read.table(file="household_power_consumption.txt", header=TRUE, sep=";", na.strings="?",
                  stringsAsFactors=FALSE)

# convert Time column
pow$Time <- strptime(x=paste(pow$Date, pow$Time), format="%d/%m/%Y %H:%M:%S")
# convert Date column
pow$Date <- as.Date(x=pow$Date, format="%d/%m/%Y")

# subset relevant data
pow <- subset(pow, Date=="2007-02-01" | Date=="2007-02-02")

# plot to png file
png("plot4.png", width = 480, height = 480)
par(mfcol = c(2, 2))
plot(x=pow$Time, y=pow$Global_active_power, type="l", xlab="", ylab="Global Active Power")
with(pow, plot(x=Time, y=Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
with(pow, lines(x=Time, y=Sub_metering_2, col="red"))
with(pow, lines(x=Time, y=Sub_metering_3, col="blue"))
legend(x="topright", pch="-", col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
with(pow, plot(x=Time, y=Voltage, type="l", xlab="datetime"))
with(pow, plot(x=Time, y=Global_reactive_power, type="l", xlab="datetime"))
dev.off()
