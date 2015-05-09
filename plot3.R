# Read data
dat <- read.csv("household_power_consumption.txt", sep=";", na.strings=c("?"))

# Coerce to date/timestamp data type
dat$Time <- strptime(paste(dat$Date, dat$Time), "%d/%m/%Y %H:%M:%S")
dat$Date <- as.Date(dat$Date, "%d/%m/%Y")

# Subset data
dat <- subset(dat, Date >= '2007-02-01' & Date <= '2007-02-02')

# Add a week day column
dat$Week_day <- strftime(dat$Date, "%a")

# Remove NA containing rows
na.omit(dat)

# Plot 3
# Export as png 
png(filename = "plot3.png", width = 480, height=480)

# Produce plot
# Base plot
with(dat, plot(Time, Sub_metering_1, ylab = "Energy sub metering", main = "", type = "l", col = "black"))

# Add line charts and legend
lines(dat$Time, dat$Sub_metering_2, col = "red")
lines(dat$Time, dat$Sub_metering_3, col = "blue")
legend("topright", col=c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1)

# Turn off device
dev.off()