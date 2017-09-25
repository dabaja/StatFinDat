library(Rsafd)


# Generating random samples

GWN <- rnorm(1024)
CWN <- rcauchy(1024)
par(mfrow=c(2,1))
plot(GWN,type="l")
title("Sequential plot of a standard Gaussian sample")
plot(CWN,type="l")
title("Sequential plot of a standard Cauchy sample")
par(mfrow=c(1,1))

# Notice that the relative size of extreme values of the Cauchy sample forces
# the bulk of the other points to be crammed together (look at axis values), giving 
# the false impression that they are trying to line up along the horizontal axis.

# remember the QQ-plot Cauchy vs Normal!



# Monte Carlo simulation for call price:

Call <- function(N=10000, TAU=0.04, K=3.36, S=3.36, R=0.024, SIG=0.6) {
  ML <- log(S) + TAU*(R-SIG^2/2)   # mean of the log-normal distr
  SL <- SIG*sqrt(TAU)   # standard deviation of the log-normal distr
  XX <- rlnorm(N, meanlog = ML, sdlog = SL)   # generate vector of N random 
                                              # log-normal points
  PSIX <- pmax(XX-K, 0) # parallel maxima (obtains maximum of each line in the vector)
  MC_call <- exp(-R*TAU)*mean(PSIX)   # the price of the option is given by the 
                                      # risk neutral expectation of the discounted
                                      # expected payoff
  MC_call
}

Call()  # run several times and compare with result of bscall()
bscall(TAU=0.04, K=3.36, S=3.36, R=0.024, SIG=0.6)








