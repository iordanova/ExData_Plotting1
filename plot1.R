##Macro to read data and make plot1.png

##Read data
##This block is common to all macros
mydata<-read.table("household_power_consumption.txt",header=T,sep=";",stringsAsFactors = FALSE)
mydata$Date<-strptime(mydata$Date,"%d/%m/%Y")
##Select smaller data set
small_data<-mydata[grepl("2007-02-01",mydata$Date) | grepl("2007-02-02",mydata$Date),]
##Convert to numeric
cols<-c(3,4,5,6,7,8)
small_data[,cols]<-apply(small_data[,cols],2,function(x) as.numeric(x))
##Make a datetime variable
Date_Time <-paste(Date,Time)
Date_Time_form <- strptime(Date_Time, "%Y-%m-%d %H:%M:%S")

##Make quick plot and save
attach(small_data)
hist(Global_active_power, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)") 

dev.copy(device=png, file="plot1.png", width=480, height=480)
dev.off()