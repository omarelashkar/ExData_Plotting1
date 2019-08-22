source("../Downloads/ExData_Plotting1-master/ExData_Plotting1-master/dataload.R")


with(dat , plot(NewDate, Global_active_power  , type = "l" , ann = F))
title(ylab = "Global Active Power (kilowatts)")


dev.copy(png,'..\\Downloads\\ExData_Plotting1-master\\ExData_Plotting1-master\\plot2.png',  width = 480, height = 480)
dev.off()

