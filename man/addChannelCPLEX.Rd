\name{addChannelCPLEX}
\alias{addChannelCPLEX}
\alias{CPXaddchannel}

\title{
  Instantiates a New Channel Object
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXaddchannel}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  addChannelCPLEX(env)
}

\arguments{
  \item{env}{
    Pointer to an IBM ILOG CPLEX environment as returned by
    \code{\link{openEnvCPLEX}}.
  }
}

\details{
  Interface to the C function \code{addChannel} which calls the CPLEX
  function \code{CPXaddchannel}.
}

\value{
  If successful, addChannelCPLEX returns a pointer to the new channel object;
  otherwise, it returns \code{NULL}.
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
  \code{\link{delChannelCPLEX}}, \code{\link{disconnectChannelCPLEX}},
  \code{\link{flushChannelCPLEX}}, \code{\link{flushStdChannelsCPLEX}},
  \code{\link{getChannelsCPLEX}}
}

\keyword{ optimize }

