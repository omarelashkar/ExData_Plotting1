
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip" , destfile = "..\\Downloads\\")
unzip("..\\Downloads\\exdata_data_household_power_consumption.zip" , exdir = "..\\Downloads\\Plotdata" )
list.files("../Downloads/Plotdata" , full.names = T)



dat <- readr::read_delim("../Downloads/Plotdata/household_power_consumption.txt" , delim = ";"  )


library(lubridate)
library(dplyr)

dat$Date <- parse_date_time(x = dat$Date ,"%d/%m/%Y") 
dat$Time <- parse_date_time(x = dat$Time , "H%:M%:S%")
dat <- dat %>% filter(between( dat$Date , right = as_datetime('2007-02-02') ,  left = as_datetime('2007-02-01')))

png("..\\Downloads\\ExData_Plotting1-master\\ExData_Plotting1-master\\plot1.png" , width = 480 , height = 480)

hist( dat$Global_active_power , xlab = "Global Active Power (kilowatts)"  , main = "Global Active Power" , col = "red" , axes = F)
axis(1, at = seq(0,6,2) )
axis(2, at = seq(0,1200,200) ,  labels = seq(0,1200,200) )


dev.off()
