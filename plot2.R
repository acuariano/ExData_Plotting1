plot2 <- function() {
        library(sqldf)
        print('Reading data for 2007/02/01 and 2007/02/02...')
        consumption <- read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date ='1/2/2007' or Date = '2/2/2007'", sep = ';')
        closeAllConnections()
        print('Converting to dates...')
        consumption$DateTime <- as.POSIXct(paste(consumption$Date, consumption$Time), format="%d/%m/%Y %H:%M:%S")
        print('Writing line plot to plot2.png...')
        png(filename = "plot2.png")
        writeGraphic2(consumption)
        dev.off()

}

writeGraphic2 <- function(df) {
        plot(df$DateTime, df$Global_active_power, type = "n", xlab='', ylab='Global Active Power (kilowatts)')
        lines(df$DateTime, df$Global_active_power)
        
}