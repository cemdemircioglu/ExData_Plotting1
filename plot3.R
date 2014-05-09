
#Read the data 
mydata <- read.table("household_power_consumption.txt", header=TRUE,sep=";")

#Filter the data to  2007-02-01 and  2007-02-02 
myfiltereddata <- mydata[mydata$Date == "1/2/2007" | mydata$Date == "2/2/2007",]

#Change the data type
myfiltereddata$Sub1 <- as.numeric(as.character(myfiltereddata$Sub_metering_1))
myfiltereddata$Sub2 <- as.numeric(as.character(myfiltereddata$Sub_metering_2))
myfiltereddata$Sub3 <- as.numeric(as.character(myfiltereddata$Sub_metering_3))

#XY columns only
myfdata <- myfiltereddata[,c(1,2,10,11,12)]

#Create the data time column
myfdata$mydatetime <- strptime(paste(myfdata[,1], myfdata[,2], sep=" "), format="%d/%m/%Y %H:%M")

#Create the plot
plot(myfdata$mydatetime,myfdata$Sub1,type="l",ylab='Global Active Power (kilowatts)',xlab='',col="black",ylim=c(0,40))
par(new=TRUE)
plot(myfdata$mydatetime,myfdata$Sub2,type="l",ylab='',xlab='',col="red",ylim=c(0,40))
par(new=TRUE)
plot(myfdata$mydatetime,myfdata$Sub3,type="l",ylab='',xlab='',col="blue",ylim=c(0,40))
par(new=FALSE)

#Create the legend
legend('topright', c("Sub_metering_1        ","Sub_metering_2        ","Sub_metering_3        "), col=c("black","red","blue"), lty=1, cex=0.7)

#Save the plot
dev.copy(png,'plot3.png',width = 480, height = 480)
dev.off()
