## Exploratory Data Analysis - Course Project 1
## Plot 1

## Libraries:
library(sqldf)
library(lubridate)

## Download the data set:
## download.file("https://d396qusza40orc.cloudfront.net/exdata/data/household_power_consumption.zip", "household_power_consumption.zip")

## Load data into dataframe:
top = read.csv("household_power_consumption.txt", header=T, sep=";", nrows=1)
ColClass = sapply(top, class)
df = read.csv.sql(  "household_power_consumption.txt"
                  , "select * from file where Date in ('01/02/2007', '02/02/2007', '1/2/2007', '2/2/2007')"
                  , header=T, sep=";", colClasses=ColClass)

## Convert date and time variables into date and time:
df$Date = as.Date(df$Date, "%d/%m/%Y")
df$Time = strptime(df$Time, "%H:%M:%S")

## Plot 1:
hist(df$Global_active_power, col="red"
     , xlab = "Global Active Power (kilowatts)"
     , main = "Global Active Power")

## Copy to png device:
dev.copy(png, "plot1.png")
dev.off()

