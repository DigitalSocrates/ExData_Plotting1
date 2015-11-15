plot2 <- function() {
  # specify output file
  png(file = "plot2.png")
  #Read raw data from a txt file
  # specify: keep header and define delimiter
  rawData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings="?")
  # tranform a column in a raw dataset and assign it
  powerconsumption <- transform(rawData,Date=as.Date(rawData$Date,format="%d/%m/%Y"))
  # get data only for two days
  powerconsumptionSubset <- powerconsumption[powerconsumption$Date=="2007-2-1" | powerconsumption$Date=="2007-2-2", ]
  # merge data and time 
  powerconsumptionSubset$DateTime <- strptime(paste(powerconsumptionSubset$Date,powerconsumptionSubset$Time,sep=":"),format="%Y-%m-%d:%H:%M:%S")
  # make a plot using time series
  with(powerconsumptionSubset, plot(powerconsumptionSubset$DateTime,powerconsumptionSubset$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)"))
  # write 
  dev.off()
}