#getting the dataset
household_power_consumption <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")

#formatting the dates and time
household_power_consumption$Date = dmy(household_power_consumption$Date)
household_power_consumption$Time <- strptime(household_power_consumption$Time,"%X")
household_power_consumption$Time<-format(household_power_consumption$Time, format="%H:%M:%S")

#subsetting
household_power_consumption<-filter(household_power_consumption,Date == ymd("2007-02-01") | Date == ymd("2007-02-02"))

#converting dates
datetime <- paste(Date,Time)
datetime=as.POSIXct(datetime)

png(filename = "plot1.png",width = 480,height = 480)
hist(household_power_consumption$Global_active_power,col = "red", xlab ="Global Active Power (kilowatts)",main = "Global Active Power" )
dev.off()