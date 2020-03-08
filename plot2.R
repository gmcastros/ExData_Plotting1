#File with data
file_nm <- "household_power_consumption.txt"

# Add the separator because is ';' not comma.
file_data <- read.table(file_nm, header=TRUE, sep=";", na.strings = "?")

#We only need the data on Feb 1 and 2, 2007
feb_data <- file_data[file_data$Date %in% c("1/2/2007","2/2/2007") ,]

#Plot2
#We need to get the date in the right format (mentioned in the instructions)
feb_data$Date <- as.Date(feb_data$Date, format="%d/%m/%Y")

#Time is in another column
date_time <- paste(as.Date(feb_data$Date), feb_data$Time)

#create another column with the date time
feb_data$Datetime <- as.POSIXct(date_time)

png("plot2.png", width=480, height=480)
with(feb_data, plot(Global_active_power~Datetime, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()