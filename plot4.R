plot04 <- function(data){
    subtract_data <- function(directory, filename){
      directory <- getwd()
      fn <- "household_power_consumption.txt"
      con <- read.table(fn,sep = ";",header = T, quote = "", comment.char = "")
      con$Date <- as.Date(con$Date, "%d/%m/%Y")
      dset <- subset(con, Date == c("2007-02-01","2007-02-02"))
      return(dset)}
    # submit the database to "md" (mydata)
    md <- subtract_data()
    con <- md[c(3:5,7:9)]
    con$Time <- strptime(paste(md$Date, md$Time), format = "%Y-%m-%d %H:%M:%S")
    # save as numeric
    con[,1] <- as.numeric(levels(con[,1]))[con[,1]]
    con[,2] <- as.numeric(levels(con[,2]))[con[,2]]
    con[,3] <- as.numeric(levels(con[,3]))[con[,3]]
    con[,4] <- as.numeric(levels(con[,4]))[con[,4]]
    con[,5] <- as.numeric(levels(con[,5]))[con[,5]]
    # saving into plot4.png
    png(filename = "plot4.png", width = 480, height = 480, bg = "transparent")
    # making plots in 2:2
    par(mfrow=c(2,2))
    # plot1
    plot(x=con$Time, y=con$Global_active_power,type = "l",xlab = "",ylab = "Global Active Power")
    # plot2
    plot(x=con$Time, y=con$Voltage,type = "l",xlab = "datetime",ylab = "Voltage")
    # plot3
    plot(x=con$Time,y=con$Sub_metering_1,type = "l", xlab = "", ylab = "Energy sub metering",col = "red")
    lines(x=con$Time,y=con$Sub_metering_2,col = "green") 
    lines(x=con$Time,y=con$Sub_metering_3,col = "blue")
    legend(x='topright',legend=c("sub_metering_1","sub_metering_2","sub_metering_3"),col = c("red","green","blue"),lty = 1)
    # plot4
    plot(x=con$Time, y=con$Global_reactive_power,type = "l",xlab = "datetime",ylab = "Global_Reactive_Power")
    dev.off()
    return("Done! Please check your folder!")
}
# How to use this?
# >Source("plot3.R")
# plot03()