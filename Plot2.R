
## Reading the file
Power_Data <- read.table("D:/Google/Data Scientist/Exploratory Data Analysis/Week 1/household_power_consumption.txt",header=TRUE, sep=";",colClasses=c("character", "character", rep("numeric",7)),na="?")


##Extracting the time data
Power_Data$Time <- strptime(paste(Power_Data$Date, Power_Data$Time), "%d/%m/%Y %H:%M:%S")
Power_Data$Date <- as.Date(Power_Data$Date, "%d/%m/%Y")

##Extractng data only for 2 dates
Valid_dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
Power_Data <- subset(Power_Data, Date %in% Valid_dates)

##Printing the graph
png("D:/Google/Data Scientist/Exploratory Data Analysis/Week 1/plot2.png", width=480, height=480)
plot(Power_Data$Time,Power_Data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

##Saving the Plot2.png file
dev.off()
