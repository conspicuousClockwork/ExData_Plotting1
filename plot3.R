download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "./data.zip")
unzip("data.zip", overwrite = TRUE)
data <- subset(read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?"), Date == "1/2/2007" | Date == "2/2/2007")
png('plot3.png')

thursday <- subset(data, Date == "1/2/2007")
friday <- subset(data, Date == "2/2/2007")

days <- c("Thursday", "Friday", "Saturday")

ticks <- c(0, nrow(thursday), nrow(thursday) + nrow(friday))

plot(data$Sub_metering_1, type = "l", xaxt = "n", ylab = "Energy sub metering", xlab = "")
points(data$Sub_metering_2, type = "l", col = "red")
points(data$Sub_metering_3, type = "l", col = "blue")

legend <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
col <- c("black", "red", "blue")

legend("topright", legend = legend, col = col, lty = 1)

axis(side = 1, labels = days, at = ticks)

dev.off()

