\name{primoptCPLEX}
\alias{primoptCPLEX}
\alias{CPXprimopt}

\title{
  Find a Solution to a Problem Using the Primal Simplex Method
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXprimopt}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  primoptCPLEX(env, lp)
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
  Interface to the C function \code{primopt} which calls the CPLEX
  function \code{CPXprimopt}.
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

