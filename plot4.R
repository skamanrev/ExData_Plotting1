#
#JH Exploratory Data Analysis Project 1 Graph 4 - 1/7/2015
#
#read data and subset for required dates
df<-read.csv("household_power_consumption.txt",sep=";",colClasses="character")
df<-df[df$Date=="2/2/2007" |df$Date=="1/2/2007" ,]
#
#Identify and remove rows with missing data if any - missing data identified by "?" in this data set
df[df=="?"] <- NA
df<-df[complete.cases(df), ]
#
#create combined date and time field in Posix LT format
df$DateTime <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")
#
#create plot and print to PNG file
png(file = "plot4.png",width=480, height=480,bg="white")
par(mfcol=c(2,2))
#plot 1,1
with(df,plot(DateTime,as.numeric(Global_active_power),type="n",main="",xlab="",ylab="Global Active Power"))
lines(df$DateTime,as.numeric(df$Global_active_power))
#plot 1,2
with(df,plot(DateTime,as.numeric(Sub_metering_1),type="n",main="",xlab="",ylab="Energy sub metering"))
lines(df$DateTime,as.numeric(df$Sub_metering_1),col="black")
lines(df$DateTime,as.numeric(df$Sub_metering_2),col="red")
lines(df$DateTime,as.numeric(df$Sub_metering_3),col="blue")
legend("topright",col=c("black","red","blue"),lty=1,legend=colnames(df)[7:9],bty="n")
#plot 2,1
with(df,plot(DateTime,as.numeric(Voltage),type="n",main="",xlab="datetime",ylab="Voltage"))
lines(df$DateTime,as.numeric(df$Voltage))
#plot 2,2
with(df,plot(DateTime,as.numeric(Global_reactive_power),type="n",main="",xlab="datetime",ylab="Global_reactive_power"))
lines(df$DateTime,as.numeric(df$Global_reactive_power))
dev.off()