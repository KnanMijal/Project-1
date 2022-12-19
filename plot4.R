#Read data file
file <- "household_power_consumption.txt"
data <- read.table(file, sep=";",header = T, stringsAsFactors = F,dec="." )
#Selected dates
dates <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
#Plot + save
x <- paste(dates$Date,dates$Time,sep=" ")
datetime <- strptime(x,"%d/%m/%Y %H:%M:%S")
#1
AP <- as.numeric(dates$Global_active_power)
#2
voltage <- as.numeric(dates$Voltage)
#3
Sub_metering_1 <- as.numeric(dates$Sub_metering_1)
Sub_metering_2 <- as.numeric(dates$Sub_metering_2)
Sub_metering_3 <- as.numeric(dates$Sub_metering_3)
#4
RP <- as.numeric(dates$Global_reactive_power)

png("plot4.png",width=500,height=500)
par(mfrow=c(2,2))
#1
plot(datetime,AP,type="l",ylab="Global Active Power",xlab="")
#2
plot(datetime,voltage,type="l",ylab="voltage",xlab="datetime")
#3
plot(datetime,Sub_metering_1,type="l",ylab="Energy submetering",xlab="",col="black")
lines(datetime,Sub_metering_2,type="l",col="red")
lines(datetime,Sub_metering_3,type="l",col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=3, col=c("black", "red", "blue"))
#4
plot(datetime,RP,type="l",ylab="Global_reactive_power",xlab="datetime")

dev.off()