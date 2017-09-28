# Example using PCS Index Data (year to date aggregate amount of total damage
# reported in the US to the insurance industry):


data(PCS)
head(PCS)
PCS.index <- PCS[,2]

PCS.lmom <- gpd.lmom(PCS.index)   # fit a GPD to the PCS.index data
PCS.lmom  # print the estimated location, scale and shape parameters

# Visualize properties of the fit:

hist(PCS.index,breaks=25,density=20,freq=F)  # show 'density' variations 10, 30
x <- seq(from=-1,to=160,length=1000)
points(x,dpareto(x,m=PCS.lmom$param.est[1],lambda=PCS.lmom$param.est[2],
                 xi=PCS.lmom$param.est[3]),type="l")
# we have plotted the histogram of the PCS.index, together with the density of 
# the Pareto distr estimated by the method of L-moments.

# Histograms and density plots do not give a clear picture of what's happening
# in the tail. 

# To check goodness of fit in the tail, we generate a large random sample
# from the distr fitted to the data, and we produce a QQ plot of the 
# Monte Carlo sample against the original data set PCS.index.

PCS.rlmom <- rpareto(n=10000,m=PCS.lmom$param.est[1],
                     lambda=PCS.lmom$param.est[2],xi=PCS.lmom$param.est[3])
qqplot(PCS.index,PCS.rlmom)
abline(0,1,col="red")
# thickness of tail was not captured properly by the estimated distr, 
# although the quantiles seem to align reasonably well with the quantiles of
# PCS.index.

# Moment estimates are not as good as max likelihood estimates:

PCS.ml <- gpd.ml(PCS.index)
PCS.ml <- PCS.ml$param.est
PCS.ml

# As before:

PCS.rml <- rpareto(n=10000,m=PCS.lmom$param.est[1],
                   lambda=PCS.lmom$param.est[2],xi=PCS.lmom$param.est[3])
qqplot(PCS.index,PCS.rml)
abline(0,1,col="red")
# results are quite good, but remember they vary according to the random sample




