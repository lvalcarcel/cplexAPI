\name{getObjNameCPLEX}
\alias{getObjNameCPLEX}
\alias{CPXgetobjname}

\title{
	Access the Name of the Objective Row of a CPLEX Problem Object
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXgetobjname}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  getObjNameCPLEX(env, lp)
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
  Interface to the C function \code{getObjName} which calls the CPLEX
  function \code{CPXgetobjname}.
}

\value{
  Name of the objective row if successful, otherwise an instance of class
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
