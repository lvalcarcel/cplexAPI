\name{cLpWriteCPLEX}
\alias{cLpWriteCPLEX}
\alias{CPXclpwrite}

\title{
  Write an LP Format File Containing Identified Conflict
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXclpwrite}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
	cLpWriteCPLEX(env, lp, fname)
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
  \item{fname}{
	Single character value giving the filname to write to.
  }
}

\details{
  Interface to the C function \code{cLpWriteCPLEX} which calls the CPLEX
  function \code{CPXclpwrite}.
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
