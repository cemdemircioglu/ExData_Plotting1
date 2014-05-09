
#Read the data 
mydata <- read.table("household_power_consumption.txt", header=TRUE,sep=";")

#Filter the data to  2007-02-01 and  2007-02-02 
myfiltereddata <- mydata[mydata$Date == "1/2/2007" | mydata$Date == "2/2/2007",]

#Change the data type
myfiltered <- as.numeric(as.character(myfiltereddata$Global_active_power))

#Start plotting the data
hist(myfiltered,xlab='Global Active Power (kilowatts)',main='Global Active Power',col="red")  

#Save the plot
dev.copy(png,'plot1.png')
dev.off()

  