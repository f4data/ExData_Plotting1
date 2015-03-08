plot3 <- function()
{
        # Load the source file
        household_power_consumption <- read.csv("./household_power_consumption.txt", sep=";", na.strings="?")
        
        # Filter the data we need
        hpc <- household_power_consumption[household_power_consumption$Date == "1/2/2007" | household_power_consumption$Date =="2/2/2007" ,]
        
        # Create the output file
        png("plot3.png", width = 480, height = 480)
        
        # Get the values to display
        datetime <- paste(hpc$Date, hpc$Time)
        xdata <- strptime(datetime, "%d/%m/%Y %H:%M:%S")
        ydata1 <- hpc$Sub_metering_1
        ydata2 <- hpc$Sub_metering_2
        ydata3 <- hpc$Sub_metering_3
        
        # Display the graph
        plot (xdata, ydata1, xlab="", ylab ="Energy sub metering", type="n")
        lines(xdata, ydata1)
        lines(xdata, ydata2, col="red")
        lines(xdata, ydata3, col="blue")
        legend("topright", lwd = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
        
        # Save the graph        
        dev.off()
}