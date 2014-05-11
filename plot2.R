# plot2.R

# Read data from txt file
data <- read.table('household_power_consumption.txt', sep=';',
                   header=T, na.strings='?')

#convert date and time to datetime
data$DateTime <- strptime(paste(data$Date, data$Time),
                          "%d/%m/%Y %H:%M:%S")

#subset required dates
data <- subset(data, as.Date(DateTime) >= as.Date("2007-02-01") &
                 as.Date(DateTime) <= as.Date("2007-02-02")
)

# Open png device
png("plot2.png", height=480, width=480)

# Build histogram
plot(data$DateTime, data$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")

# Close png device
dev.off()