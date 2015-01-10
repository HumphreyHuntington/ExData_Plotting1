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

png ('plot1.png', width = 480, height=480)
hist (data_power3$Global_active_power, col="red", xlab ="Global Active Power (kilowatts)", 
      main = "Global Active Power")
dev.off()

