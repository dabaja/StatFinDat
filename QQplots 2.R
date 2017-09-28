# R convention:

# dname: gives values of the density function
# pname: gives values of the cumulative density function
# qname: gives values of the quantiles
# rname: produces random samples


# Example: Exponential
?qexp

x <- seq(from=0, to=1,length=1024)

y <- qexp(x)
z <- pexp(y)  # notice that z=x (y is the density of x, while z is the cumulative of y)
              # obs.: think about derivatives and integrals
w <- qexp(z)  # notice that w=y 
              # obs.: think about quantiles of the cumulative
rand_exp <- rexp(1024,rate=1)  # rate is the rate lambda of the exponential distribution 


#### ----- ####

# Q-Q PLOTS:
# used to compare the relative sizes of the tails of two distributions

 # EXPONENTIAL VS LOG-NORMAL DISTRIBUTION:

 s <- seq(0, 1, length=1024) #form a sequence of numbers between 0 and 1
 x<- qexp(s, 1) #Pi_p for exp
 y<- qlnorm(s, 0, 1) #Pi_p for lognorm
 plot(x, y, type ="l", lwd ="4", col="blue", xlab ="qexp", ylab ="qlnorm", 
      main="QQ plot of lognormal versus exponential")
 abline(0, 1) #line with y-int b = 0 and slope m=1

 # NORMAL VS CAUCHY DISTRIBUTION:
 
 s<-seq(0, 1, length=1024)
 x<- qnorm(s, mean =0, sd = 1) 
 y<- qcauchy(s, location =0, scale = 1) 
 plot(x, y, type ="l", lwd ="4", col="blue")
 abline(0, 1) 
 
 # NORMAL VS T DISTRIBUTION:
 
 s <- seq(0, 1, length=1024) 
 x<- qnorm(s, mean =0, sd = 1) 
 y<- qt(s, 5) 
 plot(x, y, type ="l", lwd ="4", col="blue")
 abline(0, 1)

 # NORMAL VS T DISTRIBUTION:
 
 QQ <- function(df){
 s <- seq(0, 1, length=1024) 
 x<- qnorm(s, mean =0, sd = 1) 
 y<- qt(s, df)  # df: degrees of freedom for the t distribution
 plot(x, y, type ="l", lwd ="4", col="blue")
 abline(0, 1)
 }

 # CAUCHY VS T DISTRIBUTION:
 
 QQ1 <- function(df){
 s <- seq(0, 1, length=1024) 
 x<- qcauchy(s,0, 1) 
 y<- qt(s, df) 
 plot(x, y, type ="l", lwd ="4", col="blue")
 abline(0, 1)
 }
