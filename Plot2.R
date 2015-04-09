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

# Plot 2
# Create datetime variable
data$datetime <- paste(data$Date, data$Time, sep = " ")
data$datetime <- strptime(data$datetime, format = "%Y-%m-%d %H:%M:%S")
class(data$datetime)

# type l for lines
plot(data$datetime, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.copy(png, "Plot2.png", width = 480, height = 480)
dev.off()
