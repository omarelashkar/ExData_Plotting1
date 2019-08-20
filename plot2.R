
dat <- readr::read_delim("../Downloads/Plotdata/household_power_consumption.txt" , delim = ";" )


library(lubridate)
library(dplyr)

dat$Date <- parse_date_time(x = dat$Date ,"%d/%m/%Y") 
dat$Time <- parse_date_time(x = dat$Time , "H%:M%:S%")
dat <- dat %>% filter(between( dat$Date , right = as_datetime('2007-02-02') ,  left = as_datetime('2007-02-01')))

day <- weekdays(dat$Date)

with(dat ,{
  plot( Time,  Global_active_power ,  type= 'l', ylab = "Global Active Power (kilowatts)" , xlab = NA , cex.lab=0.8, cex.axis=0.8 , xaxt="n")
  axis(1, at  = c(parse_date_time("02:00" , "H%:M%") ,  parse_date_time("12:00" , "H%:M%") ,parse_date_time("24:00" ,"H%:M%") ) , labels = c("Thu"  , "Fri" , "Sat") )
     })




dev.copy(png,'..\\Downloads\\ExData_Plotting1-master\\ExData_Plotting1-master\\plot2.png',  width = 480, height = 480)
dev.off()
