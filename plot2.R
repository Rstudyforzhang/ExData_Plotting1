#read the data (make sure the data in the working directory)
electric<-read.table("./household_power_consumption.txt",sep=";",header=TRUE,na.strings = "?") 

#selected the subset needded
electricdata<-subset(electric,Date=="1/2/2007"|Date=="2/2/2007")

#convert the date into Date format
electricdata$Date <- as.Date(electricdata$Date, format="%d/%m/%Y")

#combine the Date and Time into new format
electricdata$datetime <- strptime(paste(electricdata$Date, electricdata$Time), format="%Y-%m-%d %H:%M:%S")

#set the local date to english
locale_original <- Sys.getlocale( category = "LC_TIME" )
Sys.setlocale("LC_TIME", "English")

#draw the figure 2
with(electricdata, plot(datetime, Global_active_power,type="l",xlab="", ylab="Global Active Power (in kilowatts)"))

#save the figure
dev.dev.copy(png,file="plot2.png",width=480,height=480)
dev.off()
