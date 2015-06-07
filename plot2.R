## Exploratory Data Analysis - Course Project 1
## Plot 2

## Libraries:
library(sqldf)

## Download the data set:
## download.file("https://d396qusza40orc.cloudfront.net/exdata/data/household_power_consumption.zip", "household_power_consumption.zip")

## Load data into dataframe:
top = read.csv("household_power_consumption.txt", header=T, sep=";", nrows=1)
ColClass = sapply(top, class)
df = read.csv.sql(  "household_power_consumption.txt"
                  , "select Global_active_power, Date, Time from file where Date in ('01/02/2007', '02/02/2007', '1/2/2007', '2/2/2007')"
                  , header=T, sep=";", colClasses=ColClass)

## Convert date and time variables into one Date-Time variable:
df$DateTime = paste(df$Date, df$Time)
df$DateTime = strptime(df$DateTime, "%d/%m/%Y %H:%M:%S")

## Plot 2:
with(df, plot(DateTime, Global_active_power
     , type="n"
     , ylab = "Global Active Power (kilowatts)"
     , xlab = ""))
with(df, lines(DateTime, Global_active_power))

## Copy to png device:
dev.copy(png, "plot2.png")
dev.off()

