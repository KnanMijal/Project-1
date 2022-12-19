file <- "household_power_consumption.txt"
data <- read.table(file, sep=";",header = T, stringsAsFactors = F,dec="." )

d <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

k <- paste(d$Date,d$Time,sep=" ")
dt <- strptime(k,"%d/%m/%Y %H:%M:%S")
ActivePower <- as.numeric(d$Global_active_power)
png("plot2.png")
plot(dt,ActivePower,type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()