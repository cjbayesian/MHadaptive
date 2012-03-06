\name{BCI}
\alias{BCI}

\title{
Bayesian Credible Interval
}

\description{
Calculate the Bayesian Credible Intervals for an mcmcMH object.
}

\usage{
BCI(mcmc_object, interval = c(0.025, 0.975))
}

\arguments{
  \item{mcmc_object}{
object returned by a call to \code{Metro_Hastings()}
}
  \item{interval}{
vector containing the percentiles over which to calculate the credible interval.  The default of \code{c(0.025,0.975)} corresponds to a 95\% BCI.
}
}

\value{
matrix of BCI values.  Each row contains the marginal BCI for each parameter, as well as the marginal posterior means. Columns correspond to the percentiles given by \code{interval}.
}
\references{
Spiegelhalter, D. J., Best, N. G., Carlin, B. P. and Van Der Linde, A. (2002), Bayesian measures of model complexity and fit. Journal of the Royal Statistical Society: Series B (Statistical Methodology), 64: 583-639. doi: 10.1111/1467-9868.00353
}
\author{
Corey Chivers <corey.chivers@mail.mcgill.ca>
}

\seealso{
     \code{\link{Metro_Hastings}},\code{\link{mcmc_thin}}, \code{\link{plotMH}}
}
\examples{
data(mcmc_r)
BCI(mcmc_r) ## 95\% BCIs of a simple Bayesian linear regression
}
