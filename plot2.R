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

## Plot2

png (file='plot2.png', height = 480, width = 480) # Create Screen Device

with(el2,
     plot(DateTime,Global_active_power,             # Plot of Global Active Power by DOW
          type = 'l',                               # Chart Type = Line
          col = 'black',                            # Chart Color = Black
          ylab = "Global Active Power (kilowatts)", # Label y-axis
          xlab = ""))                               # Label x-axis Null

dev.off() #Close Screen Device