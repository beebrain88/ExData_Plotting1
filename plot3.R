data<- read.csv("household_power_consumption.txt", sep= ";", stringsAsFactors= FALSE)  #load in data
febdata<-data.frame(data[66637:69516, ], stringsAsFactors= FALSE)						#segment data to just contain desired dates
Sub_metering_1<-as.numeric(febdata$Sub_metering_1)									#create submetering 1 variable
Sub_metering_2<-as.numeric(febdata$Sub_metering_2)									#create submetering 2 variable
Sub_metering_3<- as.numeric(febdata$Sub_metering_3)									#create submetering 3 variable
date_time<- paste(as.Date(febdata$Date, "%d/%m/%Y"), febdata$Time)		#pastes date and time together to get formated
datetime<-strptime(date_time, format = "%Y-%m-%d %H:%M:%S")				#formats date and time together using strptime

png(filename= "plot3.png", width = 480, height= 480, units = "px" )					#creates png device to paste plot into
	plot(x= datetime, y=Sub_metering_1, type= "n", xlab= " ", ylab= "Energy Sub metering", ylim= c(0, 38))  	#creates line plot
			lines(x=datetime, y=Sub_metering_1, col= "black")									#Plots sub metering 1 data as a black line
			lines(x= datetime, y= Sub_metering_2, col= "red")									#Plots sub metering 1 data as a red line
			lines(x= datetime, y= Sub_metering_3, col= "blue")									#Plots sub metering 1 data as a blue line
			##Adds legend with line symbol and appropriate colors and written labels
			legend ("topright", legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= 1 , col = c("black", "red", "blue"))
dev.off()																												#turns off device

