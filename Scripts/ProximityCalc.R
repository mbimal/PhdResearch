#Script to create a proximity matrix from a RCA matrix
RCAmat <- read.csv("D:/Academic/PhD/References/RCA2015.csv")
RCAmat <- RCAmat[,-1]
ProximityMat <- matrix(0,nrow=length(colnames(RCAmat)), ncol=length(colnames(RCAmat)))
for (x in 1:length(colnames(RCAmat)))
  for (y in 1:length(colnames(RCAmat)))
  {
    if(x == y)
      ProximityMat[x,y] <- 0
    else
      ProximityMat[x,y] <- min((sum(RCAmat[ ,x] * RCAmat[ ,y]) / colSums(RCAmat)[y]), (sum(RCAmat[ ,x] * RCAmat[ ,y]) / colSums(RCAmat)[x]))
  }
write.table(ProximityMat, file = "D:/Academic/PhD/References/Proximity2015.csv", sep = ",", col.names = NA, qmethod = "double")