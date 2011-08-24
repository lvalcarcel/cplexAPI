\name{cpxerr-class}

\docType{class}

\alias{cpxerr-class}
\alias{cpxerr}
\alias{err,cpxerr-method}
\alias{err}
\alias{as.cpxerr,cpxerr-method}
\alias{as.cpxerr}
\alias{errmsg,cpxerr-method}
\alias{errmsg}
\alias{errnum,cpxerr-method}
\alias{errnum}
\alias{errnum<-,cpxerr-method}
\alias{errnum<-}

\title{The S3 Class "cpxerr"}

\description{
  Objects of class \code{cpxerr} are returned by various functions of
  \pkg{cplexAPI}, in order to distinguish a status (error) code from a
  successfull result.
}


\section{Methods}{
  The S3 class \code{cpxerr} has one default method \code{err} which returns
  a error message string corresponding to the error code. Instances of class
  \code{cpxerr} store exactly one status code, basically an integer value.
  \describe{
    \item{\code{as.cpxerr}:}{Constructor function, gets an numeric or integer
      value and stores it as interger. This method returns instances of class
      \code{cpxerr}.}
    \item{\code{errnum}:}{Gets the error code.}
    \item{\code{errnum<-}:}{Sets the error code.}
    \item{\code{errmsg}:}{Returns an error message string corresponding to
      the error code.}
    \item{\code{err}:}{Prints an error message string corresponding to
      the error code.}
  }
}

\author{Gabriel Gelius-Dietrich}

\keyword{ classes }
\keyword{ optimize }
