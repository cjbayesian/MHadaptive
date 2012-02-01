\name{positiveDefinite}


\alias{positiveDefinite}
\alias{isPositiveDefinite}
\alias{makePositiveDefinite}


\title{Positive Definite Matrixes}


\description{
    
    Checks if a matrix is positive definite and/or
    forces a matrix to be positive definite.   

}


\usage{
isPositiveDefinite(x)
makePositiveDefinite(x)
}


\arguments{

    \item{x}{
        a square numeric matrix.
        }
        
}


\details{
 
    The function \code{isPositiveDefinite} checks if a square 
    matrix is positive definite.
    
    The function \code{makePositiveDefinite} forces 
    a matrix to be positive definite.
    
    These functions were originally implimented in fUtilities
    Copyright:  (c) 1999-2008 Diethelm Wuertz and Rmetrics Foundation
    URL:        \url{http://www.rmetrics.org}
}


\author{

    Korbinian Strimmer.
    
}


\examples{
## isPositiveDefinite - 
   # is the 3x3 identity matrix positive definate?
   isPositiveDefinite(diag(c(1,1,1)))                
}


\keyword{math}

