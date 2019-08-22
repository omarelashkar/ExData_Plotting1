
library(lubridate)
library(dplyr)


if(!file.exists(paste0("../Downloads", "/exdata_data_household_power_consumption.zip"))){
  
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip" , destfile = here())
  unzip("..\\Downloads\\exdata_data_household_power_consumption.zip" , exdir = "..\\Downloads\\Plotdata" )

}

dat <- readr::read_delim("../Downloads/Plotdata/household_power_consumption.txt" , delim = ";"  )

dat$Date <- dmy(dat$Date )
dat <- dat %>% filter(between( dat$Date , right = dmy('2/02/2007') ,  left = dmy('1/2/2007')))
dat$Time <- hms(dat$Time)

dat$NewDate <- dat$Date  + dat$Time




