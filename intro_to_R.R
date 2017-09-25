# Check/change working directory:
getwd()
setwd("path...")
# can also be done using ctrl+shift+H


#### Creating R objects ####
# Creates a vector of length 16 containing the first 16 integers in increasing order:
x <- 1:16

# Same:
y <- seq(from=1, to=16, by=1)

# To know what the function seq does:
help(seq)

# If you type the name of the function or method without parentheses, 
# the system will return the R code of the function in question:
objects() # lists objects in the workspace
objects   # gives code for this function

dim(x) <- c(8,2)  # Organizes the 1-dim vector in a 8x2 matrix
                  # the function c is used for concatenation
class(x)  # all objects created by R have a class atribute, which can be retrieved
          # by using the function class

z <- x*x  # creates a new R object which is also a 8x2 matrix obtained by multiplying
          # entry by entry
Z <- x%*%x    # usual matrix product ('Error: non-conformable arguments' means we 
              # can't multiply these two matrices due to dimension problems)
Z1 <- x%*%t(x)  # 8x8 matrix
Z2 <- t(x)%*%x  # 2x2 matrix
# t stands for transpose of the matrix

rm(x) # removes objects; used to save memory 
rm(y,z)

dump(c("Z1", "Z2"), "mymatrices")   # dump produces text representations of objects
# dump needs 2 parameters: vectors of names of objects to be found in the workspace,
# and file name to dump the representations to. 


#### Random Generation and White Noise ####

WN <- rnorm(1024)     # create vector of length 1024
help(rnorm)
WN2 <- rnorm(1024,5.0,4.0)

plot(WN, type = "l")  # produce sequential plot of the entries of this vector

graphics.off()
par("mar")
par(mar=c(1,1,1,1))


par(mfrow = c(2,1))
# mfrow=c(nrows, ncols) to create a matrix of nrows x ncols plots that are filled
# in by row. mfcol=c(nrows, ncols) fills in the matrix by columns.
plot(WN,type="l")
plot(WN[1:64],type="l") # notice the slicing


#### More functions and for loops ####

RW <- cumsum(WN) # cumsum is the discrete analogue to integration, just as diff is
                 # the discrete analogue to differentiation
plot(RW,type="l") # Sample of size 1024 from a Random Walk

# Create an object from Samualson's model for stocks:
DELTAT <- 1/252
SIG <- .2*sqrt(DELTAT)
MU <- .15*DELTAT
TIME <- (1:1024)/252  # expressed in years
STOCK <- rep(0,1024)  # initial zero vector for the stock

for (I in 1:1024) 
  STOCK[I] <- exp(SIG*RW[I]+MU*TIME[I])

# To avoid the 'for' loop (and save time):
STOCK <- exp(SIG*RW+MU*TIME)

plot(RW, type="l")
title("Sample of size 1024 from a Random Walk")
plot(TIME, STOCK,type="l")
title("Corresponding Geometric Random Walk with Drift")


#### Importing Data ####

# Installing packages (please download the Rsafd file first):
install.packages(c("timeDate","mvtnorm","quadprog","quantreg","rgl","robustbase","scatterplot3d","SparseM","tseries"))


# Fix libraries that are used very frequently:
.First()
fix(.First)
# library(Rsafd)
# cat("\n Welcome to my world\n\n")

attach(hills) # see item in INDEX file
plot(climb,time)
plot(dist,time)


#### Importing data from .rdb file ####

setwd("path...\\Rsafd\\Rsafd\\data")
readRDS("Rdata.rds")  # see metadata


lazyLoad(filebase = "path...\\Rsafd\\Rsafd\\data\\Rdata",
         envir = parent.frame())


find(HOWAREYOU)
head(HOWAREYOU)


#### Getting data from the Web via Excel ####
toronto <- read.csv("path...\\file.csv")

class(toronto)
dim(toronto)
head(toronto) # notice the reversed order
tail(toronto) 
toronto.close <- toronto[,4]  # closing price is in the 4th column
plot(toronto.close,type="l")
tsx <-rev(toronto.close)  # reverses the order of the data
plot(tsx,type="l")



#### First Function ####
# e.g. Black-Scholes formula

S <- 100  # price of the underlying asset
K <- S  # at-the-money option
R <- .1  # interest rate
SIG <- .2  #annualized volatility
TAU <- 90/252  # time to maturity (90 days) in years

d1 <- log(S/K) + TAU*(R+SIG^2/2)
d1 <- d1/(SIG*sqrt(TAU))
d2 <- d1 - SIG*sqrt(TAU)

C <- S*pnorm(d1) - K*exp(-R*TAU)*pnorm(d2)


# Building a function:

# 1) Create a .txt file that contains the function and then call
# it using 'source'.
source('bs_call_test.txt')

# 2) Local function:

bs_call <- function (TAU=90/252,K=100,S=100,R=.1,SIG=.2) 
{
  # Parameters:   TAU - time to maturity in years
  #               K - strike
  #               S - current value of the underlying
  #               R - yearly interest rate
  #               SIG - annualized volatility
  # Return: Black-Scholes call price
  
  d1 <- log(S/K) + TAU*(R+SIG^2/2)
  d1 <- d1/(SIG*sqrt(TAU))
  d2 <- d1 - SIG*sqrt(TAU)
  
  C <- S*pnorm(d1) - K*exp(-R*TAU)*pnorm(d2)
  return(C)
  
}

# 3) Global function:

fix(bs_call)  # define a function by copying the local function above on the pop-up window



# Using the function:
bs_call() # use the function with default values
bs_call(TAU=60/252) # change one or more of the default values







