\name{getChannelsCPLEX}
\alias{getChannelsCPLEX}
\alias{CPXgetchannels}

\title{
  Obtain Pointers to the Four Default Channels
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXgetchannels}.  Consult the IBM ILOG CPLEX documentation for
  more detailed information.
}

\usage{
  getChannelsCPLEX(env)
}

\arguments{
  \item{env}{
    Pointer to an IBM ILOG CPLEX environment as returned by
    \code{\link{openEnvCPLEX}}.
  }
}

\details{
  Interface to the C function \code{getChannels} which calls the CPLEX
  function \code{CPXgetchannels}.
}

\value{
  If successful a list is returned:
  \item{cpxresults }{address of the channel corresponding to \code{cpxresults}}
  \item{cpxwarning }{address of the channel corresponding to \code{cpxwarning}}
  \item{cpxerror }{address of the channel corresponding to \code{cpxerror}}
  \item{cpxlog }{address of the channel corresponding to \code{cpxlog}}
  otherwise an instance of class \code{\link{cpxerr}}.
}

\references{
  The IBM ILOG CPLEX home page at
  \url{https://www.ibm.com/developerworks/university/academicinitiative/}.
}

\author{
  Gabriel Gelius-Dietrich

  Maintainer: Gabriel Gelius-Dietrich <geliudie@uni-duesseldorf.de>
}

\seealso{
  \code{\link{addChannelCPLEX}}, \code{\link{delChannelCPLEX}},
  \code{\link{disconnectChannelCPLEX}}, \code{\link{flushChannelCPLEX}},
  \code{\link{flushStdChannelsCPLEX}}
}

\keyword{ optimize }

