\name{delTerminateCPLEX}
\alias{delTerminateCPLEX}
\alias{CPXsetterminate}

\title{
  Terminate CPLEX gracefully
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXsetterminate}.  Consult the IBM ILOG CPLEX documentation for
  more detailed information.
}

\usage{
  delTerminateCPLEX(env, tsig)
}

\arguments{
  \item{env}{
    Pointer to an IBM ILOG CPLEX environment as returned by
    \code{\link{openEnvCPLEX}}.
  }
  \item{tsig}{
    Pointer to termination signal as returned by
    \code{\link{setTerminateCPLEX}}.
  }
}

\details{
  Interface to the C function \code{setTerminate} which calls the CPLEX
  function \code{CPXsetterminate}.
}

\value{
  Zero if successful, otherwise nonzero.
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
  \code{\link{setTerminateCPLEX}}, \code{\link{printTerminateCPLEX}},
  \code{\link{chgTerminateCPLEX}}
}

\keyword{ optimize }

