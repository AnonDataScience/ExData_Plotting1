
#load the data set
filename<-"household_power_consumption.txt"
all_data <- read.table(filename,header=T,sep=";",colClasses=c("character","character","double","double","double","double","double","double","numeric"),na.strings="?")
#just add the date and time together 
all_data$DateTime = paste(all_data$Date, all_data$Time)
#format it 
all_data$DateTime = as.POSIXlt(all_data$DateTime,format="%d/%m/%Y %H:%M:%S")
#format it 
all_data$Date = as.Date(all_data$DateTime, format="%d/%m/%Y %H:%M:%S")
#we only want two days worth of data
my_data<- subset(all_data, Date==as.Date("2007-02-01") | Date==as.Date("2007-02-02"))
#clear up some memory
rm(all_data)

#make the file
png("plot3.png", height = 480, width = 480, units = "px");
#fill it with the chart
plot(x=(my_data$DateTime),y=my_data$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(x=(my_data$DateTime),y=my_data$Sub_metering_2,col="red")
lines(x=(my_data$DateTime),y=my_data$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="l",col=c("black","red","blue"),lwd=2,cex=0.7)
#close the device
dev.off()
