## parse out house sales by location, print total number of sales

# This was an early excercise in using for loops, the plyr package
# count does this easier

## xsale <- subset(housesales, housesales$price >= 200000 & housesales$price <= 250000)
xsale <- subset(housesales, housesales$price >= 200000)
numtown <- length(unique(xsale$town))
townname <- vector(mode = "character", length = numtown)
towncount <- vector(mode = "integer", length = numtown)
x1 <- unique(xsale$town)
for(i in 1:numtown ){
  townname[i] <- as.character(x1[i])
}
for(j in 1:length(xsale$town)){
  idx <- match(as.character(xsale$town[j]), townname)
  towncount[idx] <- towncount[idx] + 1
}
tidx <- order(towncount)
for(j in 1:length(tidx)){
  xpr <- sprintf("Num sales: %4.0d  %s", towncount[tidx[j]], townname[tidx[j]])
  print(xpr)
}