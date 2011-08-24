\name{completelpCPLEX}
\alias{completelpCPLEX}
\alias{CPXcompletelp}

\title{
  Manage Modification Steps Closely
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXcompletelp}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  completelpCPLEX(env, lp)
}

\arguments{
  \item{env}{
    Pointer to an IBM ILOG CPLEX environment as returned by
    \code{\link{openEnvCPLEX}}.
  }
  \item{lp}{
    Pointer to an IBM ILOG CPLEX problem object as returned by
    \code{\link{initProbCPLEX}}.
  }
}

\details{
  Interface to the C function \code{completelpCPLEX} which calls the CPLEX
  function \code{CPXcompletelp}.
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

\keyword{ optimize }
