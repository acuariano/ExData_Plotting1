plot1 <- function() {
        library(sqldf)
        print('Reading data for 2007/02/01 and 2007/02/02...')
        consumption <- read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date ='1/2/2007' or Date = '2/2/2007'", sep = ';')        
        closeAllConnections()
        print('Converting to dates...')
        consumption$DateTime <- as.POSIXct(paste(consumption$Date, consumption$Time), format="%d/%m/%Y %H:%M:%S")
        print('Writing histogram to plot1.png...')
        png(filename = "plot1.png")
        writeGraphic1(consumption)
        dev.off()
}

writeGraphic1 <- function(df) {
        hist(df$Global_active_power, col="red", xlab = 'Global Active Power (kilowatts)', main='Global Active Power')
}