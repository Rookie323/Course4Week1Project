library(lubridate)

dat <- read.table("household_power_consumption.txt", sep = ";", header=T)
head(dat)
str(dat)

dat$Date2 <- as.Date(dat$Date, format="%d/%m/%Y")
head(dat$Date2)
head(dat$Date)


dat2<- dat[dat$Date2 >= as.POSIXct("2007-02-01") & dat$Date2 <= as.POSIXct("2007-02-02"),]

  
dat2$Global_active_power<-as.numeric(as.character(dat2$Global_active_power))
dat2$Global_reactive_power<-as.numeric(as.character(dat2$Global_reactive_power))
dat2$Voltage<-as.numeric(as.character(dat2$Voltage))

dat2$Time2 <- as.character(dat2$Time)
dat2$DateTime <- paste0(dat2$Date2, " ",dat2$Time2)

dat2$DateTime2 <- as.POSIXlt(dat2$DateTime)





png(filename = "Plot 4.png", width = 480, height = 480)


par(mfrow=c(2,2))

plot(dat2$DateTime2, dat2$Global_active_power, type = "l", main = "", xlab = "", 
     ylab = "Global Active Power")
plot(dat2$DateTime2, dat2$Voltage, type = "l", main = "", xlab = "datetime", 
     ylab = "Voltage")



plot(dat2$DateTime2, as.numeric(as.character(dat2$Sub_metering_1)) ,ylim = c(0,38), col = "black", 
     type = "l", main = "", xlab = "", ylab = "Energy sub metering")
  lines(dat2$DateTime2, as.numeric(as.character(dat2$Sub_metering_2)), col = "red")
  lines(dat2$DateTime2, as.numeric(as.character(dat2$Sub_metering_3)), col = "blue")
  legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lwd = 1, seg.len = 2, border = 0)

plot(dat2$DateTime2, dat2$Global_reactive_power, type = "l", main = "",  
     ylab = "Global_reactive_power", xlab = "datetime")
  
  
  dev.off()
