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

plot3<-with(cps2, plot(tidpunkt, Sub_metering_1, type="n", xlab="", ylab="Energy sub metering"))
sub1<-lines(cps2$tidpunkt, cps2$Sub_metering_1, type="l")
sub2<-lines(cps2$tidpunkt, cps2$Sub_metering_2, type="l", col="red")
sub3<-lines(cps2$tidpunkt, cps2$Sub_metering_3, type="l", col="blue")
legend("topright",lty = 1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

##save the plot

dev.copy(png, file = "plot3.png")
dev.off()