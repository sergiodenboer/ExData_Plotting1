if (Sys.setlocale("LC_TIME", "English")==""){
	Sys.setlocale("LC_TIME", "en_US.UTF-8")
}

data <- read.table(file="household_power_consumption.txt", header=T,na.strings='?',sep=";")

data$Time <- strptime(paste(data$Date, data$Time,sep=' '),format='%d/%m/%Y %H:%M:%S')
data$Date <- as.Date(data$Date,format='%d/%m/%Y')
analysis_data <- subset(data,Date==as.Date("2007-02-01") | Date==as.Date("2007-02-02"))


#Generates plot 3
png(filename = "plot3.png")
plot(analysis_data$Time,analysis_data$Sub_metering_1,type='line',col='black',ylab='Energy sub metering',xlab='')
lines(analysis_data$Time,analysis_data$Sub_metering_2,col='red')
lines(analysis_data$Time,analysis_data$Sub_metering_3,col='blue')
legend('topright',c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),col=c("black","red","blue"), lwd=1)
dev.off()
