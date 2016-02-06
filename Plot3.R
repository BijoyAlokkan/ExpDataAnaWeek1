
## Reading the file
Power_Data <- read.table("D:/Google/Data Scientist/Exploratory Data Analysis/Week 1/household_power_consumption.txt",header=TRUE, sep=";",colClasses=c("character", "character", rep("numeric",7)),na="?")


##Extracting the time data
Power_Data$Time <- strptime(paste(Power_Data$Date, Power_Data$Time), "%d/%m/%Y %H:%M:%S")
Power_Data$Date <- as.Date(Power_Data$Date, "%d/%m/%Y")

##Extractng data only for 2 dates
Valid_dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
Power_Data <- subset(Power_Data, Date %in% Valid_dates)

##Printing the graph
plot(Power_Data$Time, Power_Data$Sub_metering_1, type="l", col="black",xlab="", ylab="Energy sub metering")
lines(Power_Data$Time, Power_Data$Sub_metering_2, col="red")
lines(Power_Data$Time, Power_Data$Sub_metering_3, col="blue")

##Saving the Plot3.png file
dev.copy(png, file="D:/Google/Data Scientist/Exploratory Data Analysis/Week 1/plot3.png", width=480, height=480)
dev.off()
