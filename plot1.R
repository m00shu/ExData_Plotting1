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
png("plot1.png", width = 480, height = 480)
hist(x=pow$Global_active_power, main="Global Active Power", col="red", 
     xlab="Global Active Power (kilowatts)", ylim=c(0,1200))
dev.off()
