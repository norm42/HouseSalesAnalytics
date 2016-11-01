## parse out house sales by month and sales range

# This was an early excercise in using for loops, the plyr package
# count does this easier


## xsale <- subset(housesales, housesales$price >= 200000 & housesales$price <= 250000)
xsale <- housesales
nummonth <- length(unique(xsale$month))
monthname <- vector(mode = "character", length = nummonth)
monthcount <- vector(mode = "integer", length = nummonth)
x1 <- unique(xsale$month)
for(i in 1:nummonth ){
  monthname[i] <- as.character(x1[i])
}
for(j in 1:length(xsale$month)){
  idx <- match(as.character(xsale$month[j]), monthname)
  monthcount[idx] <- monthcount[idx] + 1
}
tidx <- order(monthcount)
for(j in 1:length(tidx)){
  xpr <- sprintf("Num sales: %4.0d  %s", monthcount[tidx[j]], monthname[tidx[j]])
  print(xpr)
}

for(j in 1:nummonth) {
  xpr <- sprintf("%10s   %4.0d", monthname[j], monthcount[j])
  print(xpr)
}