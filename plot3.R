#Load the data
hpc <- read.table("household_power_consumption.txt",header = TRUE,sep = ";")

# Filter the data
hpc$Date <- dmy(hpc$Date)
feb_data <- hpc %>% filter(Date == "2007-02-01" | Date == "2007-02-02")

# Convert Factor to Numeric
feb_data$Sub_metering_1 <- as.numeric(as.character(feb_data$Sub_metering_1))
feb_data$Sub_metering_2 <- as.numeric(as.character(feb_data$Sub_metering_2))
feb_data$Sub_metering_3 <- as.numeric(as.character(feb_data$Sub_metering_3))

# Combine Date and Time
feb_data$DateTime <- with(feb_data, ymd(Date)+hms(Time))

# Plot 3
par(mfrow = c(1,1))
plot(feb_data$DateTime,feb_data$Sub_metering_1, type = "l",xlab = "",ylab = "Energy sub metering")
lines(feb_data$DateTime,feb_data$Sub_metering_2, type = "l",col = "red")
lines(feb_data$DateTime,feb_data$Sub_metering_3, type = "l",col = "blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"),lty = 1)
dev.copy(png,"plot3.png",width = 480, height = 480)
dev.off()
