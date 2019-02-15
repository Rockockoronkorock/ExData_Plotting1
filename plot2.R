library(tidyverse)

# Assumption is that household power consumption is in the same directory
household <- as_tibble(read.csv("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = "?"))
## And filter
household <- household %>% mutate(Date = dmy(Date)) %>% filter(Date == dmy("02-02-2007") | Date == ymd("2007-02-01")) %>% mutate(TS = as.POSIXct(Date + hms(Time))) %>% arrange(TS)

# Print out frequence of Global Active Power
## Set Device
png(file="plot2.png", width = 480, height = 480)
## And print
plot(household$TS, household$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()