
#Read the data 
mydata <- read.table("household_power_consumption.txt", header=TRUE,sep=";")

#Filter the data to  2007-02-01 and  2007-02-02 
myfiltereddata <- mydata[mydata$Date == "1/2/2007" | mydata$Date == "2/2/2007",]

#Change the data type
myfiltereddata$myfiltered <- as.numeric(as.character(myfiltereddata$Global_active_power))

#XY columns only
myfdata <- myfiltereddata[,c(1,2,10)]

#Create the data time column
myfdata$mydatetime <- strptime(paste(myfdata[,1], myfdata[,2], sep=" "), format="%d/%m/%Y %H:%M")

#Create the plot
plot(myfdata$mydatetime,myfdata$myfiltered,type="l",ylab='Global Active Power (kilowatts)',xlab='')

#Save the plot
dev.copy(png,'plot2.png')
dev.off()
