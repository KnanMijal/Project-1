file <- "household_power_consumption.txt"
data <- read.table(file, sep=";",header = T, stringsAsFactors = F,dec="." )

d <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

k <- paste(dates$Date,dates$Time,sep=" ")
dt <- strptime(k,"%d/%m/%Y %H:%M:%S")
Sub_1 <- as.numeric(d$Sub_metering_1)
Sub_2 <- as.numeric(d$Sub_metering_2)
Sub_3 <- as.numeric(d$Sub_metering_3)

png("plot3.png")
plot(dt,Sub_1,type="l",ylab="Energy submetering",xlab="",col="black")
lines(dt,Sub_2,type="l",col="red")
lines(dt,Sub_3,type="l",col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=3, col=c("black", "red", "blue"))
dev.off()