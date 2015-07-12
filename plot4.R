data<- read.csv("household_power_consumption.txt", sep= ";", stringsAsFactors= FALSE)  #load in data
febdata<-data.frame(data[66637:69516, ], stringsAsFactors= FALSE)						#segment data to just contain desired dates
head(febdata)
global_a_power<-as.numeric(febdata$Global_active_power)								#creates global active power as a numeric variable
voltage<-as.numeric(febdata$Voltage)																#creates voltage as a numeric variable
Sub_metering_1<-as.numeric(febdata$Sub_metering_1)									#create submetering 1  as a numeric variable
Sub_metering_2<-as.numeric(febdata$Sub_metering_2)									#create submetering 2  as a numeric variable
Sub_metering_3<- as.numeric(febdata$Sub_metering_3)									#create submetering 3  as a numeric variable
global_re_power<-as.numeric(febdata$Global_reactive_power)						#creates global reactive power as a numeric variable
date_time<- paste(as.Date(febdata$Date, "%d/%m/%Y"), febdata$Time)		#pastes date and time together to get formated
datetime<-strptime(date_time, format = "%Y-%m-%d %H:%M:%S")				#formats date and time together using strptime

png(filename= "plot4.png", width = 480, height= 480, units = "px" )					#creates png device to paste plot into
par(mfrow= c(2, 2))
	plot(x=datetime, y= global_a_power, type="l", xlab=" ", ylab= "Global Active Power")
	plot(x= datetime, y= voltage, xlab= "datetime", type= "l", ylab="Voltage")
	plot(x= datetime, y=Sub_metering_1, type= "n", xlab= " ", ylab= "Energy Sub metering", ylim= c(0, 38))  	#creates line plot
			lines(x=datetime, y=Sub_metering_1, col= "black")									#Plots sub metering 1 data as a black line
			lines(x= datetime, y= Sub_metering_2, col= "red")									#Plots sub metering 1 data as a red line
			lines(x= datetime, y= Sub_metering_3, col= "blue")									#Plots sub metering 1 data as a blue line
			##Adds legend with line symbol and appropriate colors and written labels
			legend ("topright", legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= 1 , col = c("black", "red", "blue"))
	plot(x=datetime, y= global_re_power, type= "l", xlab= "datetime", ylab= "Global_reactive_power")
dev.off()																												#turns off device

