plot4 <- function() {
    #Read the file
    df <- read.table("household_power_consumption.txt", header=TRUE,sep=";",colClasses=c("character", "character", rep("numeric",7)),na="?")

    # convert date and time variables to proper class
    df$Time <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")
    df$Date <- as.Date(df$Date, "%d/%m/%Y")

    # only use data from the dates 2007-02-01 and 2007-02-02
    df <- subset(df, Date %in% as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d"))

    png("plot4.png", width=400, height=400)
    par(mfrow=c(2,2))

    #Add 4 graphs with the lines 
    plot(df$Time, df$Global_active_power, type="l", xlab="",ylab="Global Active Power")
    plot(df$Time, df$Voltage, type="l", xlab="datetime", ylab="Voltage")
    plot(df$Time, df$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
    lines(df$Time, df$Sub_metering_2, col="red")
    lines(df$Time, df$Sub_metering_3, col="blue")
    legend("topright", col=c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, box.lwd=0)
    plot(df$Time, df$Global_reactive_power, type="n", xlab="datetime", ylab="Global_reactive_power")
    lines(df$Time, df$Global_reactive_power)
    dev.off()
}
