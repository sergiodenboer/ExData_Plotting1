if (Sys.setlocale("LC_TIME", "English")==""){
	Sys.setlocale("LC_TIME", "en_US.UTF-8")
}
data <- read.table(file="household_power_consumption.txt", header=T,na.strings='?',sep=";")

data$Time <- strptime(paste(data$Date, data$Time,sep=' '),format='%d/%m/%Y %H:%M:%S')
data$Date <- as.Date(data$Date,format='%d/%m/%Y')
analysis_data <- subset(data,Date==as.Date("2007-02-01") | Date==as.Date("2007-02-02"))


#Generates Plot 1
png(filename = "plot1.png")
hist(analysis_data$Global_active_power,col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
