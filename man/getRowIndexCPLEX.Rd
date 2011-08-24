\name{getRowIndexCPLEX}
\alias{getRowIndexCPLEX}
\alias{CPXgetrowindex}

\title{
  Search for the Index Number of a Specified Row
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXgetrowindex}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  getRowIndexCPLEX(env, lp, rname)
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
  \item{rname}{
	A row name to search for.
  }
}

\details{
  Interface to the C function \code{getRowIndex} which calls the CPLEX
  function \code{CPXgetrowindex}.
}

\value{
  Specified row index if successful, otherwise an instance of class
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
