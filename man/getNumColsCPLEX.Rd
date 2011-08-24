\name{getNumColsCPLEX}
\alias{getNumColsCPLEX}
\alias{CPXgetnumcols}

\title{
  Access the Number of Columns in the Constraint Matrix
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXgetnumcols}.  Consult the IBM ILOG CPLEX documentation for
  more detailed information.
}

\usage{
  getNumColsCPLEX(env, lp)
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
  Interface to the C function \code{getNumCols} which calls the CPLEX
  function \code{CPXgetnumcols}.
}

\value{
  If successful the number of variables is returned. If \code{env} or \code{lp}
  do not exist, zero is returned.
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

