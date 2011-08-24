\name{getColsCPLEX}
\alias{getColsCPLEX}
\alias{CPXgetcols}

\title{
  Accesses a Range of Columns of the Constraint Matrix
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXgetcols}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  getColsCPLEX(env, lp, begin, end)
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
  \item{begin}{
	An integer specifying the beginning of the range of columns to be returned.
  }
  \item{end}{
	An integer specifying the end of the range of columns to be returned.
  }
}

\details{
  Interface to the C function \code{getCols} which calls the CPLEX
  function \code{CPXgetcols}.
}

\value{
  If successful a list is returned:
  \item{matbeg }{Array that specifies the nonzero elements of the columns.
                 Consult the IBM ILOG CPLEX documentation for more detailed
                 information.}
  \item{matind }{Array that specifies the nonzero elements of the columns.
                 Consult the IBM ILOG CPLEX documentation for more detailed
                 information.}
  \item{matval }{Array that specifies the nonzero elements of the columns.
                 Consult the IBM ILOG CPLEX documentation for more detailed
                 information.}
  otherwise an instance of class \code{\link{cpxerr}}.
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
