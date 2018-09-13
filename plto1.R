#Load the data
hpc <- read.table("household_power_consumption.txt",header = TRUE,sep = ";")

# Filter the data
hpc$Date <- dmy(hpc$Date)
feb_data <- hpc %>% filter(Date == "2007-02-01" | Date == "2007-02-02")

# Convert Factor to Numeric
feb_data$Global_active_power <- as.numeric(as.character(feb_data$Global_active_power))

# plot 1
par(mfrow = c(1,1))
hist(feb_data$Global_active_power,xlab = "Global Active Power (kilowatts)",main = "",col = "red")
title(main = "Global Active Power")
dev.copy(png,"plot1.png",width = 480, height = 480)
dev.off()
