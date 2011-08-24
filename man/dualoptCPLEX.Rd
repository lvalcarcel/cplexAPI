\name{dualoptCPLEX}
\alias{dualoptCPLEX}
\alias{CPXdualopt}

\title{
  Find a Problem Solution Using the Dual Simplex Algorithm
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXdualopt}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  dualoptCPLEX(env, lp)
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
  Interface to the C function \code{dualopt} which calls the CPLEX
  function \code{CPXdualopt}.
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
  \code{\link{solnInfoCPLEX}}, \code{\link{getStatCPLEX}},
  \code{\link{solutionCPLEX}}
}

\keyword{ optimize }

