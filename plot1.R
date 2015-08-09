### read in data and edit data
dat <- read.table("household_power_consumption.txt",sep = ";",header=T,na.strings = "?")
dat$Time <- strptime(paste(dat$Date,dat$Time,sep="-"),format = "%d/%m/%Y-%H:%M:%S")
dat$Date <- as.Date(dat$Date,format = "%d/%m/%Y")

subdat <- dat[dat$Date == "2007-02-01" | dat$Date == "2007-02-02",]

### create plot 1
png("plot1.png",width = 480,height = 480)
hist(subdat$Global_active_power,main = "Global Active Power",col = "red",xlab = "Global Active Power (kilowatts)")
dev.off()