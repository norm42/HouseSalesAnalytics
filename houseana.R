#load ggplot, histogram, graphics
setwd("C:/Users/norm/Desktop/MyDev/housesales")
library(ggplot2)
library(histogram)
library(graphics)
housesales <- read.csv("hswith date.csv")
names(housesales) <- c("town", "price", "date")
housesales$rdate <- as.Date(housesales$date, format='%m/%d/%Y')
housesales$month <- months(housesales$rdate, abbreviate = FALSE)

hist(as.Date(housesales$date, format='%m/%d/%Y'), breaks=20,freq=TRUE, main="Sales breaks 20")
hist(as.Date(housesales$date, format='%m/%d/%Y'), breaks=10,freq=TRUE, main="Sales breaks 10")
hist(as.Date(housesales$date, format='%m/%d/%Y'), breaks=26,freq=TRUE, main="Sales breaks 26")
hist(as.Date(housesales$date, format='%m/%d/%Y'), breaks=120,freq=TRUE, main="Sales breaks 120")
x150_200 <- subset(housesales, (housesales$price < 200000) & (housesales$price > 150000))
x100_150 <- subset(housesales, (housesales$price < 150000) & (housesales$price > 70000))
hist(housesales$price, breaks=40)
x <- subset(housesales, housesales$price < 250000)
hist(x$price, breaks=40)
x2 <- subset(x, x$price > 200000)
hist(x2$price, breaks=20)
hist(as.Date(x2$date, format='%m/%d/%Y'), breaks=103,freq=TRUE)

#245 255
x <- subset(housesales, housesales$price < 255000)
hist(x$price, breaks=40)
x245_x255 <- subset(x, x$price > 245000)
hist(x245_x255$price, breaks=20)
hist(as.Date(x245_x255$date, format='%m/%d/%Y'), breaks=103,freq=TRUE)

#215 235
x <- subset(housesales, housesales$price < 235000)
hist(x$price, breaks=40)
x215_235 <- subset(x, x$price > 215000)
hist(x215_235$price, breaks=20)
hist(as.Date(x215_235$date, format='%m/%d/%Y'), breaks=103,freq=TRUE)

#qplot(date, price, data=x, col=town, geom=c("point", "smooth"), method="lm")
      
qplot(date, price, data=x, facets =.~town)

qplot(date, price, data=x, facets =.~town) + theme(legend.text=element_text(size=20))

qplot(date, price, data=x, facets =.~town) + theme(strip.text.x = element_text(size = 8, colour = "blue", angle = 90))

x3 <- subset(housesales, housesales$price < 230000)
x4 <- subset(x3, x3$price > 220000)
hist(x4$price, breaks=20)
hist(as.Date(x4$date, format='%m/%d/%Y'), breaks=103,freq=TRUE)

x240 <- subset(housesales, housesales$price < 240000)
x210_240 <- subset(x240, x240$price > 210000)
hist(x210_240$price, breaks=40)
hist(as.Date(x210_240$date, format='%m/%d/%Y'), breaks=113,freq=TRUE)

sweden <- subset(housesales, (housesales$town == "SWEDEN" | housesales$town == "CLARKSON") & housesales$price <400000)
hist(sweden$price)

webster <- subset(housesales, housesales$town == "WEBSTER" & housesales$price <400000)
hist(webster$price)

eastside <- subset(housesales, housesales$town == "WEBSTER" | housesales$town == "PENFIELD" |
                    housesales$town == "PERINTON" | housesales$town == "PITTSFORD")
cityside <- subset(housesales, housesales$town == "ROCHESTER" | housesales$town == "EROCHESTER" |
                     housesales$town == "GREECE" | housesales$town == "IRONDEQUOIT")

east250 <- subset(eastside, eastside$price < 250000)
qplot(date, price, data=east250, col=town)
qplot(date, price, data=east250, facets =.~town)

cityside <- subset(housesales, housesales$town == "ROCHESTER" | housesales$town == "EROCHESTER" |
                     housesales$town == "GREECE" | housesales$town == "IRONDEQUOIT")
city250 <- subset(cityside, cityside$price < 250000)
qplot(date, price, data=city250, col=town)
qplot(date, price, data=city250, facets =.~town)
#qplot(date, price, data=city250, facets =.~town, geom=c("point", "smooth"), method="lm")

penfield <- subset(housesales, housesales$town == "PENFIELD" & housesales$price <400000)
hist(penfield$price)
axis(side=1, at=seq(0,500,50), labels=seq(0,500,50))
r <- hist(penfield$price, breaks=8, plot=FALSE)
barplot(r$counts, names.arg=r$breaks[2:9]/1000)
plt <- seq(from=0, to=400000, by=25000)
r <- hist(penfield$price, breaks=14, plot=FALSE)
barplot(r$counts, names.arg=r$breaks[2:21]/1000)