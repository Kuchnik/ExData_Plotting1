#Load the data
hpc <- read.table("household_power_consumption.txt",header = TRUE,sep = ";")

# Filter the data
hpc$Date <- dmy(hpc$Date)
feb_data <- hpc %>% filter(Date == "2007-02-01" | Date == "2007-02-02")

# Convert Factor to Numeric
feb_data$Global_active_power <- as.numeric(as.character(feb_data$Global_active_power))

# Combine Date and Time
feb_data$DateTime <- with(feb_data, ymd(Date)+hms(Time))

# Plot 2
par(mfrow = c(1,1))
plot(feb_data$DateTime,feb_data$Global_active_power, type = "l", xlab = "",ylab = "Global Active Power (kilowatts)")

# Save to file
dev.copy(png,"plot2.png", width = 480, height = 480)
dev.off()
