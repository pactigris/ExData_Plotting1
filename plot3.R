# read data
file <- "household_power_consumption.txt"
data <- read.table(file, sep = ";", na.strings = "?", header = TRUE, 
                   skip = 66636, nrows = 2880)
names(data) <- strsplit(readLines(file, n = 1), split = ";")[[1]]
datetime <- strptime(paste(data$Date, data$Time), 
                     format = "%d/%m/%Y %H:%M:%S")

# plot
png("plot3.png")
plot(datetime, data$Sub_metering_1, type = "line", main = "", 
     xlab = "", ylab = "Energy sub metering")
lines(datetime, data$Sub_metering_2, col = "red")
lines(datetime, data$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()