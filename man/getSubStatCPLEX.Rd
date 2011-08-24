\name{getSubStatCPLEX}
\alias{getSubStatCPLEX}
\alias{CPXgetsubstat}
\title{
  Access Solution Status of the Last Subproblem Optimization
}
\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXgetsubstat}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  getSubStatCPLEX(env, lp)
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
  Interface to the C function \code{getSubStat} which calls the CPLEX
  function \code{CPXgetsubstat}.
}

\value{
  Zero if no solution exists, nonzero otherwise.
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
