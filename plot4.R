
#Read the data 
mydata <- read.table("household_power_consumption.txt", header=TRUE,sep=";")

#Filter the data to  2007-02-01 and  2007-02-02 
myfiltereddata <- mydata[mydata$Date == "1/2/2007" | mydata$Date == "2/2/2007",]

#Change the data type
myfiltereddata$Sub1 <- as.numeric(as.character(myfiltereddata$Sub_metering_1))
myfiltereddata$Sub2 <- as.numeric(as.character(myfiltereddata$Sub_metering_2))
myfiltereddata$Sub3 <- as.numeric(as.character(myfiltereddata$Sub_metering_3))
myfiltereddata$GAP  <- as.numeric(as.character(myfiltereddata$Global_active_power))
myfiltereddata$GRP  <- as.numeric(as.character(myfiltereddata$Global_reactive_power))
myfiltereddata$VLT <- as.numeric(as.character(myfiltereddata$Voltage))

#Create the data time column
myfiltereddata$mydatetime <- strptime(paste(myfiltereddata[,1], myfiltereddata[,2], sep=" "), format="%d/%m/%Y %H:%M")

#XY columns only
myfdata <- myfiltereddata[,c(5,10,11,12,13,14,15,16)]

#split the screen
par(mfrow=c(2,2))

#Create the plot 1
plot(myfdata$mydatetime,myfdata$GAP,type="l",ylab='Global Active Power (kilowatts)',xlab='')

#Create the plot 2
plot(myfdata$mydatetime,myfdata$VLT,type="l",ylab='Voltage',xlab='datetime')

#Create the plot 3
plot(myfdata$mydatetime,myfdata$Sub1,type="l",ylab='Global Active Power (kilowatts)',xlab='',col="black",ylim=c(0,40))
par(new=TRUE)
plot(myfdata$mydatetime,myfdata$Sub2,type="l",ylab='',xlab='',col="red",ylim=c(0,40))
par(new=TRUE)
plot(myfdata$mydatetime,myfdata$Sub3,type="l",ylab='',xlab='',col="blue",ylim=c(0,40))
par(new=FALSE)

#Create the legend
legend('topright', c("Sub_metering_1        ","Sub_metering_2        ","Sub_metering_3        "), col=c("black","red","blue"), lty=1, cex=0.7)

#Create the plot 4
plot(myfdata$mydatetime,myfdata$GRP,type="l",ylab='Global Reactive Power (kilowatts)',xlab='datetime')

#Save the plot
dev.copy(png,'plot4.png',width = 480, height = 480)
dev.off()


