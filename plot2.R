plot02 <- function(data){

    subtract_data <- function(directory, filename){
      directory <- getwd()
      fn <- "household_power_consumption.txt"
      con <- read.table(fn,sep = ";",header = T, quote = "", comment.char = "")
      con$Date <- as.Date(con$Date, "%d/%m/%Y")
      dset <- subset(con, Date == c("2007-02-01","2007-02-02"))
      return(dset)}
    # submit the database to "md" (mydata)
    
    md <- subtract_data()
    con <- md[3]
    con$DT <- strptime(paste(md$Date, md$Time), format = "%Y-%m-%d %H:%M:%S")
    
    con[,1] <- as.numeric(levels(con[,1]))[con[,1]]
    png(filename = "plot2.png", width = 480, height = 480, bg = "transparent")
    plot(con[,2],con[,1],type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
    dev.off()
    return()
}
# How to use this?
# >Source("plot2.R")
# plot02()




