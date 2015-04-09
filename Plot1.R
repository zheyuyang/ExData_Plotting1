
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

# Plot 1
# Historgrm chart
hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

# Save to a PNG file with a width of 480 pixels and a height of 480 pixels
dev.copy(png, "Plot1.png", width = 480, height = 480)
dev.off()







