#Set WD
setwd("F:/PK/Coursera - Data Science Specialization/Course 4 - Exploratory Data Analysis/Week 1")

#Read Data
reqddata <- read.table("household_power_consumption.txt", 
                       sep=";", 
                       header = TRUE, 
                       na.strings="?")

#Concatenate Date & Time Variables & Transform Type & Check Data/Class

reqddata$DateTime <- strptime(paste(reqddata$Date,reqddata$Time), "%d/%m/%Y %H:%M:%S")
head(reqddata)
class(reqddata$DateTime)

#Subset Data on Date Conditions
el2 <- subset(reqddata,as.Date(DateTime) >= "2007-02-01" & as.Date(DateTime) <= "2007-02-02")

#Check Data
head(el2)
names(el2)
dim(el2)

#Plot4

png (file='plot4.png', height = 480, width = 480) # Create Screen Device

par(mfrow=c(2,2))

#Graph # 1,1
with(el2,
     plot(DateTime,Global_active_power,              # Plot of Global Active Power by DOW
          type = 'l',                                # Chart Type = Line
          col = 'black',                             # Chart Color = Black
          ylab = "Global Active Power (kilowatts)",  # Label y-axis
          xlab = ""))                                # Label x-axis Null

#Graph # 1,2

with(el2,
     plot(DateTime,Voltage,      # Plot of Global Active Power by DOW
          type = 'l',            # Chart Type = Line
          col = 'black',         # Chart Color = Black
          ylab = "Voltage",      # Label y-axis
          xlab = "datetime"))    # Label x-axis 


#Graph # 2,1

with(el2,
     plot(DateTime,Sub_metering_1,          # Plot of Sub-metering1 by DOW
          type = 'l',                       # Chart Type = Line
          col = 'black',                    # Line Color = Black
          ylab = "Energy sub metering",     # Label y-axis
          xlab = ""))                       # Label x-axis Null

with(el2,
     points(DateTime,Sub_metering_2,        # Add Plot of Sub-metering2 by DOW
            type = 'l',                     # Chart Type = Line
            col = 'red'))                   # Line Color = Red

with(el2,
     points(DateTime,Sub_metering_3,        # Add Plot of Sub-metering3 by DOW
            type = 'l',                     # Chart Type = Line
            col = 'blue'))                  # Line Color = Blue

legend("topright",                          # Position of Legend
       bty = 'n',                           # Legend Border Type
       lty = 1,                             # Legend Type of Line
       col=c("black","red","blue"),         # Legend Colors
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")) # Legend Names

# Graph # 2,2 

with(el2,
     plot(DateTime,Global_reactive_power,      # Plot of Global Reactive Power by DOW
          type = 'l',                          # Chart Type = Line
          col = 'black',                       # Chart Color = Black
          ylab = "Global_reactive_power",      # Label y-axis
          xlab = "datetime"))                  # Label x-axis

dev.off() #Close Screen Device