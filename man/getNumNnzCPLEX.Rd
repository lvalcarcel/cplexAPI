\name{getNumNnzCPLEX}
\alias{getNumNnzCPLEX}
\alias{CPXgetnumnz}

\title{
	Access the Number of Nonzero Elements in the Constraint Matrix
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXgetnumnz}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  getNumNnzCPLEX(env, lp)
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
  Interface to the C function \code{getNumNnz} which calls the CPLEX
  function \code{CPXgetnumnz}.
}

\value{
  Zero if the problem object or environment does not exist, otherwise the number
  of nonzero elements.
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
