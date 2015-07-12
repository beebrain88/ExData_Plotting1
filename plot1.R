data<- read.csv("household_power_consumption.txt", sep= ";", stringsAsFactors= FALSE)
febdata<-data.frame(data[66637:69516, ], stringsAsFactors= FALSE)						#segment data to just contain desired dates
global_power<- as.numeric(febdata$Global_active_power)										#create global power as a numeric variable

png(filename= "plot1.png", width = 480, height= 480, units = "px" )						#creates png device to paste plot into
 	#creates histogram of global power variable
	hist(global_power, breaks = 13, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()																														#turns off device