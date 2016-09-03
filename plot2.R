plot2<-function(){
  
  
  ## read the file household_power_consumption.txt
  house_data <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
  
  ## convert the data according to the assignment
  house_data$Date <- as.Date(house_data$Date, format="%d/%m/%Y")
  
  ## extract the subset corresponding to dates 2007-02-01 and 2007-02-02
  house_data_frame<-house_data[(house_data$Date=="2007-02-01") | (house_data$Date=="2007-02-02"),]
  
  ## Global_active_power is formated as numeric
  house_data_frame$Global_active_power <- as.numeric(as.character(house_data_frame$Global_active_power))
  
  ## ?????
  house_data_frame <- transform(house_data_frame, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
  
  ## Plot of type l(lines) is generated...
  plot(house_data_frame$timestamp,house_data_frame$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
  
  
  ## save the png file in the working directory
  dev.copy(png, file="plot2.png", width=480, height=480)
  
  ## and finally close the file.
  dev.off()
  
}