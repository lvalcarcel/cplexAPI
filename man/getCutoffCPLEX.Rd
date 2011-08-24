\name{getCutoffCPLEX}
\alias{getCutoffCPLEX}
\alias{CPXgetcutoff}

\title{
  Access MIP Cutoff Value Being Used During Mixed Integer Optimization.
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXgetcutoff}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  getCutoffCPLEX(env, lp)
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
  Interface to the C function \code{getCutoff} which calls the CPLEX
  function \code{CPXgetcutoff}.
}

\value{
  Value of the cutoff if successful, otherwise an instance of class
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
