## Coursera EXploratory Data Analysis
## Week 1 Assignment
## Import household power consumption data and create 4 plots
## Plot 1

#Data is in the working directory
#Load libraries
library(sqldf)

# I am going to use sqldf:read.csv.sql to read the data, only for the 2 needed days

df <- read.csv.sql("household_power_consumption.txt", 
                   sql = "SELECT * FROM file WHERE Date in ('1/2/2007','2/2/2007')", 
                   header = TRUE, sep = ";")


#Open device
png("plot1.png", height=480, width=480, bg= 'transparent')

#Histogram
hist(df$Global_active_power,
     col = "red", 
     xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power")


dev.off()   #Close device