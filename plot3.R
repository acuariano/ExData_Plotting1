plot3 <- function() {
        library(sqldf)
        print('Reading data for 2007/02/01 and 2007/02/02...')
        consumption <- read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date ='1/2/2007' or Date = '2/2/2007'", sep = ';')
        closeAllConnections()
        print('Converting to dates...')
        consumption$DateTime <- as.POSIXct(paste(consumption$Date, consumption$Time), format="%d/%m/%Y %H:%M:%S")
        print('Writing line plot to plot3.png...')
        png(filename = "plot3.png")
        writeGraphic3(consumption)
        dev.off()
        
}

writeGraphic3 <- function(df) {
        plot(df$DateTime, df$Global_active_power, type = "n", xlab='', ylab='Energy sub metering', ylim = c(0, 38))
        lines(df$DateTime, df$Sub_metering_1)
        lines(df$DateTime, df$Sub_metering_2, col = "red")
        lines(df$DateTime, df$Sub_metering_3, col = "blue")
        legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=2)
}