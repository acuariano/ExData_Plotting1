plot4 <- function() {
        library(sqldf)
        source('plot2.R')
        source('plot3.R')
        print('Reading data for 2007/02/01 and 2007/02/02...')
        consumption <- read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date ='1/2/2007' or Date = '2/2/2007'", sep = ';')
        closeAllConnections()
        print('Converting to dates...')
        consumption$DateTime <- as.POSIXct(paste(consumption$Date, consumption$Time), format="%d/%m/%Y %H:%M:%S")
        print('Writing line plot to plot4.png...')
        png(filename = "plot4.png")
        writeAllGraphic(consumption)
        dev.off()
        
}

writeAllGraphic <- function(df) {
        par(mfrow = c(2,2))
        writeGraphic2(df)
        writeGraphic4(df)
        writeGraphic3(df)
        writeGraphic5(df)
        par(mfrow = c(1,1))
}

writeGraphic4 <- function(df) {
        plot(df$DateTime, df$Voltage, type = "n", xlab='datetime', ylab='Voltage')
        lines(df$DateTime, df$Voltage)
}

writeGraphic5 <- function(df) {
        plot(df$DateTime, df$Global_reactive_power, type = "n", xlab='datetime', ylab='Global reactive power', )
        lines(df$DateTime, df$Global_reactive_power)
}