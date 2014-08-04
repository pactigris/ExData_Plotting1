# read data
file <- "household_power_consumption.txt"
data <- read.table(file, sep = ";", na.strings = "?", header = TRUE, 
                   skip = 66636, nrows = 2880)
names(data) <- strsplit(readLines(file, n = 1), split = ";")[[1]]

# plot
png("plot1.png")
hist(data$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency", 
     col = "red")
dev.off()