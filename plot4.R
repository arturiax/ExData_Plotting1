## Coursera EXploratory Data Analysis
## Week 1 Assignment
## Import household power consumption data and create 4 plots
## Plot 4

#Data is in the working directory
#Load libraries
library(sqldf)
library(lubridate) # to manipulate dates


Sys.setlocale("LC_TIME", "C") # For use english language for dates and not spanish

# I am going to use sqldf:read.csv.sql to read the data, only for the 2 needed days

df <- read.csv.sql("household_power_consumption.txt", 
                   sql = "SELECT * FROM file WHERE Date in ('1/2/2007','2/2/2007')", 
                   header = TRUE, sep = ";")


#convert the Date and Time variables to one DateTime variable
df$Date_time<-dmy_hms(paste(df$Date, df$Time))

#Open device
png("plot4.png", height=480, width=480, bg= 'transparent')

#Graph

par(mfrow = c(2 ,2))

#subplot1
plot(df$Date_time, df$Global_active_power, "l", xlab = "", ylab = "Global Active Power (kilowatts)")

#subplot2
plot(df$Date_time, df$Voltage, "l", xlab = "datetime", ylab = "Voltage")


#subplot3
plot(df$Date_time, df$Sub_metering_1,"l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(df$Date_time, df$Sub_metering_2, col = "red")
lines(df$Date_time, df$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lwd = 1)

#subplot4
plot(df$Date_time, df$Global_reactive_power, "l", xlab = "datetime", ylab = "Global_reactive_power")


dev.off()   #Close device



