# Plot2.R to plot the Global active power data 

# here the file containing the data and also the r script file are in the same directory(working directory)

plotdata <- read.table("household_power_consumption.txt", sep=';', header=TRUE, colClasses = c('character', 'character', 'numeric',
         'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'), na.strings =c("?"), stringsAsFactors =FALSE)

#subsetting of data based on dates mentioned 
plot2data <- plotdata[plotdata$Date %in% c("1/2/2007","2/2/2007") ,]
# converting the values in Date column into date format
date <- as.Date(plot2data$Date, "%d/%m/%Y")
#concatenating date and time

select <- paste(date, plot2data$Time)

# handling date time conversions using strptime
DT <- strptime(select, "%Y-%m-%d %H:%M:%S")

# a new png file of dimensions 480 x 480 is created

png("plot2.png",  height = 480, width = 480)

#plot() function is used to plot  the global active power data

plot(DT, plot2data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

#close png file
dev.off()