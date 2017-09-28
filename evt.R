library(Rsafd)
 
mean(DSPLRet)
sd(DSPLRet)

min(DSPLRet)
(min(DSPLRet)-mean(DSPLRet))/sd(DSPLRet)  
# this move was over 23 standard deviations from the mean daily move!


#### ----- ####

# Densities of three one-sided Pareto distr with default values m=0 (location) 
# and lambda=1 (scale) and varying values of shape parameter xi:

x <- seq(from=-.2,to=15,length=5000)
plot(x,dpareto(x,xi=.2),type="l",ylab="GPD densities",ylim=c(-.05,1.1))
points(x,dpareto(x,xi=1.6),type="l",lty=3)
points(x,dpareto(x,xi=2.5),type="l",lty=5)
abline(h=0)
abline(v=0)

# two-sided Pareto distr: one-sided Pareto distr to the right of a threshold;
# one-sided negative Pareto distr to the left of a threshold;
# anything in between (usually a plain histogram).


#### ----- ####

# Densities of three Generalized Extreme Value (GEV) with default values m=0 and
# lambda=1, and varying values of the shape parameter xi:

x <- seq(from=-2.2, to=8, length=5000)
plot(x,dgev(x,xi=0.2),type="l",ylab="GEV densities",ylim=c(-0.05,0.9))
points(x,dgev(x,xi=0.6),type="l",lty=3)
points(x,dgev(x,xi=1.5),type="l",lty=5)
abline(h=0)
abline(v=0)



#### ----- ####

# Block maxima convergence:

XX <- rpareto(1000000,xi=.4)  # creates random sample of size 1,000,000 of independent
# random samples from the ordinary Pareto distr with location 0, scale 1, shape 0.4

dim(XX) <- c(1000,1000)  # splits into 1,000 blocks of length 1,000 and organizes in 
# data matrix

MAX <- apply(XX,2,max)  # computes maximum for each block, creating a sample of size 
# 1,000 of maxima M_n, with n=1,000

qqplot(MAX,rgev(1000,xi=.4))  # qq-plot of this sample of maxima against a GEV random
# sample with the same parameters
# also try xi=0.0 for gumbel distr
title("QQ plot evidence of block maxima convergence")


# The distr of the maxima converges toward a GEV distr iff cdf converges toward 1
# (see theorem 2 on page 80 for more details)  






