library(tidyverse)

# Assumption is that household power consumption is in the same directory
household <- as_tibble(read.csv("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = "?"))
## And filter
household <- household %>% mutate(Date = dmy(Date)) %>% filter(Date == dmy("02-02-2007") | Date == ymd("2007-02-01"))

# Print out frequence of Global Active Power
## Set Device
png(file="plot1.png", width = 480, height = 480)
## And print
hist(household$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()