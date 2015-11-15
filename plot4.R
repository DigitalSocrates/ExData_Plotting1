plot4 <- function() {
  # specify output file
  png(file = "plot4.png")
  #Read raw data from a txt file
  # specify: keep header and define delimiter
  rawData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings="?")
  # tranform a column in a raw dataset and assign it
  powerconsumption <- transform(rawData,Date=as.Date(rawData$Date,format="%d/%m/%Y"))
  # get data only for two days
  powerconsumptionSubset <- powerconsumption[powerconsumption$Date=="2007-2-1" | powerconsumption$Date=="2007-2-2", ]
  # merge data and time 
  powerconsumptionSubset$DateTime <- strptime(paste(powerconsumptionSubset$Date,powerconsumptionSubset$Time,sep=":"),format="%Y-%m-%d:%H:%M:%S")
  # define the grid for plotting ( 2 rows and 2 columns)
  par(mfrow = c(2,2))
  # make a plot using time series for Global Active Power
  with(powerconsumptionSubset, plot(powerconsumptionSubset$DateTime,powerconsumptionSubset$Global_active_power,type="l",xlab="",ylab="Global Active Power"))
  # If set to TRUE, the next high-level plotting command (actually plot.new) should not clean the frame before drawing as if it were on a new device.
  
  # make a plot using time series for Voltage
  with(powerconsumptionSubset, plot(powerconsumptionSubset$DateTime,powerconsumptionSubset$Voltage,type="l",xlab="datetime",ylab="Voltage"))
  
  # make a plot using time series for sub_metering 1
  with(powerconsumptionSubset, plot(powerconsumptionSubset$DateTime,powerconsumptionSubset$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering", col = "black", ylim = c(0,38)))
  # If set to TRUE, the next high-level plotting command (actually plot.new) should not clean the frame before drawing as if it were on a new device.
  par(new=TRUE)
  # make a plot using time series for sub_metering 2
  with(powerconsumptionSubset, plot(powerconsumptionSubset$DateTime,powerconsumptionSubset$Sub_metering_2,type="l",xlab="",ylab="Energy sub metering", col = "red", ylim = c(0,38)))
  # If set to TRUE, the next high-level plotting command (actually plot.new) should not clean the frame before drawing as if it were on a new device.
  par(new=TRUE)
  # make a plot using time series for sub_metering 3
  with(powerconsumptionSubset, plot(powerconsumptionSubset$DateTime,powerconsumptionSubset$Sub_metering_3,type="l",xlab="",ylab="Energy sub metering", col = "blue", ylim = c(0,38)))
  
  #annotate with a legend
  legend("topright",col=c("black","red","blue"),lty=c(1,1,1),lwd=c(1,1,1),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")
  
  # make a plot using time series for Voltage
  # note: need to hide border around the legend
  with(powerconsumptionSubset, plot(powerconsumptionSubset$DateTime,powerconsumptionSubset$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power",lwd=0.005))
  
  # write png 
  dev.off()
}