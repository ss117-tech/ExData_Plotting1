plot3 <- function() {
    #Read the file
    df <- read.table("household_power_consumption.txt", header=TRUE,sep=";",colClasses=c("character", "character", rep("numeric",7)),na="?")

    # convert date and time variables to proper class
    df$Time <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")
    df$Date <- as.Date(df$Date, "%d/%m/%Y")

    # only use data from the dates 2007-02-01 and 2007-02-02
    df <- subset(df, Date %in% as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d"))

    png("plot3.png", width=400, height=400)
    plot(df$Time, df$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
    lines(df$Time, df$Sub_metering_2, col="red")
    lines(df$Time, df$Sub_metering_3, col="blue")
    legend("topright", col=c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1)
    dev.off()
}
