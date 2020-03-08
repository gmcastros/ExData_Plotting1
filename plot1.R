#File with data
file_nm <- "household_power_consumption.txt"
file_data <- read.table(file_nm, header=TRUE, sep=";")

#We only need the data on Feb 1 and 2, 2007
feb_datfeb_data <- file_data[file_data$Date %in% c("1/2/2007","2/2/2007") ,]a -< file_data[file_data$Date %in% c("1/2/2007","2/2/2007") ,]
