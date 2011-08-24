\name{getBaseCPLEX}
\alias{getBaseCPLEX}
\alias{CPXgetbase}

\title{
  Access Basis Resident in a CPLEX Problem Object.
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXgetbase}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  getBaseCPLEX(env, lp)
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
  Interface to the C function \code{getBase} which calls the CPLEX
  function \code{CPXgetbase}.
}

\value{
  If successful a list is returned:
  \item{cstat }{basis status of the columns in the CPLEX problem object}
  \item{rstat }{basis status of the artificial, slack, or surplus variable
                associated with each row in the constraint matrix}
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
