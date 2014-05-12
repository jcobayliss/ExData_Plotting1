plot3 <- function() {
  data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
  data[, 1] <- as.Date(strptime(as.character(data[, 1]), "%e/%m/%Y"))
  data <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02", ]  
  
  y1 <- data$Sub_metering_1
  y2 <- data$Sub_metering_2
  y3 <- data$Sub_metering_3
  x <- strptime(paste(data$Date, data$Time), format="%Y-%m-%e %H:%M:%S")
  
  ## create a .png file of the plot
  png("plot3.png", width = 480, height = 480)
  plot(x, y1, type="n", xlab="", ylab="Energy sub metering")
  points(x, y1, type = "l", col = "black")
  points(x, y2, type = "l", col = "red")
  points(x, y3, type = "l", col = "blue")
  legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  dev.off()
}