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

subMetering1 <- as.numeric(dat_sel$Sub_metering_1)

subMetering2 <- as.numeric(dat_sel$Sub_metering_2)

subMetering3 <- as.numeric(dat_sel$Sub_metering_3)
#Plot Graphs
png("../Desktop/Coursera/ExData_Plotting1/Plot3.png",width = 480, height = 480, units = "px",bg="white")
plot(dat_sel$datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")

lines(dat_sel$datetime, subMetering2, type="l", col="red")

lines(dat_sel$datetime, subMetering3, type="l", col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()