### Plot 1

# Reading in the Data
data_power <- read.table ("./data/household_power_consumption.txt", sep = ";" , 
                          na.strings ="?" , header=TRUE)


# Transforming the Data
data_power2 <- data_power
data_power2$Date2 <- as.Date (data_power2$Date, "%d/%m/%Y")

data_power3 <- data_power2[(data_power2$Date2 >="2007-02-01" & data_power2$Date2 <"2007-02-03"), ]

data_power3$datetime <- as.POSIXct(paste(data_power3$Date, data_power3$Time), format="%d/%m/%Y %H:%M:%S") 


# Data Exploration; 

png('plot4.png', width = 480, height=480)
par (mfrow = c(2,2))
with (data_power3,{
  plot ( datetime , Global_active_power, type="l" ,
         xlab="" , ylab = "Global Active Power (kilowatts)")
  
  plot(datetime, Voltage, type="l")
  
  with (data_power3, plot(datetime, Sub_metering_1, type="n", xlab="", ylab= "Energy sub metering"))
  with (data_power3, points (datetime, Sub_metering_1, col="black", type="l"))
  with (data_power3, points (datetime, Sub_metering_2, col="red", type="l"))
  with (data_power3, points (datetime, Sub_metering_3, col="blue", type="l"))
  legend("topright",  lty = c(1,1,1), col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  plot(datetime, Global_reactive_power, type="l")
  
})
dev.off()

