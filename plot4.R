consumption <- read.table("./data/household_power_consumption.txt", header = TRUE, sep = ";")
consumption[,1] <- as.Date(consumption[,1], "%d/%m/%Y")
consumption <- consumption[consumption$Date >= "2007-02-01" & consumption$Date < "2007-02-03",]
consumption[,3] <- as.numeric(consumption[,3])
consumption[,4] <- as.numeric(consumption[,4])
consumption[,5] <- as.numeric(consumption[,5])
consumption[,6] <- as.numeric(consumption[,6])
consumption[,7] <- as.numeric(consumption[,7])
consumption[,8] <- as.numeric(consumption[,8])
DateTime <- strptime(paste(consumption[,1], consumption[,2]), "%Y-%m-%d %H:%M:%S")
con <- cbind(DateTime, consumption)
par(mfrow = c(2,2))

  plot(con$DateTime, con$Global_active_power/500, pch = 0, lty = 0, lwd = 0, cex = 0, ylab = "Global Active Power (kilowatts)", xlab = "", main = "")
  with(lines(con$DateTime, con$Global_active_power/500))

  plot(con$DateTime,con$Voltage, cex = 0, ylab = "Vaoltage", main = "")
  with(lines(con$DateTime, con$Voltage))
  
  plot(con$DateTime, con$Sub_metering_1, cex = 0, ylab = "Global Active Power (kilowatts)", xlab = "", main = "")
  with(lines(con$DateTime, con$Sub_metering_1))   
  with(lines(con$DateTime, con$Sub_metering_2, col = "red"))
  with(lines(con$DateTime, con$Sub_metering_3, col = "blue")) 
  legend("topright", lty = 1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  plot(con$DateTime, con$Global_reactive_power, cex = 0, ylab = "Global Reactive Power", main = "")
  with(lines(con$DateTime, con$Global_reactive_power))

dev.copy(png, "plot4.png")
dev.off()

