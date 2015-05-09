# Read data
dat <- read.csv("household_power_consumption.txt", sep=";", na.strings=c("?"))

# Coerce to date/timestamp data type
dat$Time <- strptime(paste(dat$Date, dat$Time), "%d/%m/%Y %H:%M:%S")
dat$Date <- as.Date(dat$Date, "%d/%m/%Y")

# Subset data
dat <- subset(dat, Date >= '2007-02-01' & Date <= '2007-02-02')

# Remove NA containing rows
na.omit(dat)

# Plot 4
# Export as png 
png(filename = "plot4.png", width = 480, height=480)

par(mfrow = c(2, 2))

# Top left plot
plot(dat$Time, dat$Global_active_power, ylab = "Global Active Power", xlab = "", type = "l")

# Top right plot
plot(dat$Time, dat$Voltage, ylab = "Voltage", xlab = "datetime", type = "l")


# Bottom left plot
with(dat, plot(Time, Sub_metering_1, ylab = "Energy sub metering", main = "", type = "l", col = "black"))
# Add line charts and legend
lines(dat$Time, dat$Sub_metering_2, col = "red")
lines(dat$Time, dat$Sub_metering_3, col = "blue")
legend("topright", col=c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), box.lwd=0, lty=1, bty = "n")

# Bottom right plot
plot(dat$Time, dat$Global_reactive_power, ylab = "Global_reactive_power", xlab = "datetime", type = "l")

# Turn off device
dev.off()