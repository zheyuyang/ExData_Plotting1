# Data is saved under workding directory
# Read in original data 
data_raw <- read.csv("household_power_consumption.txt", header = T, sep = ';', na.strings = "?")

# Check data is read in OK
dim(data_raw)
head(data_raw)

# Convert Date column# Current DD/MM/YYYY and it is a factor class
# %Y: 4 digit year %y: 2 digit year
class(data_raw$Date)
data_raw$Date <- as.Date(data_raw$Date, format = "%d/%m/%Y")
class(data_raw$Date)

# Subset data from the dates 2007-02-01 and 2007-02-02
data <- subset(data_raw, Date >= "2007-02-01" & Date <= "2007-02-02")
dim(data) 
# 2880 * 9 matrix 

# Plot 3
# Create datetime variable
data$datetime <- paste(data$Date, data$Time, sep = " ")
data$datetime <- strptime(data$datetime, format = "%Y-%m-%d %H:%M:%S")
class(data$datetime)

plot(data$datetime, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", col = "black")
lines(data$datetime, data$Sub_metering_2, type = "l", xlab = "", col = "red")
lines(data$datetime, data$Sub_metering_3, type = "l", xlab = "", col = "blue")
# lty: 1 for solid line lwd is the width (default = 1)
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2.5, col = c("black", "red", "blue"))

dev.copy(png, "Plot3.png", width = 480, height = 480)
dev.off()
