# Read data
dat <- read.csv("household_power_consumption.txt", sep=";", na.strings=c("?"))

# Coerce to date/timestamp data type
dat$Time <- strptime(paste(dat$Date, dat$Time), "%d/%m/%Y %H:%M:%S")
dat$Date <- as.Date(dat$Date, "%d/%m/%Y")

# Subset data
dat <- subset(dat, Date >= '2007-02-01' & Date <= '2007-02-02')

# Remove NA containing rows
na.omit(dat)

# Plot 1
# Export as png 
png(filename = "plot1.png", width = 480, height=480)
# Produce plot
hist(dat$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")
# Turn off device
dev.off()
