# Plot2 script

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

# Making a plot and copying it to a file
plot(data$Global_active_power ~ data$Date_Time,
     type = "l",
     main = "Global Active Power",
     xlab = "datetime",
     ylab = "Global Active Power (kilowatts)")
dev.copy(png, file = "./plot2.png")
dev.off()