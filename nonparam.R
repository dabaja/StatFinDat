library(Rsafd)

head(PCS)   # notice that we could have used lazyLoad here, but importing the library 
            # allows us to use this short-cut

plot(PCS[,1],PCS[,2], type="l")  # catastrophes happen...

# PCS Index is the year-to-date aggregate amount of total damage reported in the US 
# to the insurance industry.



#### ----- ####

head(CPN)  # daily values of Calpine stocks

CPNLRet <- diff(log(CPN))  # log-return 

quantile(CPNLRet,c(.01,.05,.25,.5,.75,.95,.99))

RKS <- order(CPNLRet)
OCPNLRet <- CPNLRet[RKS]
par(mfrow=c(1,2))
plot(CPNLRet,type="l")
plot(OCPNLRet,type="l")

# Computing quantiles without using the quantile function
L <- length(OCPNLRet)
P <- 0.01 
OCPNLRet[ceiling(P*L)]   # compare to the first quantile obtained with the quantile fct
P<- 0.75
OCPNLRet[ceiling(P*L)]   # again, compare (small differences are due to using ceiling)



#### ----- ####

# Histograms

par(mfrow=c(1,2))
hist(CPNLRet)
hist(CPNLRet,breaks=25,col="blue",freq=F)
# breaks: in our case, number of cells for the histogram
# col: colour used to fill the bars
# freq: F(alse) means probability densities are plotted instead of frequencies (forces
# the area of the histogram to be one)

