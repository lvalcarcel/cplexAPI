\name{getObjValCPLEX}
\alias{getObjValCPLEX}
\alias{CPXgetobjval}

\title{
  Access Solution Objective Value
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXgetobjval}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  getObjValCPLEX(env, lp)
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
  Interface to the C function \code{getObjVal} which calls the CPLEX
  function \code{CPXgetobjval}.
}

\value{
  Objective value if successful, otherwise an instance of class
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
