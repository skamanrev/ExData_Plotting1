#
#JH Exploratory Data Analysis Project 1 Graph 2 - 1/7/2015
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
#plot graph and write to file
png(file = "plot2.png",width=480, height=480,bg="white") 
with(df,plot(DateTime,as.numeric(Global_active_power),type="n",main="",xlab="",ylab="Global Active Power (kilowatts)"))
lines(df$DateTime,as.numeric(df$Global_active_power))
dev.off()
