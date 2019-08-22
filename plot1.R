

source("../Downloads/ExData_Plotting1-master/ExData_Plotting1-master/dataload.R")



hist(dat$Global_active_power , main = "Global Active Power" , xlab = "Global Active Power (kilowatts)" , col = "red")

dev.copy(png , "plot1.png")
