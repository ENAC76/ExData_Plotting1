## Downloading and Reading the Zip file
url<-"https://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip"
download.file(url, destfile = "./Exploratory Data Analysis/Week 1/exdata_data_household_power_consumption.zip", method="libcurl")
path<-"./Exploratory Data Analysis/Week 1/exdata_data_household_power_consumption.zip"
dir<-"./Exploratory Data Analysis/Week 1/Project"
path2<-"./Exploratory Data Analysis/Week 1/Project/household_power_consumption.txt"
unzip(path, exdir = dir )
hhpc <- read.table(path2, header = TRUE, dec=".", sep = ";", na.strings = "?")

## Knowing the data base

head(hhpc)
dim(hhpc)
str(hhpc)

## Data Transformation and Filtering

hhpc$Date_time = paste(hhpc$Date, hhpc$Time, sep=" ")

hhpc$Date_time <- as.POSIXlt(strptime(hhpc$Date_time,"%d/%m/%Y %H:%M:%S"))

hhpc$Date<- as.Date(hhpc$Date, format="%d/%m/%Y")

hhpc$Global_active_power<- as.numeric(as.character(hhpc$Global_active_power))


hhpc2<-subset(hhpc, Date >= "2007-02-01" & Date<= "2007-02-02")

## Building the plot

with(hhpc2, hist(Global_active_power, col="red", main="Global Active Power", xlab ="Global Active Power (Kilowatts)"))
dev.copy(png, file ="plot1.png", width=480, height=480)
dev.off()