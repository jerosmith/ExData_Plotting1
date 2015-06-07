## Exploratory Data Analysis - Course Project 1
## Plot 3

## Libraries:
library(sqldf)

## Download the data set:
## download.file("https://d396qusza40orc.cloudfront.net/exdata/data/household_power_consumption.zip", "household_power_consumption.zip")

## Load data into data frame:
top = read.csv("household_power_consumption.txt", header=T, sep=";", nrows=1)
ColClass = sapply(top, class)
df = read.csv.sql(  "household_power_consumption.txt"
                  , "select * from file where Date in ('01/02/2007', '02/02/2007', '1/2/2007', '2/2/2007')"
                  , header=T, sep=";", colClasses=ColClass)

## Convert date and time variables into one Date-Time variable:
df$DateTime = paste(df$Date, df$Time)
df$DateTime = strptime(df$DateTime, "%d/%m/%Y %H:%M:%S")

## Plot 4:
png("plot4.png")
par(mfrow=c(2,2))

## Graph 1:
with(df, plot(DateTime, Global_active_power
              , type="n"
              , ylab = "Global Active Power (kilowatts)"
              , xlab = ""))
with(df, lines(DateTime, Global_active_power))

## Graph 2:
with(df, plot(DateTime, Voltage
              , type="n"
              , ylab = "Voltage"
              , xlab = ""))
with(df, lines(DateTime, Voltage))

## Graph 3:
with(df, plot(DateTime, Sub_metering_1
     , type="n"
     , ylab = "Energy sub metering"
     , xlab = ""))
with(df, lines(DateTime, Sub_metering_1, col="grey"))
with(df, lines(DateTime, Sub_metering_2, col="red"))
with(df, lines(DateTime, Sub_metering_3, col="blue"))
legendch = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
legend("topright", pch="---", lwd=2, col=c("grey", "red", "blue"), legend=legendch)

## Graph 4:
with(df, plot(DateTime, Global_reactive_power
              , type="n"
              , xlab = ""))
with(df, lines(DateTime, Global_reactive_power))

## Close device:
dev.off()
