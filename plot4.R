# Plot4 script

# Loading necessary libraries
library(zip)
library(dplyr)
library(data.table)
library(lubridate)

# Downloading data and unpacking it
url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, "./power.zip")
unzip("./power.zip")

# Reading data and subsetting it. Also adding a new column with pasted dates and times
data <- fread("./household_power_consumption.txt", na.strings = "?")[grep("^1/2/2007|^2/2/2007", Date), ]
data$Date_Time <- dmy_hms(paste(data$Date, data$Time))

# Making plots straight to a file
png("./plot4.png")
par(mfrow = c(2,2))
plot(data$Sub_metering_1 ~ data$Date_Time,
     type = "l",
     xlab = "datetime",
     ylab = "Energy sub metering")
lines(data$Sub_metering_2 ~ data$Date_Time,
      type = "l",
      col = "red")
lines(data$Sub_metering_3 ~ data$Date_Time,
      type = "l",
      col = "blue")
legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lwd = c(2,2,2),
       bty = "n")

plot(data$Voltage ~ data$Date_Time,
     type = "l",
     xlab = "datetime",
     ylab = "Voltage")

plot(data$Global_active_power ~ data$Date_Time,
     type = "l",
     xlab = "datetime",
     ylab = "Global Active Power (kilowatts)")

plot(data$Global_reactive_power ~ data$Date_Time,
     type = "l",
     xlab = "datetime",
     ylab = "Global Reactive Power")
dev.off()