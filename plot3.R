#Read the household_power_consumption.txt file
power_consumption<-read.table("household_power_consumption.txt",sep=";",na.strings = "?",header = TRUE,stringsAsFactors = FALSE)
#Create a new column Date_Time containing date and time 
power_consumption$Date_Time<-strptime(paste(power_consumption$Date,power_consumption$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
#Convert date column into date format and filter the dates
power_consumption$Date<-as.Date(power_consumption$Date,"%d/%m/%Y")
power_consumption_filter<-subset(power_consumption,Date_Time>="2007-02-01" & Date<="2007-02-02")
#plot the graph
png("plot3.png", width=480, height=480)
plot(power_consumption_filter$Date_Time,power_consumption_filter$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(power_consumption_filter$Date_Time,power_consumption_filter$Sub_metering_2, type="l", col="red")
lines(power_consumption_filter$Date_Time,power_consumption_filter$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()