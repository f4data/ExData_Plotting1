plot1 <- function()
{
        # Load the source file
        household_power_consumption <- read.csv("./household_power_consumption.txt", sep=";", na.strings="?")
        
        # Filter the data we need
        hpc <- household_power_consumption[household_power_consumption$Date == "1/2/2007" | household_power_consumption$Date =="2/2/2007" ,]
        
        # Create the output file
        png("plot1.png", width = 480, height = 480)
        
        # Display the graph
        hist(hpc$Global_active_power, main ="Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")
        
        # Save the graph
        dev.off()
}