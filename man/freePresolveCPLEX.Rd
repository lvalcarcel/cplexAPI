\name{freePresolveCPLEX}
\alias{freePresolveCPLEX}
\alias{CPXfreepresolve}

\title{
  Free Presolved Problem From the LP Problem Object
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXfreepresolve}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  freePresolveCPLEX(env, lp)
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
  Interface to the C function \code{freePresolve} which calls the CPLEX
  function \code{CPXfreepresolve}.
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

