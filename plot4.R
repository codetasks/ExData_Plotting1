# Plot4.R to plot the Global active power data 

# here the file containing the data and also the r script file are in the same directory(working directory)
plotdata <- read.table("household_power_consumption.txt", sep=';', header=TRUE, colClasses = c('character', 'character', 'numeric',
         'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'), na.strings =c("?"), stringsAsFactors =FALSE)

#subsetting of data based on dates mentioned 
plot4data <- plotdata[plotdata$Date %in% c("1/2/2007","2/2/2007") ,]
# converting the values in Date column into date format
date <- as.Date(plot4data$Date, "%d/%m/%Y")
#concatenating date and time
select <- paste(date, plot4data$Time)

# handling date time conversions using strptime
DT <- strptime(select, "%Y-%m-%d %H:%M:%S")

# a new png file of dimensions 480 x 480 is created
png("plot4.png",  height = 480, width = 480)

# defining no of rows and columns of graphs
par(mfrow = c(2, 2))

# plotting various graphs
plot(DT, plot4data$Global_active_power, type="l", xlab="", ylab= "Global Active Power", cex=0.2)
plot(DT, plot4data$Voltage, type="l",xlab="datetime", ylab="Voltage")
plot(DT, plot4data$Sub_metering_1, type="l", xlab="", ylab="Energy Sub metering")
#coloring the lines in the submetering 2 and 3 graph
lines(DT, plot4data$Sub_metering_2, type="l", col="red")
lines(DT, plot4data$Sub_metering_3, type="l", col="blue")
# plotting and labelling
plot(DT, plot4data$Global_reactive_power, type="l", xlab="datetime",ylab="Global_reactive_power")

# creating a legend box with details 
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd =2.5,col=c("black", "red", "blue"))

#close png file
dev.off()