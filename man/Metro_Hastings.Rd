\name{Metro_Hastings}
\alias{Metro_Hastings}
\alias{gettingstarted.MHadaptive}

\title{Markov Chain Monte Carlo for Bayesian Inference using adaptive Metropolis-Hastings}

\description{ 
The function \code{Metro_Hastings} performs a general Metropolis-Hastings sampling of a user defined function which returns the un-normalized value (likelihood times prior) of a Bayesian model.  The proposal variance-covariance structure is updated adaptively for efficient mixing when the structure of the target distribution is unknown.
}


\usage{
Metro_Hastings(li_func, pars, prop_sigma = NULL, 
    par_names = NULL, iterations = 50000, burn_in = 1000, 
    adapt_par = c(100, 20, 0.5, 0.75), quiet = FALSE,...)
}

\arguments{
  \item{li_func}{
user defined function (target distribution) which describes a Bayesian model to be estimated.  The function should return the un-normalized log-density function (ie. \eqn{log[L(\theta | x)P(\theta)]}{log[L(theta | x)P(theta)]}). The first argument to this function should be a vector of parameter values at which to evaluate the function.
}
  \item{pars}{
vector of initial parameter values defining the starting position of the Markov Chain.
}
  \item{prop_sigma}{
covariance matrix giving the covariance of the proposal distribution.  This matrix need not be positive definite.  If the covariance structure of the target distribution is known (approximately), it can be given here. If not given, the diagonal will be estimated via the Fisher information matrix.
}
  \item{par_names}{
character vector providing the names of each parameter in the model.
}
  \item{iterations}{
integer: number of iterations to run the chain for. Default \code{50000}.
}
  \item{burn_in}{
integer: discard the first \code{burn_in} values. Default \code{100}.
}
  \item{adapt_par}{
vector of tuning parameters for the proposal covariance adaptation. Default is \code{c(100, 20, 0.5, 0.75)}.  The first element determines after which iteration to begin adaptation.  The second gives the frequency with which updating occurs.  The third gives the proportion of the previous states to include when updating (by default 1/2).  Finally, the fourth element indicates when to stop adapting (default after 75\% of the iterations).
}
  \item{quiet}{
logical: set to TRUE to suppress printing of chain status.
}
  \item{\dots}{
additional arguments to be passed to \code{li_func}.
}
}

\value{
  \item{trace}{matrix containing the Markov Chain}
  \item{prop_sigma}{adapted covariance matrix of the proposal distribution}
  \item{par_names}{character vector of the parameter names}
  \item{DIC}{Deviance Information Criteria}
  \item{acceptance_rate}{proportion of times proposed jumps were accepted}
} 

\author{
Corey Chivers <corey.chivers@mail.mcgill.ca>
}
\note{
While \code{Metro_Hastings} has an adaptive proposal structure built in, if \code{prop_sigma} differs greatly from the covariance structure of the target distribution, stationarity may not be achieved.  
}


\seealso{
\code{\link{mcmc_thin}}, \code{\link{plotMH}},\code{\link{BCI}}  
}
\examples{

### A LINEAR REGRESSION EXAMPLE ####
## Define a Bayesian linear regression model
li_reg<-function(pars,data)
{
    a<-pars[1]      #intercept
    b<-pars[2]      #slope
    sd_e<-pars[3]   #error (residuals)
    if(sd_e<=0){return(NaN)}
    pred <- a + b * data[,1]
    log_likelihood<-sum( dnorm(data[,2],pred,sd_e, log=TRUE) )
    prior<- prior_reg(pars)
    return(log_likelihood + prior)
}

## Define the Prior distributions
prior_reg<-function(pars)
{
    a<-pars[1]          #intercept
    b<-pars[2]          #slope  
    epsilon<-pars[3]    #error

    prior_a<-dnorm(a,0,100,log=TRUE)     ## non-informative (flat) priors on all 
    prior_b<-dnorm(b,0,100,log=TRUE)     ## parameters.  
    prior_epsilon<-dgamma(epsilon,1,1/100,log=TRUE)      

    return(prior_a + prior_b + prior_epsilon)
}

# simulate data
x<-runif(30,5,15)
y<-x+rnorm(30,0,5)
d<-cbind(x,y)


mcmc_r<-Metro_Hastings(li_func=li_reg,pars=c(0,1,1),
    par_names=c('a','b','epsilon'),data=d)

##  For best results, run again with the previously 
##  adapted variance-covariance matrix.

mcmc_r<-Metro_Hastings(li_func=li_reg,pars=c(0,1,1),
    prop_sigma=mcmc_r$prop_sigma,par_names=c('a','b','epsilon'),data=d)

mcmc_r<-mcmc_thin(mcmc_r)
plotMH(mcmc_r)
}
