\name{ssvd-package}
\alias{ssvd-package}
\docType{package}
\title{
Sparse SVD
}
\description{
Obtain sparse SVD using fast iterative thresholding method, together with 
a fast initialization algorithm
}
\details{
\tabular{ll}{
Package: \tab ssvd\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2013-09-25\cr
License: \tab GPL (>= 2)\cr
}
There are three main functions of the package: ssvd, ssvd.initial, 
and ssvd.iter.thresh
}
\author{
Dan Yang <dyang@stat.rutgers.edu>
}
\references{
A Sparse SVD Method for High-dimensional Data
}
\keyword{sparse}
\keyword{SVD}
\keyword{iterative}
\keyword{thresholding}
\examples{
ssvd(matrix(rnorm(2^15),2^7,2^8), method = "method")
ans.initial <- ssvd.initial(matrix(rnorm(2^15),2^7,2^8), method = "method")
ans.iter <- ssvd.iter.thresh(matrix(rnorm(2^15),2^7,2^8), 
u.old=ans.initial$u, v.old= ans.initial$v, method = "method")
}
