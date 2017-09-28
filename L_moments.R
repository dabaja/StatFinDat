# Question: how do we estimate the parameters of a GEV distr?
# Answer: Maximum likelihood and method of moments are classical
# statistical procedures frequently used in estimating parameters.

# However, many heavy tail distr don't have enough moments, so we can't
# use the classical method. Hence, we will use theoretical L-moments.
# (see pg 83 in the book)

X<-rpareto(1000)  
sample.LMOM(X)
# Check against the theoretical L-moments of a GPD whose parameters
# are: location m=0, scale lambda=1, shape xi=0 (ie, standard
# exponential distr). 
# lambda1=1, lambda2=1/2, tao3=1/3, tao4=1/6 (almost match!)


# Small sample alternative:
X<-rpareto(50,xi=0.4)
PPLM <- plotting.positions(X) 
PPLM
SLM <- sample.LMOM(X)
SLM

# method of L-moments estimation of a GEV(Generalized Extreme Value) distr:
X <- rgev(500,lambda=3.5,xi=0.4)
LMOMX <- sample.LMOM(X)
LMOMX
gev.lmom(LMOMX) # check pg 88 for the formulas


# As usual, simulation example where we first estimate the L-moments from 
# a random sample from a GPD which we choose. 
# Two examples:
# 1) Location argument is provided:
X <- rpareto(500,xi=0.4)
SLM <- sample.LMOM(X)
gpd.lmom(SLM,location=0)
# 2) Sample is provided instead:
gpd.lmom(SLM,sample=X)


