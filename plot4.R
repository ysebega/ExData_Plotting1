plot4<-function(){
  
  ## read the file household_power_consumption.txt
  house_data <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
  
  ## convert the data according to the assignment
  house_data$Date <- as.Date(house_data$Date, format="%d/%m/%Y")
  
  ## extract the subset corresponding to dates 2007-02-01 and 2007-02-02
  house_data_frame<-house_data[(house_data$Date=="2007-02-01") | (house_data$Date=="2007-02-02"),]
  
  ## Global_active_power is formated as numeric
  house_data_frame$Global_active_power <- as.numeric(as.character(house_data_frame$Global_active_power))
  
  ## Global_reactive_power is formated as numeric
  house_data_frame$Global_reactive_power <- as.numeric(as.character(house_data_frame$Global_reactive_power))
  
  ## sub metering 1, 2, & 3 explicit conversion to numeric vectors
  house_data_frame$Sub_metering_1 <- as.numeric(as.character(house_data_frame$Sub_metering_1))
  house_data_frame$Sub_metering_2 <- as.numeric(as.character(house_data_frame$Sub_metering_2))
  house_data_frame$Sub_metering_3 <- as.numeric(as.character(house_data_frame$Sub_metering_3))
  
  ## Voltage variable is formated as numeric
  house_data_frame$Voltage <- as.numeric(as.character(house_data_frame$Voltage))
  
  ## format date and time to POSIXct.
  house_data_frame <- transform(house_data_frame, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
  
  ## par function is called to set graphical parameters.
  par(mfrow=c(2,2))
  
  ## Plot Globale Active Power
  plot(house_data_frame$Global_active_power, type="l", xlab="", ylab="Global Active Power")
  
  ## Plot VOltage
  plot(house_data_frame$timestamp,house_data_frame$Voltage, type="l", xlab="datetime", ylab="Voltage")
  
  ##Plot sub_metering_1-3
  plot(house_data_frame$timestamp,house_data_frame$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  lines(house_data_frame$timestamp,house_data_frame$Sub_metering_2,col="red")
  lines(house_data_frame$timestamp,house_data_frame$Sub_metering_3,col="blue")
  
  ##Plot Globale Reactive Power
  plot(house_data_frame$timestamp,house_data_frame$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
  
  ## save the png file in the working directory
  dev.copy(png, file="plot4.png", width=480, height=480)
  
  ## and finally close the file.
  dev.off()
  
}