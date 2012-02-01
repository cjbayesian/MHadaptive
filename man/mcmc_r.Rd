\name{mcmc_r}
\alias{mcmc_r}
\docType{data}
\title{
A sample object created by running Metro_Hastings().
}
\description{
Result of a Markov Chain Monte Carlo run on a simple Bayesian linear regression model. For demonstrating \code{BCI}, \code{plotMH}, and \code{mcmc_thin}
}
\usage{data(mcmc_r)}
%\format{
%  The format is:
%List of 5
% $ trace          : num [1:1961, 1:3] 3.14 2.23 2.08 1.24 3.28 ...
% $ prop_sigma     : num [1:3, 1:3] 11.3367 -1.0555 -0.0105 -1.0555 0.1062 ...
% $ par_names      : chr [1:3] "a" "b" "epsilon"
% $ DIC            : num 526
% $ acceptance_rate: num 0.431 
%}
\examples{
data(mcmc_r)
BCI(mcmc_r)
plotMH(mcmc_r)
mcmc_thin(mcmc_r)
}
\keyword{datasets}
