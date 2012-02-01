\name{mcmc_thin}
\alias{mcmc_thin}

\title{
Thin an MCMC object to reduce autocorrelation.
}

\description{
This function reduces the autocorrelation of an MCMC run from Metro_Hastings() by retaining only every <thin> iterations of the chain.
}
\usage{
mcmc_thin(mcmc_object, thin = 5)
}
\arguments{
  \item{mcmc_object}{
object returned by a call to \code{Metro_Hastings()}
}
  \item{thin}{
integer: retain only every <thin> iterations of the MCMC.
}
}

\value{
object (list) of the same type as that returned by a call to \code{Metro_Hastings()}
}

\author{
Corey Chivers <corey.chivers@mail.mcgill.ca> 
}
\seealso{
     \code{\link{Metro_Hastings}},\code{\link{BCI}}, \code{\link{plotMH}}
}
\examples{
data(mcmc_r)
## Thin the results of a simple Bayesian linear regression
mcmc_rTHINNED<-mcmc_thin(mcmc_r) 
plotMH(mcmc_rTHINNED)
}
