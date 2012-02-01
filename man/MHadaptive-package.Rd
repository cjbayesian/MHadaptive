\name{MHadaptive-package}
\alias{MHadaptive-package}
\alias{MHadaptive}
\docType{package}
\title{
General Markov Chain Monte Carlo for Bayesian Inference using adaptive Metropolis-Hastings sampling
}
\description{
Performs general Metropolis-Hastings Markov Chain Monte Carlo sampling of a user defined function which returns the un-normalized value (likelihood times prior) of a Bayesian model.  The proposal variance-covariance structure is updated adaptively for efficient mixing when the structure of the target distribution is unknown.  The package also provides some functions for Bayesian inference including Bayesian Credible Intervals (BCI) and Deviance Information Criterion (DIC) calculation. 
}
\details{
\tabular{ll}{
Package: \tab MHadaptive\cr
Type: \tab Package\cr
Version: \tab 1.1-6\cr
Date: \tab 2011-12-20\cr
License: \tab GPL (>= 3)\cr
LazyLoad: \tab yes\cr
}
This package provides a simple Metropolis-Hastings algorithm with an adaptive proposal distribution for estimating posterior distributions of Bayesian models.  The user need only define the model as a function which returns the un-normalized posterior distribution (ie. \eqn{log[L(\theta | x)P(\theta)]}{log[L(theta | x)P(theta)]}).
}
\author{
Corey Chivers <corey.chivers@mail.mcgill.ca>

}
\references{
Spiegelhalter, D. J., Best, N. G., Carlin, B. P. and Van Der Linde, A. (2002), Bayesian measures of model complexity and fit. Journal of the Royal Statistical Society: Series B (Statistical Methodology), 64: 583-639. doi: 10.1111/1467-9868.00353
}
