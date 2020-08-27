library(dplyr)

#Downloading Files
file_url <-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(file_url, "zipfile.zip")
unzip(zipfile= "zipfile.zip")
dir() #list the files on the current directory
data<-read.table("household_power_consumption.txt", header= TRUE, sep = ";", na.strings = "?")
data$Date<-as.Date(data$Date, format = "%d/%m/%Y")
#class(data$Date)
#data$Time<-strptime(data$Time, "%H:%M:%S")
data_filtered <- data %>% 
        filter(Date>="2007-02-01" & Date <= "2007-02-02")

#Save as a PNG file
png("plot1.png",  width = 480, height = 480)

#Creating the Histogram
hist(data_filtered$Global_active_power, 
     col="red", 
     xlab = "Global Active Power (kilowatts)", 
     ylab="Frequency",
     main = "Global Active Power")

dev.off()

