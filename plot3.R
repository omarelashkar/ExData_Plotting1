
dat <- readr::read_delim("../Downloads/Plotdata/household_power_consumption.txt" , delim = ";" )

library(lubridate)
library(dplyr)

dat$Date <- parse_date_time(x = dat$Date ,"%d/%m/%Y") 
dat$Time <- parse_date_time(x = dat$Time , "H%:M%:S%")
dat <- dat %>% filter(between( dat$Date , right = as_datetime('2007-02-02') ,  left = as_datetime('2007-02-01')))



plot(1:nrow(dat),dat$Sub_metering_1,main="", ylab="Energy sub metering",xlab="",type="l",col="black",axes=FALSE)
par(new=T)
plot(dat$Sub_metering_2,col="red",type="l",axes=FALSE,ylim=c(0,40),xlab="",ylab="")
par(new=T)
plot(dat$Sub_metering_3,col="blue",type="l",axes=FALSE,ylim=c(0,40),xlab="",ylab="")
axis(1, at = c(0,1500,2900),labels = c("Thu","Fri","Sat"))
axis(2, at = c(0,10,20,30),labels = c("0","10","20","30"))
legend("topright",legend=c("sub-metering1","sub-metering2","sub-metering3"),col=c("black","red","blue"),lty=c(1,1,1),lwd=2)
box(lty = 1, col = 'black')
dev.copy(png,"..\\Downloads\\ExData_Plotting1-master\\ExData_Plotting1-master\\plot3.png")
dev.off()
