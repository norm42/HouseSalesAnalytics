dftmp <- x250minus  #copy for processing
#dftmp$town <- mapvalues(dftmp$town, from="WEBSTER", to="01 webster")

MedianOrdered <- arrange(MedianSales, SalesMedian)
NumberedTowns <- vector(mode="character", length=NumTowns)
for(i in 1:NumTowns){
  t_town <- MedianOrdered$town[i]
  if(i <10){
    NumberedTowns[i] <- paste("0",as.character(i), as.character(t_town), sep="")
  } else {
    NumberedTowns[i] <- paste(as.character(i), as.character(t_town), sep="")
  }
  dftmp$town <- mapvalues(dftmp$town, from=as.character(MedianOrdered$town[i]), to=as.character(NumberedTowns[i]))
}