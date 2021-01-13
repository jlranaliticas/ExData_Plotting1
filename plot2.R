##
## plot2.R - Prepare line graph electrical power usage
##

plot2 <- function () {
        
        library(lubridate)
        
        fURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        
        download.file(fURL,destfile="epc.zip")
        fn <- unzip(zipfile="epc.zip")
        
        ## fn <- "household_power_consumption.txt"     ## ELECTRICAL POWER CONSUMPTION FILE
        
        epfile <- read.table(fn, sep=";", header = TRUE, na.string="?")
        
        epfile$Global_active_power <- as.numeric(epfile$Global_active_power)
        dt <- paste(epfile$Date, epfile$Time)
        epfile$DT <- dmy_hms(dt)
        
        ef1 <- filter(epfile, DT >= "2007-02-01" & DT < "2007-02-03")
        
        png(filename="plot2.png", width=480, height=480)
        with(ef1, plot(DT, Global_active_power,
                       type="l",
                       xlab = "",
                       ylab = "Global Active Power(kilowatts)"))
        
        dev.off()
        
        print("plot2 Line chart of electrical power usage complete")
        
}
