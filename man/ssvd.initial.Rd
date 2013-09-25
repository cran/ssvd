\name{ssvd.initial}
\alias{ssvd.initial}
\title{
This function is used to initialize the sparse SVD iterative method.
}
\description{
This function is used to initialize the sparse SVD iterative method. The function
selects some rows and columns of the input matrix and perform regular SVD of the
reduced the matrix with only selected rows and columns, which gives an initial
solution to the sparse SVD problem.
}
\usage{
ssvd.initial(x, method = c("theory", "method"), alpha.method = 0.05, 
alpha.theory = 1.5, huber.beta = 0.95, sigma = NA, r = 1)
}
\arguments{
  \item{x}{
  Input matrix, for which one would like to get a sparse SVD.
}
  \item{method}{
  If method = "theory", then a theoretical procedure is adopted which is based 
  on normal assumption on the noise. 
  If method = "method", then the function bypass the normal assumption by 
  some robust statistics.
  These two choices typically give similar solutions, but "theory" is much faster.
}
  \item{alpha.method}{
  Alpha.method is the level of the hypothesis test when one performs Holm 
  multiple hypothesis testing, which is used to select the candidate rows and columns.
  The value is usually set to be 0.05.
}
  \item{alpha.theory}{
  Alpha.theory is a scaler that is used when normal assumption is true, 
  method="theory", and a chisq tail bound is used to select the candidate rows and columns.
  Most of the time, users should keep it as it is.
}
  \item{huber.beta}{
  Huber.beta is a scaler which is the cut-off point in the Huber function. 
  The huberization is utilized to achieve robustness when normal assumption is violated.
}
  \item{sigma}{
  Sigma is a scaler for the noise level. The user can set it to be NA, and the 
  function will estimate it automatically.
}
  \item{r}{
  A scaler, the number of components, i.e., the number of singular vectors to be computed.
}
}
\value{
\item{u}{A matrix containing left singular vectors}
\item{v}{A matrix containing right singular vectors}
\item{d}{A vector containing singular values}
\item{sigma.hat}{An estimate of the noise level}
}
\references{
A Sparse SVD Method for High-dimensional Data
}
\author{
Dan Yang
}
\examples{
ssvd.initial(matrix(rnorm(2^15),2^7,2^8), method = "method")
}
\keyword{sparse}
\keyword{SVD}
\keyword{initialization}
\keyword{iterative}
