#Read the household_power_consumption.txt file
power_consumption<-read.table("household_power_consumption.txt",sep=";",na.strings = "?",header = TRUE,stringsAsFactors = FALSE)
#Convert date column into date format and filter the dates
power_consumption$Date<-as.Date(power_consumption$Date,"%d/%m/%Y")
power_consumption_filter<-subset(power_consumption,Time_date>="2007-02-01" & Date<="2007-02-02")
#plot the graph
png("plot1.png", width=480, height=480)
hist(power_consumption_filter$Global_active_power,xlab = "Global Active Power(kilowatts)",ylab = "Frequency",main="Global Active Power",col="red")
dev.off()