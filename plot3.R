plot03 <- function(data){
    subtract_data <- function(directory, filename){
      directory <- getwd()
      fn <- "household_power_consumption.txt"
      con <- read.table(fn,sep = ";",header = T, quote = "", comment.char = "")
      con$Date <- as.Date(con$Date, "%d/%m/%Y")
      dset <- subset(con, Date == c("2007-02-01","2007-02-02"))
      return(dset)}
    # save the database to "md" (mydata)
    md <- subtract_data()
    # save sub metering 1~3 to "con"
    con <- md[7:9]
    # save Time data to "con$Time"
    con$Time <- strptime(paste(md$Date, md$Time), format = "%Y-%m-%d %H:%M:%S")
    # change sub metering data into numeric
    con[,1] <- as.numeric(levels(con[,1]))[con[,1]]
    con[,2] <- as.numeric(levels(con[,2]))[con[,2]]
    # create a png file:"plot3.png"
    png(filename = "plot3.png", width = 480, height = 480, bg = "transparent")
    # plot in "plot3.png", which x is Time and y is sub metering 1~3, no main title, color:rgb
    plot(x=con[,4],y=con[,1],type = "l", xlab = "Time", ylab = "Energy sub metering",col = "red")
    lines(x=con[,4],y=con[,2],col = "green") 
    lines(x=con[,4],y=con[,3],col = "blue")
    # create legend on topright of the plot
    legend(x='topright',legend=c("sub_metering_1","sub_metering_2","sub_metering_3"),col = c("red","green","blue"),lty = 1)
    dev.off()
    return("Done! Please check your folder!")
}
# How to use this?
# >Source("plot3.R")
# plot03()