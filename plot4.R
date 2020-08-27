library(dplyr)

#Downloading Files
file_url <-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(file_url, "zipfile.zip")
unzip(zipfile= "zipfile.zip")
dir() #list the files on the current directory
data<-read.table("household_power_consumption.txt", header= TRUE, sep = ";", na.strings = "?")

#class(data$Date)
data$DateTime<-as.POSIXct(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")
data$Date<-as.Date(data$Date, format = "%d/%m/%Y")
data_filtered <- data %>% 
        filter(Date>="2007-02-01" & Date <= "2007-02-02")

#Save as a PNG file
png("plot4.png",  width = 480, height = 480)

par(mfrow=c(2,2))

#Plot 1
plot(data_filtered$DateTime,
     data_filtered$Global_active_power,
     type="l",
     ylab = "Global Active Power (kilowatts)",
     xlab="")
#Plot 2
plot(data_filtered$DateTime,
     data_filtered$Voltage,
     type="l",
     ylab = "Voltage",
     xlab="datetime")

#PLot 3
plot(data_filtered$DateTime,
     data_filtered$Sub_metering_1,
     type="l",
     ylab = "Energy sub metering",
     xlab="")
lines(data_filtered$DateTime, data_filtered$Sub_metering_2, col="red")
lines(data_filtered$DateTime, data_filtered$Sub_metering_3, col="blue")
legend("topright", 
       lty =1, 
       col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Plot 4
plot(data_filtered$DateTime,
     data_filtered$Global_reactive_power,
     type="l",
     ylab = "Global_reactive_power",
     xlab="datetime")


dev.off()


