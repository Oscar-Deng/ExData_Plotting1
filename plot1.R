plot01 <- function(data){

    subtract_data <- function(directory, filename){
      directory <- getwd()
      fn <- "household_power_consumption.txt"
      con <- read.table(fn,sep = ";",header = T, quote = "", comment.char = "")
      con$Date <- as.Date(con$Date, "%d/%m/%Y")
      dset <- subset(con, Date == c("2007-02-01","2007-02-02"))
      return(dset)}
    # submit the database to "md" (mydata)
    md <- subtract_data()
    int <- as.numeric(levels(md$Global_active_power))[md$Global_active_power]
    png(filename = "plot1.png", width = 480, height = 480, bg = "transparent")
    hist(int, main = "Global Active Power", col = "red", xlab = "Global Active Power (Kilowatts)")
    dev.off()
    return()
}
# How to use this?
# >Source("plot1.R")
# plot01()

