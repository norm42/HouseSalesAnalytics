# License:  Free to use.  Norm Zeck
#load ggplot, histogram, graphics, plyr

setwd("C:/Users/norm/Desktop/MyDev/housesales")
library(ggplot2)
library(histogram)
library(graphics)
library(plyr)
#read in the house sales data from Rochester NY area
housesales <- read.csv("hswith date.csv")
#assign names to the columns
names(housesales) <- c("town", "price", "date")
#make sure we have date data types of a specific format
housesales$rdate <- as.Date(housesales$date, format='%m/%d/%Y')
housesales$month <- months(housesales$rdate, abbreviate = FALSE)

#subset out some price ranges and location factors of interest
x100_150 <- subset(housesales, (housesales$price < 150000) & (housesales$price > 70000))
x150_200 <- subset(housesales, (housesales$price < 200000) & (housesales$price > 150000))
x200_250 <- subset(housesales, (housesales$price < 250000) & (housesales$price > 200000))
x210_240 <- subset(housesales, (housesales$price < 240000) & (housesales$price > 210000))
x250plus <- subset(housesales, housesales$price > 250000)
x500minus <- subset(housesales, housesales$price < 500000)
x250minus <- subset(housesales, housesales$price < 250000)

#locations of interest
sweden <- subset(housesales, (housesales$town == "SWEDEN" | housesales$town == "CLARKSON") & housesales$price <400000)


webster <- subset(housesales, housesales$town == "WEBSTER" & housesales$price <400000)
webster200250 <- subset(housesales, housesales$town == "WEBSTER" & (housesales$price < 250000) & (housesales$price > 200000))

eastside <- subset(housesales, housesales$town == "WEBSTER" | housesales$town == "PENFIELD" |
                     housesales$town == "PERINTON" | housesales$town == "PITTSFORD")
cityside <- subset(housesales, housesales$town == "ROCHESTER" | housesales$town == "EROCHESTER" |
                     housesales$town == "GREECE" | housesales$town == "IRONDEQUOIT")

east250 <- subset(eastside, eastside$price < 250000)

city250 <- subset(cityside, cityside$price < 250000)

#Some quantity values for each factor
CountByTown <-count(housesales, "town")
CountByMonth <- count(housesales, "month")
NumTowns <- length(unique(housesales$town))

# df2 removes the dates for us to focus on stats.  Other ways to do this, but find
# that this is easier to manipulate for just stats/plotting.

df2<-subset(x250minus, select=c("town", "price"))

# compute some stats on the data
MeanSales <- aggregate(price~town, data=df2, FUN=mean)
names(MeanSales) <- c("town", "SalesMean")
MedianSales <- aggregate(price~town, data=df2, FUN=median)
names(MedianSales) <- c("town", "SalesMedian")
#quantile names the colums price.xx%, so that is ok for now
QuantSales <- aggregate(price~town, data=df2, FUN=quantile)




