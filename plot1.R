##
## plot1.R - Prepare histogram of electrical power usage
##

plot1 <- function() {
        library(lubridate)
        
        ## 1. Download zip file and extract zip file to working directory
        
        fURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        
        download.file(fURL,destfile="epc.zip")
        fn <- unzip(zipfile="epc.zip")
        
        ## fn <- "household_power_consumption.txt"     ## ELECTRICAL POWER CONSUMPTION FILE
        
        epfile <- read.table(fn, sep=";", header = TRUE, na.string="?")
        epfile$Date <- dmy(epfile$Date)
        epfile$Global_active_power <- as.numeric(epfile$Global_active_power)
        ef1 <- filter(epfile, Date >= "2007-02-01" & Date <= "2007-02-02")
        png(filename="plot1.png", width=480, height=480)
        hist(ef1$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
        
        dev.off()
        
        print("plot1 Histogram of electrical power usage complete")

}
