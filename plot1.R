# Plot1 script

# Loading necessary libraries
library(zip)
library(dplyr)
library(data.table)
library(lubridate)

# Downloading data and unpacking it
url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, "./power.zip")
unzip("./power.zip")

# Reading data and subsetting it
data <- fread("./household_power_consumption.txt", na.strings = "?")[grep("^1/2/2007|^2/2/2007", Date), ]

# Making a plot and copying it to a file
hist(data$Global_active_power,
     col = "green",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.copy(png, file = "./plot1.png")
dev.off()