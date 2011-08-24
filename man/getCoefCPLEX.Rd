\name{getCoefCPLEX}
\alias{getCoefCPLEX}
\alias{CPXgetcoef}

\title{
  Access a Single Constraint Matrix Coefficient
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXgetcoef}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  getCoefCPLEX(env, lp, i, j)
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
  \item{i}{
	An integer specifying the numeric index of the row.
  }
  \item{j}{
	An integer specifying the numeric index of the column.
  }
}

\details{
  Interface to the C function \code{getCoef} which calls the CPLEX
  function \code{CPXgetcoef}.
}

\value{
  Matrix coefficient value if successful, otherwise an instance of class
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
