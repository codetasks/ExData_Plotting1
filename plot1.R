# Plot1.R to plot a histogram of the Global active power data 

# here the file containing the data and also the r script file are in the same directory(working directory)

plotdata <- read.table("household_power_consumption.txt", sep=';', header=TRUE, colClasses = c('character', 'character', 'numeric',
         'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'), na.strings =c("?"), stringsAsFactors =FALSE)

#subsetting of data based on dates mentioned 

plot1data <- plotdata[plotdata$Date %in% c("1/2/2007","2/2/2007") ,]

# a new png file of dimensions 480 x 480 is created

png("plot1.png",  height = 480, width = 480)

#histogram function is used to plot a histogram from the global active power data

hist(plot1data$Global_active_power, col="red",xlab="Global Active Power (kilowatts)",main = "Global Active Power")

#close png file
dev.off()
