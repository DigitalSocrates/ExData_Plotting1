plot1 <- function() {
  # specify output file
  png(file = "plot1.png")
  #Read raw data from a txt file
  # specify: keep header and define delimiter
  rawData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings="?")
  # tranform a column in a raw dataset and assign it
  powerconsumption <- transform(rawData,Date=as.Date(rawData$Date,format="%d/%m/%Y"))
  # get data only for two days
  powerconsumptionSubset <- powerconsumption[powerconsumption$Date=="2007-2-1" | powerconsumption$Date=="2007-2-2", ]
  # make a plot
  hist(powerconsumptionSubset$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")
  # write 
  dev.off()
}