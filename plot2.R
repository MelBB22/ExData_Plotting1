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

## Convert the pasted file to POSXT
y<-strptime(x, "%Y-%m-%d %H:%M:%S")

##Append new column to data
z<-cbind(EnergyData, y)

##Plot Global Active Power by Day and save to PNG
png(file="plot2.png")
par(mar=c(3, 4, 4, 2))
plot(z[,10], z[,3], col="blue", pch=20, type="n", 
     ylab="Global Active Power (kilowatts)")
lines(z[,10], z[,3], type="l", col="purple")
dev.off()



