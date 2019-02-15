library(tidyverse)

# Assumption is that household power consumption is in the same directory
household <- as_tibble(read.csv("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = "?"))
## And filter
household <- household %>% mutate(Date = dmy(Date)) %>% filter(Date == dmy("02-02-2007") | Date == ymd("2007-02-01")) %>% mutate(TS = as.POSIXct(Date + hms(Time))) %>% arrange(TS)

# Print out frequence of Global Active Power
## Set Device
png(file="plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
## And print
with(household, {
  plot(household$TS, household$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
  plot(household$TS, household$Voltage, type = "l", xlab = "", ylab = "Voltage")
  plot(TS, Sub_metering_1, type = "l", xlab = "", ylab = "Energy Sub Metering")
  with(household, points(TS,Sub_metering_1, col = "black", type = "l"))
  with(household, points(TS,Sub_metering_2, col = "red", type = "l"))
  with(household, points(TS,Sub_metering_3, col = "blue", type = "l"))
  legend("topright", pch = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(household$TS, household$Global_reactive_power, type = "l", xlab = "", ylab = "Global Reactive Power")
})
dev.off()
