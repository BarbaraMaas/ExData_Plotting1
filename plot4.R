### read in data and edit data
dat <- read.table("household_power_consumption.txt",sep = ";",header=T,na.strings = "?")
dat$datetime <- strptime(paste(dat$Date,dat$Time,sep="-"),format = "%d/%m/%Y-%H:%M:%S")
dat$Date <- as.Date(dat$Date,format = "%d/%m/%Y")

subdat <- dat[dat$Date == "2007-02-01" | dat$Date == "2007-02-02",]

### create plot 
png("plot4.png",width = 480,height = 480)
par(mfrow = c(2,2))

## create subplot 1
plot(subdat$datetime,subdat$Global_active_power,ylab = "Global Active Power",xlab = "",type = "l")

## create subplot 2
with(subdat,plot(datetime,Voltage,ylab = "Voltage",type = "l"))

## create subplot 3
with(subdat, {
    plot(datetime,Sub_metering_1,xlab = "",ylab = "Energy sub metering",type = "l")
    points(datetime,Sub_metering_2,type = "l", col = "red")
    points(datetime,Sub_metering_3,type = "l", col = "blue")
    legend(x = "topright",lty = 1, col = c("black", "red","blue"), legend = paste0("Sub_metering_",1:3),bty = "n")
})

## create subplot 4
with(subdat,plot(datetime,Global_reactive_power,type = "l"))
dev.off()