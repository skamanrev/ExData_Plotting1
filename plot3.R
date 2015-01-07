#
#JH Exploratory Data Analysis Project 1 Graph 3 - 1/7/2015
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
#create plot and write to file
png(file = "plot3.png",width=480, height=480,bg="white")
with(df,plot(DateTime,as.numeric(Sub_metering_1),type="n",main="",xlab="",ylab="Energy sub metering"))
lines(df$DateTime,as.numeric(df$Sub_metering_1),col="black")
lines(df$DateTime,as.numeric(df$Sub_metering_2),col="red")
lines(df$DateTime,as.numeric(df$Sub_metering_3),col="blue")
legend("topright",col=c("black","red","blue"),lty=1,legend=colnames(df)[7:9])
dev.off()