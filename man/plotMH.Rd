\name{plotMH}
\alias{plotMH}
\title{
Plot MCMC results of a call to Metro_Hastings().
}
\description{
This function plots histograms and traces of each parameter of the Bayesian model.
}
\usage{
plotMH(mcmc_object, correlogram = TRUE)
}

\arguments{
  \item{mcmc_object}{
an object returned by a call to \code{Metro_Hastings()}
}
  \item{correlogram}{
logical: if TRUE, plots a pairwise correlogram of each parameter in the model.
}
}

\value{
NULL
}
\author{
Corey Chivers <corey.chivers@mail.mcgill.ca>
}


\seealso{
     \code{\link{Metro_Hastings}},\code{\link{BCI}}, \code{\link{mcmc_thin}}
}
\examples{
data(mcmc_r)
plotMH(mcmc_r) ## Plot the results of a simple Bayesian linear regression
}
