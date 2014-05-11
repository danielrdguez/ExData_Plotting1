# plot1.R

# Read data from txt file
data <- read.table('household_power_consumption.txt', sep=';',
                   header=T, na.strings='?')

# Convert date to suitable format
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

#subset required dates
data <- subset(data, as.Date(Date) >= as.Date("2007-02-01") &
                 as.Date(Date) <= as.Date("2007-02-02")
)

# Open png device
png("plot1.png", height=480, width=480)

# Build histogram
hist(data$Global_active_power, col='red',
     xlab = 'Global Active Power (kilowatts)',
     main = 'Global Active Power')

# Close png device
dev.off()
