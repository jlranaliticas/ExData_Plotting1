##
## plot3.R - Prepare line graph of Energy Sub Metering Measures
##

plot3 <- function () {
        
        library(lubridate)
        
        fURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        
        download.file(fURL,destfile="epc.zip")
        fn <- unzip(zipfile="epc.zip")
        
        ## fn <- "household_power_consumption.txt"     ## ELECTRICAL POWER CONSUMPTION FILE
        
        epfile <- read.table(fn, sep=";", header = TRUE, na.string="?")
        
 
        dt <- paste(epfile$Date, epfile$Time)
        epfile$DT <- dmy_hms(dt)
        
        ef1 <- filter(epfile, DT >= "2007-02-01" & DT < "2007-02-03")
        
        ef1$Sub_metering_1 <- as.numeric(ef1$Sub_metering_1)
        ef1$Sub_metering_2 <- as.numeric(ef1$Sub_metering_2)
        ef1$Sub_metering_3 <- as.numeric(ef1$Sub_metering_3)
        
        
        png(filename="plot3.png", width=480, height=480)
        with(ef1, plot(DT, Sub_metering_1,
                       type="l",
                       xlab = "",
                       ylab = "Energy sub metering"))
        legend("topright",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
                       col=c("black", "red", "blue"), lty=1)
        with(ef1, lines(DT, Sub_metering_2, col="red"))
        with(ef1, lines(DT, Sub_metering_3, col="blue"))
             
       
        
        dev.off()
        
        print("plot3 Line chart of electrical power usage complete")
        
}
