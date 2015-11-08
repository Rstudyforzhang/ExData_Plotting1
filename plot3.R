#read the data (make sure the data in the working directory)
electric<-read.table("./household_power_consumption.txt",sep=";",header=TRUE,na.strings = "?") 

#selected the subset needded
electricdata<-subset(electric,Date=="1/2/2007"|Date=="2/2/2007")

#convert the date into Date format
electricdata$Date <- as.Date(electricdata$Date, format="%d/%m/%Y")

#combine the Date and Time into new format
electricdata$datetime <- strptime(paste(electricdata$Date, electricdata$Time), format="%Y-%m-%d %H:%M:%S")

#set the local date to english
Sys.setlocale("LC_TIME", "English")

#draw figure 3
plot(electricdata$datetime,electricdata$Sub_metering_1,type='l',col='black',xlab='',ylab='Energy sub metering')
lines(electricdata$datetime,electricdata$Sub_metering_2,col="red")
lines(electricdata$datetime,electricdata$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1",'Sub_metering_2','Sub_metering_3'),col=c("black","red","blue"),lty="solid")

#save the figure3
dev.copy(png,file="plot3.png",width=480,height=480)
dev.off()
