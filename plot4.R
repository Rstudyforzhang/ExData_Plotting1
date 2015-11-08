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

#draw the figure 4

#set the draw layout
par(mfrow=c(2,2))

#draw figure1
with(electricdata, plot(datetime, Global_active_power,type="l",xlab="", ylab="Global Active Power"))

#draw figure2
with(electricdata, plot(datetime, Voltage,type="l",xlab="datetime", ylab="Voltage"))

#draw figure3
plot(electricdata$datetime,electricdata$Sub_metering_1,type='l',col='black',xlab='',ylab='Energy sub metering')
lines(electricdata$datetime,electricdata$Sub_metering_2,col="red")
lines(electricdata$datetime,electricdata$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1",'Sub_metering_2','Sub_metering_3'),col=c("black","red","blue"),lty="solid")

#draw figure4
with(electricdata, plot(datetime, Global_reactive_power,type="l",xlab="datetime", ylab="Global_reactive_power"))

#save the figure
dev.copy(png,file="plot4.png",width=480,height=480)
dev.off()
