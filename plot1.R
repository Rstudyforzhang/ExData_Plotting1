# load the electricity comsuption data(make sure the txt file in your working directory)
electric<-read.table("./household_power_consumption.txt",sep=";",header=TRUE,na.strings = "?") 

#subset the data for the selected date
electricdata<-subset(electric,Date=="1/2/2007"|Date=="2/2/2007")

#draw the figure1
hist(electricdata$Global_active_power,col="red",main="Gloabal Active Power",xlab="Global Active Power (kilowatts)")

#save the figure in a png file
dev.dev.copy(png,file="R.png",width=480,height=480)
dev.off()

