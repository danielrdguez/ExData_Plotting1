# plot4.R

# Read data from txt file
data <- read.table('household_power_consumption.txt', sep=';',
                   header=T, na.strings='?')

# convert date and time to datetime
data$DateTime <- strptime(paste(data$Date, data$Time),
                          "%d/%m/%Y %H:%M:%S")

#subset required dates
data <- subset(data, as.Date(DateTime) >= as.Date("2007-02-01") &
                 as.Date(DateTime) <= as.Date("2007-02-02")
)

# Open png device
png("plot4.png", height=480, width=480)

# Build compound plot
par(mfcol = c(2,2))

# first plot
plot(data$DateTime, data$Global_active_power, type="l", ylab="Global Active Power", xlab="")

# second plot
plot(data$DateTime, 
     data$Sub_metering_1,
     type="l", 
     ylab="Energy sub meetering", 
     xlab="")

lines(data$DateTime,
      data$Sub_metering_2,
      col = "red"
)

lines(data$DateTime,
      data$Sub_metering_3,
      col = "blue"
)

legend("topright",
       col = c("black","red","blue"),
       legend = c(
         "Sub_meetering_1",
         "Sub_meetering_2",
         "Sub_meetering_3"),
       lty = c(1,1,1),
       bty = "n"
)

# third plot
plot(data$DateTime,
     data$Voltage, 
     type="l",
     xlab="datetime",
     ylab="Voltage")

# fourth plot
plot(data$DateTime,
     data$Global_reactive_power, 
     type="l",
     xlab="datetime",
     ylab="Global_reactive_power")

# Close png file
dev.off()