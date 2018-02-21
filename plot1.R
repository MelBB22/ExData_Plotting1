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

## Create histogram of Global Active Power in png file
png(file="plot1.png")
hist(EnergyData[,3], col="blue", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()

