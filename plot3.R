plot3 <- function() {
  ## read the file household_power_consumption.txt
  house_data <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
  
  ## convert the data according to the assignment
  house_data$Date <- as.Date(house_data$Date, format="%d/%m/%Y")
  
  ## extract the subset corresponding to dates 2007-02-01 and 2007-02-02
  house_data_frame<-house_data[(house_data$Date=="2007-02-01") | (house_data$Date=="2007-02-02"),]
  
  ##sub metering 1, 2, & 3 explicit conversion to numeric vectors
  house_data_frame$Sub_metering_1 <- as.numeric(as.character(house_data_frame$Sub_metering_1))
  house_data_frame$Sub_metering_2 <- as.numeric(as.character(house_data_frame$Sub_metering_2))
  house_data_frame$Sub_metering_3 <- as.numeric(as.character(house_data_frame$Sub_metering_3))
  
  ##format date and time to POSIXct.
  house_data_frame <- transform(house_data_frame, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
  
  ##generate the plot with sub_metering_1-3
  plot(house_data_frame$timestamp,house_data_frame$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  lines(house_data_frame$timestamp,house_data_frame$Sub_metering_2,col="red")
  lines(house_data_frame$timestamp,house_data_frame$Sub_metering_3,col="blue")
  
  ## put a legend topright.
  legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))
  
  ## save the png file in the working directory
  dev.copy(png, file="plot3.png", width=480, height=480)
  
  ## and finally close the file.
  dev.off()
  
}