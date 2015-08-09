### read in data and edit data
dat <- read.table("household_power_consumption.txt",sep = ";",header=T,na.strings = "?")
dat$Time <- strptime(paste(dat$Date,dat$Time,sep="-"),format = "%d/%m/%Y-%H:%M:%S")
dat$Date <- as.Date(dat$Date,format = "%d/%m/%Y")

subdat <- dat[dat$Date == "2007-02-01" | dat$Date == "2007-02-02",]

### create plot 3
png("plot3.png",width = 480,height = 480)
plot(subdat$Time,subdat$Sub_metering_1,xlab = "",ylab = "Energy sub metering",type = "l")
points(subdat$Time,subdat$Sub_metering_2,type = "l", col = "red")
points(subdat$Time,subdat$Sub_metering_3,type = "l", col = "blue")
legend(x = "topright",lty = 1, col = c("black", "red","blue"), legend = paste0("Sub_metering_",1:3))
dev.off()