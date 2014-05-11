plot1 <- function() {
  data = read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")  
  data[, 1] = as.Date(strptime(as.character(data[, 1]), "%e/%m/%Y"))
  data <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02", ]
  png("plot1.png", width = 480, height = 480)
  hist(data[, 3], main = "Global Active Power", col = "RED", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")  
  dev.off()
}