#File with data
file_nm <- "household_power_consumption.txt"

# Add the separator because is ';' not comma.
file_data <- read.table(file_nm, header=TRUE, sep=";")

#We only need the data on Feb 1 and 2, 2007
feb_data <- file_data[file_data$Date %in% c("1/2/2007","2/2/2007") ,]

#Plot1
# We need Global Active power (kilowatts)
global_active_power <- feb_data$Global_active_power

#there are ? values, change the data type
global_active_power_numeric <- as.numeric(global_active_power)
#par(mfrow=c(1,1))

# Set the output size
png("plot1.png", width=480, height = 480)

#Draw the histogram
hist(global_active_power_numeric, col="red", main="Global Active Power", xlab = "Global Active Power (kilowatts)")

#Close
dev.off()
