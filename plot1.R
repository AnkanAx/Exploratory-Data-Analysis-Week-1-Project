##read data into R

cps<-read.table("./household_power_consumption.txt", sep=";", na.strings="?", header=TRUE)

##subset the data

library(lubridate)
cps$datum<-dmy(cps$Date)
cps2<-cps[(cps$datum=="2007-02-01" | cps$datum=="2007-02-02"),]

##create the plot

plot1<-with(cps2, hist(Global_active_power, breaks=12, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power"))

##save the plot

dev.copy(png, file = "plot1.png")
dev.off()