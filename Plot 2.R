library(lubridate)

dat <- read.table("household_power_consumption.txt", sep = ";", header=T)
head(dat)
str(dat)

dat$Date2 <- as.Date(dat$Date, format="%d/%m/%Y")
head(dat$Date2)
head(dat$Date)


dat2<- dat[dat$Date2 >= as.POSIXct("2007-02-01") & dat$Date2 <= as.POSIXct("2007-02-02"),]

  
dat2$Global_active_power<-as.numeric(as.character(dat2$Global_active_power))

dat2$Time2 <- as.character(dat2$Time)
dat2$DateTime <- paste0(dat2$Date2, " ",dat2$Time2)

dat2$DateTime2 <- as.POSIXlt(dat2$DateTime)


plot(dat2$DateTime2, dat2$Global_active_power, type = "l", main = "", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.copy (png, "Plot 2.png", width = 480, height = 480)
dev.off()
