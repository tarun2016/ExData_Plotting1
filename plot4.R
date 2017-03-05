#Read the household_power_consumption.txt file
power_consumption<-read.table("household_power_consumption.txt",sep=";",na.strings = "?",header = TRUE,stringsAsFactors = FALSE)
#Create a new column Date_Time containing date and time 
power_consumption$Date_Time<-strptime(paste(power_consumption$Date,power_consumption$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
#Convert date column into date format and filter the dates
power_consumption$Date<-as.Date(power_consumption$Date,"%d/%m/%Y")
power_consumption_filter<-subset(power_consumption,Date_Time>="2007-02-01" & Date<="2007-02-02")
#plot the graph
png("plot2.png", width=480, height=480)
par(mfrow = c(2, 2)) 
plot(power_consumption_filter$Date_Time,power_consumption_filter$Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(power_consumption_filter$Date_Time,power_consumption_filter$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(power_consumption_filter$Date_Time,power_consumption_filter$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(power_consumption_filter$Date_Time,power_consumption_filter$Sub_metering_2, type="l", col="red")
lines(power_consumption_filter$Date_Time,power_consumption_filter$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
plot(power_consumption_filter$Date_Time,power_consumption_filter$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()