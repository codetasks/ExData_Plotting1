# Plot3.R to plot the Global active power data 

# here the file containing the data and also the r script file are in the same directory(working directory)
plotdata <- read.table("household_power_consumption.txt", sep=';', header=TRUE, colClasses = c('character', 'character', 'numeric',
         'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'), na.strings =c("?"), stringsAsFactors =FALSE)

#subsetting of data based on dates mentioned 
plot3data <- plotdata[plotdata$Date %in% c("1/2/2007","2/2/2007") ,]
# converting the values in Date column into date format
date <- as.Date(plot3data$Date, "%d/%m/%Y")
#concatenating date and time
select <- paste(date, plot3data$Time)

# handling date time conversions using strptime
DT <- strptime(select, "%Y-%m-%d %H:%M:%S")

# a new png file of dimensions 480 x 480 is created
png("plot3.png",  height = 480, width = 480)

#plot() function is used to plot  the global active power data assigning labels
plot(DT,plot3data$Sub_metering_1, type="l",xlab="", ylab="Energy Sub metering" )
#assigning colors to the lines in the plot
lines(DT, plot3data$Sub_metering_2, type="l", col="red") 
lines(DT, plot3data$Sub_metering_3, type="l", col="blue")

# creating a legend box with details 
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd =2.5,col=c("black", "red", "blue"))

#close png file
dev.off()