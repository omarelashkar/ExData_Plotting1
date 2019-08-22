source("../Downloads/ExData_Plotting1-master/ExData_Plotting1-master/dataload.R")

par(mfcol = c(2,2))

with(dat , plot(NewDate, Global_active_power  , type = "l" , ann = F))
title(ylab = "Global Active Power")


plot(dat$NewDate , dat$Sub_metering_1 , type = "n" , ann = F)
graphics::title(ylab = "Energy sub metering")
lines(dat$NewDate, dat$Sub_metering_1  , col = "black" )
lines(dat$NewDate, dat$Sub_metering_2 , col = "red")
lines(dat$NewDate, dat$Sub_metering_3 , col = "blue")

legend("topright", legend = names(dat)[7:9] , col = c("black" , "red" , "blue") , lty = 1 , bty = "n" , cex = 0.5 ,y.intersp = 0.2  )


with(dat , plot(NewDate , Voltage  , type = "l"))



with(dat , plot(NewDate ,Global_reactive_power , type = "l"))




dev.copy(png,'..\\Downloads\\ExData_Plotting1-master\\ExData_Plotting1-master\\plot4.png',  width = 480, height = 480)
dev.off()

