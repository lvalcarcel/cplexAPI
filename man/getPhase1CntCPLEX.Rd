\name{getPhase1CntCPLEX}
\alias{getPhase1CntCPLEX}
\alias{CPXgetphase1cnt}

\title{
	Access Number of Phase I Iterations
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXgetphase1cnt}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  getPhase1CntCPLEX(env, lp)
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
  Interface to the C function \code{getPhase1Cnt} which calls the CPLEX
  function \code{CPXgetphase1cnt}.
}

\value{
  Zero if no solution exists, otherwise Phase I iteration count.
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
