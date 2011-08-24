\name{objSaCPLEX}
\alias{objSaCPLEX}
\alias{CPXobjsa}

\title{
  Access Upper and Lower Sensitivity Ranges for Objective Function Coefficients
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXobjsa}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  objSaCPLEX(env, lp, begin, end)
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
    Beginning of the range of ranges to be returned.
  }
  \item{end}{
    End of the range of ranges to be returned.
  }
}

\details{
  Interface to the C function \code{objSa} which calls the CPLEX
  function \code{CPXobjsa}.
}

\value{
  If successful a list is returned:
  \item{lower }{lower range values}
  \item{upper }{upper range values}
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

