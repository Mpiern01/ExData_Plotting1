## Download the main dataset from <b>Dataset</b>: <a href="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip">Electric power consumption</a> [20Mb]
## Unzip, save it, then run the script. It was too large to commit to Github. Sorry ;(
## (attempted to load data file for you)
##Plot4
epc <- read.table("household_power_consumption.txt",header=T,sep=";",colClasses=c("character","character","double","double","double","double","double","double","numeric"),na.strings="?")
epc$DateTime = paste(epc$Date, epc$Time)
epc$DateTime = as.POSIXlt(epc$DateTime,format="%d/%m/%Y %H:%M:%S")
epc$Date = NULL
epc$Time = NULL

subepc <- subset(epc,DateTime$year==107 & DateTime$mon==1 & (DateTime$mday==1 | DateTime$mday==2))

env <- par()


png("PNG/plot4.png")
par(mfrow=c(2,2))

##4.1
plot(x=(subepc$DateTime),y=subepc$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")

##4.2
plot(x=(subepc$DateTime),y=subepc$Voltage,type="l",ylab="Voltage",xlab="datetime")

##4.3
plot(x=(subepc$DateTime),y=subepc$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(x=(subepc$DateTime),y=subepc$Sub_metering_2,col="red")
lines(x=(subepc$DateTime),y=subepc$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="l",col=c("black","red","blue"),lwd=2,cex=0.4)

##4.4
plot(subepc$DateTime, subepc$Global_reactive_power, type = "l", main = "", xlab = "datetime")

par(env)
dev.off()

