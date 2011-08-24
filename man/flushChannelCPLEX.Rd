\name{flushChannelCPLEX}
\alias{flushChannelCPLEX}
\alias{CPXflushchannel}

\title{
  Flush All Message Destinations Associated With a Channel
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXflushchannel}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  flushChannelCPLEX(env, newch)
}

\arguments{
  \item{env}{
    Pointer to an IBM ILOG CPLEX environment as returned by
    \code{\link{openEnvCPLEX}}.
  }
  \item{newch}{
    Pointer to a channel object as returned by \code{\link{addChannelCPLEX}}.
  }
}

\details{
  Interface to the C function \code{flushChannel} which calls the CPLEX
  function \code{CPXflushchannel}.
}

\value{
  \code{NULL}
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
  \code{\link{disconnectChannelCPLEX}}, \code{\link{flushStdChannelsCPLEX}},
  \code{\link{getChannelsCPLEX}}
}

\keyword{ optimize }

