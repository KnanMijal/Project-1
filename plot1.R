file <- "household_power_consumption.txt"
data <- read.table(file, sep=";",header = T, stringsAsFactors = F,dec="." )

d <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
ActivePower <- as.numeric(d$Global_active_power)
png("plot1.R.png")
hist(ActivePower,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()