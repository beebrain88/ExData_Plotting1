data<- read.csv("household_power_consumption.txt", sep= ";", stringsAsFactors= FALSE)  ##load in data
febdata<-data.frame(data[66637:69516, ], stringsAsFactors= FALSE)						#segment data to just contain desired dates
global_power<- as.numeric(febdata$Global_active_power)								#create global power as a numeric variable
date_time<- paste(as.Date(febdata$Date, "%d/%m/%Y"), febdata$Time)		#pastes date and time together to get formated
datetime<-strptime(date_time, format = "%Y-%m-%d %H:%M:%S")				#formats date and time together using strptime

png(filename= "plot2.png", width = 480, height= 480, units = "px" )				#creates png device to paste plot into
	plot(x= datetime, y= global_power, type= "l", xlab= " ", ylab= "Global Active Power (kilowatts)")  	#creates line plot
dev.off()																												#turns off device