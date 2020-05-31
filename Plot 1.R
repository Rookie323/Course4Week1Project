library(lubridate)

dat <- read.table("household_power_consumption.txt", sep = ";", header=T)
head(dat)
str(dat)

dat$Date2 <- as.Date(dat$Date, format="%d/%m/%Y")
head(dat$Date2)
head(dat$Date)


dat2<- dat[dat$Date2 >= as.POSIXct("2007-02-01") & dat$Date2 <= as.POSIXct("2007-02-02"),]
dat2$Global_active_power<-as.numeric(as.character(dat2$Global_active_power))

hist(dat2$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

dev.copy(device = png, "Plot 1.png", width = 480, height = 480)
dev.off()
