\name{mipoptCPLEX}
\alias{mipoptCPLEX}
\alias{CPXmipopt}

\title{
  Find a Solution to a Mixed Integer Program
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXmipopt}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  mipoptCPLEX(env, lp)
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
  Interface to the C function \code{mipopt} which calls the CPLEX
  function \code{CPXmipopt}.
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

