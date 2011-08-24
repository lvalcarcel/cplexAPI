\name{chgProbNameCPLEX}
\alias{chgProbNameCPLEX}
\alias{CPXchgprobname}

\title{
  Change the Name of the Current Problem.
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXchgprobname}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  chgProbNameCPLEX(env, lp, probname)
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
  \item{probname}{
	The new name of the problem.
  }
}

\details{
  Interface to the C function \code{chgProbName} which calls the CPLEX
  function \code{CPXchgprobname}.
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
