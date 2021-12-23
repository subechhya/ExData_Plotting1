## memory requirement calculation
q<- 2075259 * 9 * 8 ## bytes
q1<- q/2^20         ## converting to MB = 142.5 MB
## Reading the household power consumption data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
## Converting the date stored as character to date format
data$Date <- as.Date(data$Date, "%d/%m/%Y")
## storing data that were from the 2 dates into data frame:  dat1
dat1<- data %>% filter (Date == "2007-02-01" | Date =="2007-02-02")

## Plot1
## plotting histogram: plot 1 and saving as plot1.png
png("plot1.png", width = 480, height = 480)
hist(as.numeric(dat1$Global_active_power), xlab = "Global Active Power (kilowatts)", col = "red", 
     main = "Global Active Power")
dev.off()

## Plot 2
png("plot2.png", width = 480, height = 480)
plot(dat1$DateTime, dat1$Global_active_power, type = "l", xlab = " ", ylab = "Global Active Power (kilowatts)")
dev.off()

## Plot 4
png("plot4.png", width = 480, height = 480)
par(mfcol = c(2, 2)) ## setting a plot grid of 2 by 2
## plotting global active power vs days
plot(dat1$DateTime, dat1$Global_active_power, type = "l", xlab = " ", ylab = "Global Active Power")
# plotting energy submetering for different days
plot(dat1$DateTime, dat1$Sub_metering_1, type = "l", xlab = " ", ylab = " ", col = "black", ylim = c(-1, 38))
par(new = T)
plot(dat1$DateTime, dat1$Sub_metering_2, type = "l", xlab = " ", ylab = " ", col = "red", ylim = c(-1, 38))
par(new = T)
plot(dat1$DateTime, dat1$Sub_metering_3, type = "l", xlab = " ", ylab = "Energy sub metering", col = "blue", ylim = c(-1, 38))
legend("topright", legend=names(dat1[7:9]),
       col=c("black", "red", "blue"), lty=1, cex=0.8)

plot(dat1$DateTime, dat1$Voltage, type = "l", xlab = "datetime", ylab = "Voltage", col = "black",)

plot(dat1$DateTime, dat1$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power", col = "black",)

dev.off()
