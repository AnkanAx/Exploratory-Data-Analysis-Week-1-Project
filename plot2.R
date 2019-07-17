##read data into R

cps<-read.table("./household_power_consumption.txt", sep=";", na.strings="?", header=TRUE)

##subset the dataset to 20070201-20070202

library(lubridate)
datum<-dmy(cps$Date)
cps2<-cps[(datum=="2007-02-01" | datum=="2007-02-02"),]

##create single variable for date and time

tid<-hms(cps2$Time)
cps2$tidpunkt<-ymd_hms(interaction(cps2$datum,cps2$Time))

##make the plot

plot2<-with(cps2, plot(tidpunkt, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))

##save the plot

dev.copy(png, file = "plot2.png")
dev.off()