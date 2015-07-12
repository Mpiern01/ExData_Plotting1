## Download the main dataset from <b>Dataset</b>: <a href="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip">Electric power consumption</a> [20Mb]
## Unzip, save it, then run the script. It was too large to commit to Github. Sorry ;(

epc <- read.table("household_power_consumption.txt",header=T,sep=";",colClasses=c("character","character","double","double","double","double","double","double","numeric"),na.strings="?")
epc$DateTime = paste(epc$Date, epc$Time)
epc$DateTime = as.POSIXlt(epc$DateTime,format="%d/%m/%Y %H:%M:%S")
epc$Date = NULL
epc$Time = NULL

subepc <- subset(epc,DateTime$year==107 & DateTime$mon==1 & (DateTime$mday==1 | DateTime$mday==2))

png("PNG/plot2.png")
plot(x=(subepc$DateTime),y=subepc$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()
