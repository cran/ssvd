\name{ssvd.iter.thresh}
\alias{ssvd.iter.thresh}
\title{
Iterative thresholding sparse SVD
}
\description{
The function computes sparse SVD by iterative thresholding algorithm with an initializtion as one of the inputs
}
\usage{
ssvd.iter.thresh(x, method = c("theory", "method"), u.old, v.old, 
gamma.u = sqrt(2), gamma.v = sqrt(2), dothres = "hard", r = ncol(u.old), 
tol = 1e-08, n.iter = 100, n.boot = 100, sigma = NA, non.orth = FALSE)
}
\arguments{
  \item{x}{
  Input matrix, for which one would like to get a sparse SVD.
}
  \item{method}{
  If method = "theory", then a theoretical procedure is adopted which is based on normal assumption on the noise. 
  If method = "method", then the function bypass the normal assumption by some robust statistics.
  These two choices typically give similar solutions, but "theory" is much faster.
}
  \item{u.old}{
  A matrix that contains initial left singular vectors as the columns of the matrix.
}
  \item{v.old}{
  A matrix that contains initial right singular vectors as the columns of the matrix.
}
  \item{gamma.u}{
  When the method="theory", gamma.u=sqrt(2) corresponds to the sqrt(2 log(p)), which is the largest magnitude of p iid standard normals. 
  If gamma.u is manually set to be smaller or larger than sqrt{2}, the left singular vectors will be denser or sparser respectively.
}
  \item{gamma.v}{
  When the method="theory", gamma.u=sqrt(2) corresponds to the sqrt(2 log(p)), which is the largest magnitude of p iid standard normals. 
  If gamma.u is manually set to be smaller or larger than sqrt{2}, the right singular vectors will be denser or sparser respectively.
}
  \item{dothres}{
  Dothres has two choices, either "hard" or "soft", which means hard-thresholding or soft-thresholding
}
  \item{r}{
  A scaler, the number of components, i.e., the number of singular vectors to be computed.
}
  \item{tol}{
  The tolerance level that determines when the algorithm stops.
}
  \item{n.iter}{
  Maximum number of iterations allowed.
}
  \item{n.boot}{
  Number of bootstrap to estimate the threshold level when method = "method"
}
  \item{sigma}{
  Sigma is a scaler for the noise level. The user can set it to be NA, and the function will estimate it automatically.
}
  \item{non.orth}{
  If non.orth=TRUE, then the last iteration of the algorithm will not involve orthoganolization, which should produce sparse solutions.
}
}
\value{
\item{u}{A matrix containing left singular vectors}
\item{v}{A matrix containing right singular vectors}
\item{d}{A vector containing singular values}
\item{niter}{Number of iterations for the algorithm to converge}
\item{sigma.hat}{An estimate of the noise level}
\item{dist.u}{The distance between the left singular vectors of the last two iterations, can be used to see whether the algorithm indeed converges.}
\item{dist.v}{The distance between the right singular vectors of the last two iterations, can be used to see whether the algorithm indeed converges.}
}
\references{
A Sparse SVD Method for High-dimensional Data
}
\author{
Dan Yang
}
\examples{
ans.initial <- ssvd.initial(matrix(rnorm(2^15),2^7,2^8), method = "method")
ans.iter <- ssvd.iter.thresh(matrix(rnorm(2^15),2^7,2^8), 
u.old=ans.initial$u, v.old= ans.initial$v, method = "method")
}
\keyword{sparse}
\keyword{SVD}
\keyword{iterative}
\keyword{thresholding}
