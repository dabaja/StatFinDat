#Maximum Likelihood Estimators

#The case of a GEV

X <- rgev(500, lambda = 3.5, xi= 0.4)
gev.ml(X) # ignore warnings

#The case of a GPD

Y <- rpareto(500, lambda = 3.5, xi= 0.4)
gpd.ml(Y)$param.est
