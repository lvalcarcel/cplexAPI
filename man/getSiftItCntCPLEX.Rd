\name{getSiftItCntCPLEX}
\alias{getSiftItCntCPLEX}
\alias{CPXgetsiftitcnt}

\title{
  Access Total Number of Sifting Iterations
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXgetsiftitcnt}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  getSiftItCntCPLEX(env, lp)
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
  Interface to the C function \code{getSiftItCnt} which calls the CPLEX
  function \code{CPXgetsiftitcnt}.
}

\value{
  Zero if no solution exists, otherwise nonzero the total iteration count.
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
