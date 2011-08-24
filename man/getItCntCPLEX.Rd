\name{getItCntCPLEX}
\alias{getItCntCPLEX}
\alias{CPXgetitcnt}

\title{
  Access the Total Number of Simplex Iterations to Solve an LP Problem
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXgetitcnt}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  getItCntCPLEX(env, lp)
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
  Interface to the C function \code{getItCnt} which calls the CPLEX
  function \code{CPXgetitcnt}.
}

\value{
  Total iteration count if  solution exists, otherwise zero.
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
