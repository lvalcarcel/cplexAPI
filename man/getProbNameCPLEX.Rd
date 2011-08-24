\name{getProbNameCPLEX}
\alias{getProbNameCPLEX}
\alias{CPXgetprobname}

\title{
  Access Problem Name
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXgetprobname}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
	getProbNameCPLEX(env, lp)
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
  Interface to the C function \code{getProbName} which calls the CPLEX
  function \code{CPXgetprobname}.
}

\value{
  Name of the problem if successful, otherwise an instance of class
  \code{\link{cpxerr}}.
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
