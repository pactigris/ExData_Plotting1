# read data
file <- "household_power_consumption.txt"
data <- read.table(file, sep = ";", na.strings = "?", header = TRUE, 
                   skip = 66636, nrows = 2880)
names(data) <- strsplit(readLines(file, n = 1), split = ";")[[1]]
datetime <- strptime(paste(data$Date, data$Time), 
                     format = "%d/%m/%Y %H:%M:%S")

# plot
png("plot2.png")
plot(datetime, data$Global_active_power, type = "line", main = "", 
     xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()