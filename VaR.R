a <- read.csv("table.csv",header=T)

attach(a)   # database is attached to the R search path, hence objects can be accessed
            # by simply giving their names
            # obs: if you get the error "The following object is masked from...", 
            # this probably means that you had attached a number of different copies
            # of the same data frame. This is almost never a good idea -- use detach
            # before attach'ing a data frame again (presumably after you've made
            # changes in it) and use search() to check what you have attached. 

# View data
Open  # name of the variable in our csv file

n <-length(Open)
i = 1
rend <- c(0)

# Calculating logarithmic returns
while(i < n)
{s
  r <- log(Open[i]/Open[i+1],exp(1))
  rend[i] <- r
  i = i + 1
}

# A summary of the returns (in percentage)
summary(rend*100)
# View returns table
View(rend)

data <- c(length(Open),mean(Open),mean(rend),sd(rend))
names(data) <- c("Total days","Average price","Daily change","Daily volatility")
data

# Daily volatility
vol <- data[4]
# Daily average return
rendd <- data[3]

# VaR calculation
az <- 1000          # Number of stocks
value1 <- Open[1]   # Actual price
valuep <- value1*az # Value of portfolio
hp <- 1             # Holding period
a  <- .95           # Confidence level (5%)

# Parametric VaR
parvar <- abs(valuep*qnorm(1-a,0,1)*vol*sqrt(hp))
# Historical VaR
hvar <- abs(quantile(rend,1-a)*valuep)

# Vector comparing the two VarS
varv <- c(parvar,hvar)
names(varv)<- c("parametric VaR","Historical VaR")
print(varv)

detach(a)
