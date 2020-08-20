plot1 <- function() {
    #Read the file
    df <- read.table("household_power_consumption.txt", header=TRUE,sep=";",colClasses=c("character", "character", rep("numeric",7)),na="?")

    # convert date and time variables to proper class
    df$Time <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")
    df$Date <- as.Date(df$Date, "%d/%m/%Y")

    # only use data from the dates 2007-02-01 and 2007-02-02
    df <- subset(df, Date %in% as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d"))

    png("plot1.png", width=400, height=400)
    hist(df$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red")
    dev.off()
}
