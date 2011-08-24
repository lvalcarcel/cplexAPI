\name{getObjOffsetCPLEX}
\alias{getObjOffsetCPLEX}
\alias{CPXgetobjoffset}

\title{
  Objective Offset Between the Original Problem and the Presolved Problem.
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXgetobjoffset}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  getObjOffsetCPLEX(env, lp)
}

\arguments{
  \item{env}{
    Pointer to an IBM ILOG CPLEX environment as returned by
    \code{\link{openEnvCPLEX}}.
  }
  \item{lp}{
    Pointer to a reduced IBM ILOG CPLEX problem object as returned by
    \code{\link{getRedLpCPLEX}}.
  }
}

\details{
  Interface to the C function \code{getObjOffset} which calls the CPLEX
  function \code{CPXgetobjoffset}.
}

\value{
  Objective offset value if successful, otherwise an instance of class
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
