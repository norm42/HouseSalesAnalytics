# License:  Free to use.  Norm Zeck
# These are the data plots used to analyze the sales data in the Rochester Area

datatoplot = x250minus

qplot(date, price, data=datatoplot, facets =.~town) + theme(strip.text.x = element_text(size = 8, colour = "blue", angle = 90))

ggplot(data=datatoplot, aes(x=reorder(town, price, FUN=median), y=price))+geom_boxplot()+ theme(axis.text.x = element_text(angle = 90, hjust = 1))

# some east side plots
qplot(date, price, data=x100_150, col=town)
qplot(date, price, data=x150_200, col=town)
qplot(date, price, data=x200_250, col=town)
qplot(date, price, data=east250, col=town)
qplot(date, price, data=east250, facets =.~town)

qplot(date, price, data=webster, col=town)
qplot(date, price, data=webster200250, col=town)

qplot(date, price, data=webster200250, col=town, theme(axis.text.x = element_text(angle = 90, hjust = 1)))

hist(x210_240$price, breaks=40, freq=TRUE, main="Sales Frequency $210k to $240k")

hist(as.Date(webster200250$date, format='%m/%d/%Y'), breaks=20,freq=TRUE, main="Webster Sales $200k to $250k", xlab = "Date")

hist(as.Date(webster$date, format='%m/%d/%Y'), breaks=15,freq=TRUE, main="Webster Sales Frequency", xlab = "Date")

hist(sweden$price, breaks=40, freq=TRUE, main="Sweden Sales Frequency", xlab="Price")

