\name{chgObjCPLEX}
\alias{chgObjCPLEX}
\alias{CPXchgobj}

\title{
  Change Linear Objective Coefficients
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXchgobj}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  chgObjCPLEX(env, lp, ncols, ind, val)
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
  \item{ncols}{
    Number of bounds to be changed.
  }
  \item{ind}{
    Indices of bounds to be changed.
  }
  \item{val}{
	A vector containing the new values of the objective coefficients of the
	variables specified in \code{ind}.
  }
}

\details{
  Interface to the C function \code{chgObj} which calls the CPLEX
  function \code{CPXchgobj}.
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
