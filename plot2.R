plot2 <- function() {
  data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
  data[, 1] <- as.Date(strptime(as.character(data[, 1]), "%e/%m/%Y"))
  data <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02", ]  
  png(file = "plot2.png", width = 480, height = 480)
  plot(strptime(paste(data$Date, data$Time), format="%Y-%m-%e %H:%M:%S"), data[, 3], type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")  
  dev.off()
}