\name{getRedLpCPLEX}
\alias{getRedLpCPLEX}
\alias{CPXgetredlp}

\title{
  Get a Pointer for the Presolved Problem
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXgetredlp}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  getRedLpCPLEX(env, lp)
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
  Interface to the C function \code{getRedLp} which calls the CPLEX
  function \code{CPXgetredlp}.
}

\value{
  Pointer for the presolved problem if successful, otherwise an instance of
  class \code{\link{cpxerr}}.
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
