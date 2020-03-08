#File with data
file_nm <- "household_power_consumption.txt"

# Add the separator because is ';' not comma.
file_data <- read.table(file_nm, header=TRUE, sep=";", na.strings = "?")

#We only need the data on Feb 1 and 2, 2007
feb_data <- file_data[file_data$Date %in% c("1/2/2007","2/2/2007") ,]

#Plot3
#We need to get the date in the right format (mentioned in the instructions)
feb_data$Date <- as.Date(feb_data$Date, format="%d/%m/%Y")

#Time is in another column
date_time <- paste(as.Date(feb_data$Date), feb_data$Time)

#create another column with the date time
feb_data$Datetime <- as.POSIXct(date_time)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 
with(feb_data, plot(Global_active_power~Datetime, type="l", xlab="", ylab="Global Active Power"))
with(feb_data, plot(Voltage~Datetime, type="l", xlab="Datetime", ylab="Voltage"))


with(feb_data, plot(Sub_metering_1~Datetime, type="l", xlab="", ylab="Energy Submetering"))
with(feb_data, lines(Sub_metering_2~Datetime, type="l", col="red"))
with(feb_data, lines(Sub_metering_3~Datetime, type="l", col="blue"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))
with(feb_data, plot(Global_reactive_power~Datetime, type="l", xlab="Datetime", ylab="global_reactive_power"))
dev.off()