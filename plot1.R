plot1<-function(){
  
  ## read the file household_power_consumption.txt
  house_data <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
  
  ## convert the data according to the assignment
  house_data$Date <- as.Date(house_data$Date, format="%d/%m/%Y")
  
  ## extract the subset corresponding to dates 2007-02-01 and 2007-02-02
  house_data_frame<-house_data[(house_data$Date=="2007-02-01") | (house_data$Date=="2007-02-02"),]
  
  ## Global_active_power is formated as numeric
  house_data_frame$Global_active_power <- as.numeric(as.character(house_data_frame$Global_active_power))
  
  ## create the histogram with the title Global Active Power
  ## with Global Active Power (kilowatts) in axis
  
  hist(house_data_frame$Global_active_power, main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)")
  
  ## save the png file in the working directory
  dev.copy(png, file="plot1.png", width=480, height=480)
  
  ## and finally close the file.
  dev.off()
  
  
}