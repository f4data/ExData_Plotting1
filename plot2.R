plot2 <- function()
{
        # Load the source file
        household_power_consumption <- read.csv("./household_power_consumption.txt", sep=";", na.strings="?")
        
        # Filter the data we need
        hpc <- household_power_consumption[household_power_consumption$Date == "1/2/2007" | household_power_consumption$Date =="2/2/2007" ,]
        
        # Create the output file
        png("plot2.png", width = 480, height = 480)
        
        #Get the values to display
        datetime <- paste(hpc$Date, hpc$Time)
        xdata <- strptime(datetime, "%d/%m/%Y %H:%M:%S")
        ydata <- hpc$Global_active_power
        
        # Display the graph
        plot (xdata, ydata, xlab = "", ylab ="Global Active Power (kilowatts)", type = "n")
        lines(xdata, ydata)
        
        # Save the graph
        dev.off()
}