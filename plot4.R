##Download data
datasetUrl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(datasetUrl, "EnergyPlot.zip")
unzip("EnergyPlot.zip", exdir = "EnergyPlot")

##Change working directory
setwd("EnergyPlot")

##Read data into R, subsetting to only dates we need
EnergyData<-read.table("household_power_consumption.txt", 
                       skip = 66637, nrows = 2879, sep=";", header=F)

##Convert Date varaiable to Date class
EnergyData[,1]<-as.Date(EnergyData[,1], "%d/%m/%Y")

##Paste data and time columns together
x<-paste(EnergyData[,1], EnergyData[,2])

## COnvert the pasted file to POSXT
y<-strptime(x, "%Y-%m-%d %H:%M:%S")

##Append new column to data
z<-cbind(EnergyData, y)

##Create 4 graphs on one plot
png(file="plot4.png")
par(mfrow=c(2,2), mar=c(2,4,1,1), oma=c(0,0,1,0))
plot(z[,10], z[,3], col="blue", pch=20, type="n", 
     ylab="Global Active Power (kilowatts)")
lines(z[,10], z[,3], type="l", col="purple")
plot(z[,10], z[,5], col="brown", pch=20, type="n", 
     xlab="datetime", ylab="Voltage")
lines(z[,10], z[,5], type="l", col="brown")
plot(z[,10], z[,3], col="blue", pch=20, type="n", 
     ylab="Energy Sub Metering", ylim=c(0,40))
lines(z[,10], z[,7], type="l", col="purple")
lines(z[,10], z[,8], type="l", col="red")
lines(z[,10], z[,9], type="l", col="green")
legend("topright", bty="n",lty=c(1,1), col=c("purple", "red", "green"), 
       legend=c("sub_metering_1", "sub_metering_2", "sub_metering_3"))
plot(z[,10], z[,4], col="orange", pch=20, type="n",
     ylab="Global_reactive_power", xlab="datetime")
lines(z[,10],z[,4], type="l", col="orange")
dev.off()


