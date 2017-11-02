# Download the data and unzip
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","data.zip")
unzip("data.zip")
# Read file 
dat<-read.table("household_power_consumption.txt",sep=";",header = TRUE,stringsAsFactors = FALSE)
#Load Libraries
library(dplyr)
library(lubridate)
dat1<-mutate(dat,datetime = dmy_hms(paste(Date,Time)),Date = dmy(Date),Time=hms(Time),Global_active_power=as.numeric(Global_active_power))
dat_sel<-filter(dat1,Date>=ymd("2007-02-01") & Date<=ymd("2007-02-02"))
#Plot Graphs
png("../Desktop/Coursera/ExData_Plotting1/Plot1.png",width = 480, height = 480, units = "px",bg="white")
hist(dat_sel$Global_active_power,col="red",xlab="Global Active Power (Kilowatts)",ylab="Frequency",main="Global Active Power")
dev.off()
