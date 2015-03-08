plot4 <- function()
{
        # Load the source file
        household_power_consumption <- read.csv("./household_power_consumption.txt", sep=";", na.strings="?")
        
        # Filter the data we need
        hpc <- household_power_consumption[household_power_consumption$Date == "1/2/2007" | household_power_consumption$Date =="2/2/2007" ,]
        
        # Create the output file
        png("plot4.png", width = 480, height = 480)
        
        # Get the values to display
        datetime <- strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S")
        ydata_A1 <- hpc$Global_active_power
        ydata_B1 <- hpc$Voltage
        ydata_C1 <- hpc$Sub_metering_1
        ydata_C2 <- hpc$Sub_metering_2
        ydata_C3 <- hpc$Sub_metering_3
        ydata_D1 <- hpc$Global_reactive_power
        
        # Display the graph
        par(mfrow = c(2,2))
        
        # Plot A = 1,1
        plot (datetime, ydata_A1, xlab = "", ylab ="Global Active Power", type = "n")
        lines(datetime, ydata_A1)
        
        # Plot B = 1,2
        plot (datetime, ydata_B1, ylab ="Voltage", type = "n")
        lines(datetime, ydata_B1)
        
        # Plot C = 2,1        
        plot (datetime, ydata_C1, xlab="", ylab ="Energy sub metering", type="n")
        lines(datetime, ydata_C1)
        lines(datetime, ydata_C2, col="red")
        lines(datetime, ydata_C3, col="blue")
        legend("topright", lwd = 1, bty="n", col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
        
        # plot D = 2,2
        plot (datetime, ydata_D1, ylab="Global_reactive_power", type = "n")
        lines(datetime, ydata_D1)
        
        # Save the graph        
        dev.off()
}