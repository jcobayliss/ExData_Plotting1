plot4 <- function() {
  data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
  data[, 1] <- as.Date(strptime(as.character(data[, 1]), "%e/%m/%Y"))
  data <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02", ]
  
  png("plot4.png", width = 480, height = 480, units = "px")
  par(mfrow = c(2,2))
    
  y1 <- data$Global_active_power
  x <- strptime(paste(data$Date, data$Time), format="%Y-%m-%e %H:%M:%S")
  plot(x, y1, xlab = "", ylab = "Global Active Power", type = "l")
    
  y2 <- data$Voltage
  x <- strptime(paste(data$Date, data$Time), format="%Y-%m-%e %H:%M:%S")
  plot(x, y2, xlab = "datetime", ylab = "Voltage", type = "l")
    
  y3a <- data$Sub_metering_1
  y3b <- data$Sub_metering_2
  y3c <- data$Sub_metering_3
  x <- strptime(paste(data$Date, data$Time), format="%Y-%m-%e %H:%M:%S")
  plot(x, y3a, type = "n", xlab = "", ylab = "Energy sub metering")
  points(x, y3a, type = "l", col = "black")
  points(x, y3b, type = "l", col = "red")
  points(x, y3c, type = "l", col = "blue")
  legend("topright", lty = 1, bty = "n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
  y4 <- data$Global_reactive_power
  x <- strptime(paste(data$Date, data$Time), format="%Y-%m-%e %H:%M:%S")
  plot(x, y4, xlab = "datetime", ylab = "Global reactive power", type = "l")
  
  dev.off()
}