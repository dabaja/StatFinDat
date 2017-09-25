library(Rsafd)
?WSP 
#Weekly quotes of the S&P 500 index from January 3, 1950 to August 16, 2010.

head(WSP)
tail(WSP)
length(WSP)

WSPLRet <- diff(log(WSP))
head(WSPLRet)
N <- length(WSPLRet)

par(mfrow=c(1, 2))
plot(WSP.ts)
plot(WSPLRet)
par(mfrow=c(1, 1))

par(mfrow=c(1, 2))
plot(WSP.ts)
plot(WSPLRet, type ="l")
par(mfrow=c(1, 1))

hist(WSPLRet, col="blue", border="yellow", breaks=12)

DENS1 <- density(WSPLRet,  bw =0.1)   # bw: smoothing bandwidth
plot(DENS1, lwd = "4")   # lwd: linewidth relative to default

DENS2 <- density(WSPLRet, bw =0.1, kernel="gaussian")
plot(DENS2, lwd = "4")

DENS3 <- density(WSPLRet, bw =0.1, kernel="rectangular")
plot(DENS3, lwd = "4")

DENS4 <- density(WSPLRet, bw =0.1, kernel="triangular")
plot(DENS4, lwd = "4")
 
par(mfrow=c(1, 3))
plot(DENS2, lwd = "4")
plot(DENS3, lwd = "4")
plot(DENS4, lwd = "4")
par(mfrow=c(1, 1))

chbw <- function(b){
DENS2 <- density(WSPLRet, bw =b, kernel="gaussian")
 plot(DENS2, lwd = "4")
}

# Compare histogram and kernel density
DENS <- density(WSPLRet)
hist(WSPLRet,breaks=25,col="blue",freq=F,ylim=c(0,30),main="Histogram and Kernel Density Estimator")
lines(DENS$x,DENS$y)

# Differences:
# 1) bumps are rectangular in the histogram, and are given by the shape of the graph 
# of the kernel function in the case of kernel estimate
# 2) location of the bumps are fixed more or less independently of the data for the 
# histogram, and centered around the data points for the case of kernel estimate
# 3) smoothness: is determined by the number and size of the bins for histogram,
# and by the value of the bandwidth b>0 in the case of kernel estimate.



#### ----- ####

qqnorm(WSPLRet)  # qq-plot for the log-returns of WSP vs normal distr

Mean <- mean(WSPLRet)
St <- sd(WSPLRet)
N <- length(WSPLRet)

ndata <- rnorm(N, Mean, St)  # generate random sample from the normal distr
qqplot(ndata, WSPLRet, type ="l", col="blue", lwd ="4")
abline(0,1, col="red", lwd ="4")


